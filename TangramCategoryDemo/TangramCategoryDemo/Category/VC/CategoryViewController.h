//
//  CategoryViewController.h
//  TangramCategoryVCDemo
//
//  Created by lv on 2017/7/25.
//  Copyright © 2017年 bdl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryLeftTableViewCell.h"

@interface CategoryViewController : UIViewController

@property(nonatomic, retain)NSString *categoryType;
@property(nonatomic, retain)NSString *categoryJson;
@property(nonatomic, assign)CategoryLeftCellType leftCellType;
@property(nonatomic, assign)CategoryLeftCellType rightCellType;
- (instancetype)initWithCategoryType:(NSString *)type json:(NSString *)categoryJson;

@end
