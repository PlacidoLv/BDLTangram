//
//  CategoryLeftTableViewCell.h
//  TangramCategoryVCDemo
//
//  Created by lv on 2017/7/25.
//  Copyright © 2017年 bdl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    
    /**
     只有文字
     */
    CategoryLeftCellTypeText = 0,
    
    /**
     只有图片
     */
    CategoryLeftCellTypeImage,
    
    /**
     图片和文字都有 图片在上
     */
    CategoryLeftCellTypeImageTop,
    
    /**
     图片和文字都有 图片在左
     */
    CategoryLeftCellTypeImageLeft,
    
    /**
     图片和文字都有 图片在下
     */
    CategoryLeftCellTypeImageBottom,

    /**
     图片和文字都有 图片在右
     */
    CategoryLeftCellTypeImageRight,
    
} CategoryLeftCellType;


@interface CategoryLeftTableViewCell : UITableViewCell

@property(nonatomic, assign)CategoryLeftCellType cellType;


/**
 图片和文字间间距
 */
@property(nonatomic, assign)CGFloat imageTextDistance;

@property(nonatomic, assign)CGSize imageSize;
@property(nonatomic, assign)CGFloat cellHeight;

@property(nonatomic, retain)UILabel *labName;
@property(nonatomic, retain)UIImageView *imgIco;

@property(nonatomic, retain)NSDictionary *dicData;
@end
