//
//  CategoryElement.m
//  TangramCategoryVCDemo
//
//  Created by lv on 2017/7/25.
//  Copyright © 2017年 bdl. All rights reserved.
//

#import "CategoryElement.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIView+Tangram.h"
#import "TangramEvent.h"
#import <Tangram/TangramSafeMethod.h>

#define RowHeight 100.0f

@interface CategoryElement()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, retain)UITableView *tableView;
@property(nonatomic, retain)NSMutableArray *arrData;

@end

@implementation CategoryElement

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self addTarget:self action:@selector(clickedOnElement) forControlEvents:UIControlEventTouchUpInside];
        self.clipsToBounds = YES;
    }
    return self;
}

-(UITableView *)tableView
{
    if(_tableView == nil)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
    }
    
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"testElemnt";
    
    CategoryLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[CategoryLeftTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
//    cell.userInteractionEnabled = NO;
    
    NSDictionary *dic = self.arrData[indexPath.row];
    cell.cellType = self.leftCellType;
    cell.cellHeight = RowHeight;
    cell.dicData = dic;
    [tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TangramEvent *event = [[TangramEvent alloc]initWithTopic:@"jumpAction" withTangramView:self.inTangramView posterIdentifier:@"singleImage" andPoster:self];
    [event setParam:[NSString stringWithFormat:@"%zd", indexPath.row] forKey:@"index"];
//    [event setParam:self forKey:@"element"];
    [self.tangramBus postEvent:event];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return RowHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return .001f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return .001f;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    if (frame.size.width > 0 && frame.size.height > 0) {
        [self mui_afterGetView];
    }
}

-(void)setTangramItemModel:(TangramDefaultItemModel *)tangramItemModel
{
    _tangramItemModel = tangramItemModel;
    self.arrData = [_tangramItemModel bizValueForKey:@"data"];
    [self.tableView reloadData];
    
    NSLog(@"_tangramItemModel.styleKeys = %@", [_tangramItemModel bizValueForKey:@"data"]);
    NSLog(@"_tangramItemModel.bizKeys = %@", _tangramItemModel.bizKeys);
}

- (void)mui_afterGetView
{
    _tableView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

- (void)clickedOnElement
{

}

+ (CGFloat)heightByModel:(TangramDefaultItemModel *)itemModel;
{
    return 200.f;
}


@end
