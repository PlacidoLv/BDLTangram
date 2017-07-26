//
//  CategoryViewController.m
//  TangramCategoryVCDemo
//
//  Created by lv on 2017/7/25.
//  Copyright © 2017年 bdl. All rights reserved.
//

#import "CategoryViewController.h"
#import <Tangram/TangramView.h>
#import <Tangram/TangramDefaultDataSourceHelper.h>
#import <Tangram/TangramDefaultItemModelFactory.h>
#import <Tangram/TangramContext.h>
#import <Tangram/TangramEvent.h>
#import <Tangram/TangramSafeMethod.h>
#import "CategoryElement.h"
#import <Tangram/TangramFlowLayout.h>
#import <Tangram/TangramDefaultItemModel.h>
#import "TangramSingleAndDoubleLayout.h"

@interface CategoryViewController ()<TangramViewDatasource>

@property (nonatomic, strong) NSMutableArray *layoutModelArray;

@property (nonatomic, strong) NSMutableArray *modelArray;

@property (nonatomic, strong) TangramView    *tangramView;

@property (nonatomic, strong) NSArray *layoutArray;

@property  (nonatomic, strong) TangramBus *tangramBus;

@end

@implementation CategoryViewController

- (instancetype)initWithCategoryType:(NSString *)type json:(NSString *)categoryJson
{
    self = [super init];
    if (self) {
        self.categoryType = type;
        self.categoryJson = categoryJson;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self tangramView];
    [self registElement];
    [self registEvent];
    [self.tangramView reloadData];
}



-(void)setCategoryJson:(NSString *)categoryJson
{
    _categoryJson = categoryJson;
}


-(void)registElement
{
    if (self.categoryJson == nil)
    {
        NSAssert(NO, @"json不能为空！");
        return;
    }
    
    NSData *data = [self.categoryJson dataUsingEncoding:NSUTF8StringEncoding];
    
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    self.layoutModelArray = arr;
    
    if (self.categoryType == nil)
    {
        NSAssert(YES, @"请设置分类type！");
    }
    
    [TangramDefaultItemModelFactory registElementType:self.categoryType className:@"CategoryElement"];
    self.layoutArray = [TangramDefaultDataSourceHelper layoutsWithArray:self.layoutModelArray tangramBus:self.tangramBus];
    

}
- (void)registEvent
{
    [self.tangramBus registerAction:@"responseToClickEvent:" ofExecuter:self onEventTopic:@"jumpAction"];
}

- (void)responseToClickEvent:(TangramContext *)context
{
    NSString *index = [context.event.params tgrm_stringForKey:@"index"];
    
    NSLog(@"Click index = %@", index);
}

- (NSUInteger)numberOfLayoutsInTangramView:(TangramView *)view
{
    return self.layoutArray.count;
}

- (UIView<TangramLayoutProtocol> *)layoutInTangramView:(TangramView *)view atIndex:(NSUInteger)index
{
    UIView<TangramLayoutProtocol> * layout = [self.layoutArray objectAtIndex:index];
    
    NSLog(@"class = %@", [layout class]);

    return layout;
}

- (NSUInteger)numberOfItemsInTangramView:(TangramView *)view forLayout:(UIView<TangramLayoutProtocol> *)layout
{
    return layout.itemModels.count;
}


- (NSObject<TangramItemModelProtocol> *)itemModelInTangramView:(TangramView *)view forLayout:(UIView<TangramLayoutProtocol> *)layout atIndex:(NSUInteger)index
{
    
    NSObject<TangramItemModelProtocol> * model =  [layout.itemModels objectAtIndex:index];
    if ([model isKindOfClass:[TangramDefaultItemModel class]])
    {
        TangramDefaultItemModel *m = (TangramDefaultItemModel *)model;
        m.heightFromElement = self.view.frame.size.height;
        m.index = index;
    }
    return model;;
}

- (UIView *)itemInTangramView:(TangramView *)view withModel:(NSObject<TangramItemModelProtocol> *)model forLayout:(UIView<TangramLayoutProtocol> *)layout atIndex:(NSUInteger)index
{
    UIView *reuseableView = [view dequeueReusableItemWithIdentifier:model.reuseIdentifier ];
    
    if (reuseableView) {
        reuseableView =  [TangramDefaultDataSourceHelper refreshElement:reuseableView byModel:model layout:layout tangramBus:self.tangramBus];
    }
    else
    {
        reuseableView =  [TangramDefaultDataSourceHelper elementByModel:model layout:layout tangramBus:self.tangramBus];
    }
    
    if ([model isKindOfClass:[TangramDefaultItemModel class]])
    {
        TangramDefaultItemModel *m = (TangramDefaultItemModel *)model;
    
        if (m.index == 0)
        {
            if ([reuseableView isKindOfClass:[CategoryElement class]])
            {
                CategoryElement *element = (CategoryElement *)reuseableView;
                element.leftCellType = self.leftCellType;
            }
        }
        
        if (m.index == 1)
        {
            if ([reuseableView isKindOfClass:[CategoryElement class]])
            {
                CategoryElement *element = (CategoryElement *)reuseableView;
                element.leftCellType = self.rightCellType;
            }
        }
    }
    
    return reuseableView;
}


- (TangramBus *)tangramBus
{
    if (nil == _tangramBus) {
        _tangramBus = [[TangramBus alloc]init];
    }
    return _tangramBus;
}
-(NSMutableArray *)modelArray
{
    if (nil == _modelArray) {
        _modelArray = [[NSMutableArray alloc]init];
    }
    return _modelArray;
}

-(TangramView *)tangramView
{
    if (nil == _tangramView) {
        _tangramView = [[TangramView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _tangramView.frame = self.view.bounds;
        _tangramView.scrollEnabled = NO;
        [_tangramView setDataSource:self];
        _tangramView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_tangramView];
    }
    
    return _tangramView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
