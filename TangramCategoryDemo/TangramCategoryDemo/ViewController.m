//
//  ViewController.m
//  TangramCategoryDemo
//
//  Created by lv on 2017/7/26.
//  Copyright © 2017年 bdl. All rights reserved.
//

#import "ViewController.h"
#import "CategoryViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *categoryString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TangramMock" ofType:@"json"] encoding:NSUTF8StringEncoding error:nil];
    CategoryViewController *categoryVC = [[CategoryViewController alloc] initWithCategoryType:@"10" json:categoryString];
    categoryVC.leftCellType = CategoryLeftCellTypeImageBottom;
    categoryVC.rightCellType = CategoryLeftCellTypeImageLeft;
    categoryVC.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:categoryVC.view];
    [self addChildViewController:categoryVC];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
