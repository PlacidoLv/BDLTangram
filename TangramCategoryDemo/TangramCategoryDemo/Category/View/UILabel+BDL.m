//
//  UILabel+BDL.m
//  TangramCategoryDemo
//
//  Created by lv on 2017/7/26.
//  Copyright © 2017年 bdl. All rights reserved.
//

#import "UILabel+BDL.h"

@implementation UILabel (BDL)

- (CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}

@end
