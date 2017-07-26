//
//  CategoryElement.h
//  TangramCategoryVCDemo
//
//  Created by lv on 2017/7/25.
//  Copyright © 2017年 bdl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryLeftTableViewCell.h"
#import <Tangram/TangramDefaultItemModel.h>
#import <Tangram/TangramBus.h>

#import "TangramElementHeightProtocol.h"
#import "TangramEasyElementProtocol.h"
#import "TMMuiLazyScrollView.h"

@interface CategoryElement : UIControl<TangramElementHeightProtocol, TangramEasyElementProtocol, TMMuiLazyScrollViewCellProtocol>

@property (nonatomic, weak) TangramDefaultItemModel *tangramItemModel;

@property (nonatomic, weak) UIView<TangramLayoutProtocol> *atLayout;

@property (nonatomic, weak) TangramBus *tangramBus;

@property (nonatomic, strong) NSString *action;

@property (nonatomic, assign) NSInteger index;

@property(nonatomic, assign)CategoryLeftCellType leftCellType;

@end
