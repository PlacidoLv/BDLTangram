//
//  CategoryLeftTableViewCell.m
//  TangramCategoryVCDemo
//
//  Created by lv on 2017/7/25.
//  Copyright © 2017年 bdl. All rights reserved.
//

#import "CategoryLeftTableViewCell.h"
#import "masonry.h"
#import <UIImageView+WebCache.h>
@implementation CategoryLeftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageTextDistance = 5;
        
        self.labName = [[UILabel alloc] init];
        self.labName.font = [UIFont systemFontOfSize:14];
        self.labName.textColor = [UIColor blackColor];
        self.labName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.labName];
        
        self.imgIco = [[UIImageView alloc] init];
        self.imgIco.contentMode = UIViewContentModeScaleAspectFill;
        self.imgIco.clipsToBounds = YES;
        self.imgIco.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.imgIco];
        
        [self.imgIco mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        [self.labName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imgIco.mas_right);
            make.right.mas_equalTo(self);
            make.centerY.mas_equalTo(self);
        }];
        


        self.imageSize = CGSizeMake(30, 30);
    }
    
    return self;
}

-(void)setImageSize:(CGSize)imageSize
{
    _imageSize = imageSize;

    [self.imgIco mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(imageSize);
    }];

}
-(void)setDicData:(NSDictionary *)dicData
{
    _dicData = dicData;
    
    switch (self.cellType) {
            
        case CategoryLeftCellTypeText: {
            
            if ([dicData.allKeys containsObject:@"name"]) {
                
                self.labName.text = [_dicData objectForKey:@"name"];
                self.labName.hidden = NO;
                self.imgIco.hidden = YES;
                
                [self.labName mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.mas_equalTo(UIEdgeInsetsMake(0, 10, 0, 10));
                }];
            }
        }
            break;
            
        case CategoryLeftCellTypeImage: {
            
            if ([dicData.allKeys containsObject:@"imageUrl"]) {
                
                [self.imgIco sd_setImageWithURL:[NSURL URLWithString:[_dicData objectForKey:@"imageUrl"]]];
                
                self.labName.hidden = YES;
                self.imgIco.hidden = NO;
                
                [self.imgIco mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.center.mas_equalTo(self);
                    make.size.mas_equalTo(self.imageSize);
                }];
            }
        }
            break;
            
            
        default: {
            
            if ([dicData.allKeys containsObject:@"name"]) {
                
                self.labName.text = [_dicData objectForKey:@"name"];
            }
            
            if ([dicData.allKeys containsObject:@"imageUrl"]) {
                
                [self.imgIco sd_setImageWithURL:[NSURL URLWithString:[_dicData objectForKey:@"imageUrl"]]];
            }
            
            self.labName.hidden = NO;
            self.imgIco.hidden = NO;
            
            
            switch (self.cellType) {
                    
                case CategoryLeftCellTypeImageTop: {
                    
                    CGFloat allHeight =  (self.cellHeight - 20 - self.imageSize.height - self.imageTextDistance)/2;
                    
                    [self.imgIco mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.top.mas_equalTo(self).offset(allHeight);
                        make.centerX.mas_equalTo(self);
                        make.size.mas_equalTo(self.imageSize);
                    }];
                    
                    [self.labName mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.top.mas_equalTo(self.imgIco.mas_bottom).offset(self.imageTextDistance);
                        make.centerX.mas_equalTo(self.imgIco);
                        make.height.mas_equalTo(20);
                    }];
                }
                    break;
                    
                case CategoryLeftCellTypeImageLeft: {
                    
                    [self.imgIco mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.left.mas_equalTo(self).offset(10);
                        make.centerY.mas_equalTo(self);
                        make.size.mas_equalTo(CGSizeMake(30, 30));
                    }];
                    
                    self.labName.textAlignment = NSTextAlignmentLeft;
                    [self.labName mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.left.mas_equalTo(self.imgIco.mas_right).offset(self.imageTextDistance);
                        make.right.mas_equalTo(self);
                        make.centerY.mas_equalTo(self);
                    }];

                }
                    break;
                    
                case CategoryLeftCellTypeImageRight: {
                    
                    [self.imgIco mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.right.mas_equalTo(self).offset(-10);
                        make.centerY.mas_equalTo(self);
                        make.size.mas_equalTo(CGSizeMake(30, 30));
                    }];
                    
                    self.labName.textAlignment = NSTextAlignmentRight;
                    [self.labName mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.right.mas_equalTo(self.imgIco.mas_left).offset(-self.imageTextDistance);
                        make.right.mas_equalTo(self);
                        make.centerY.mas_equalTo(self);
                    }];
                }
                    break;
                    
                case CategoryLeftCellTypeImageBottom: {
                    
                    CGFloat allHeight =  (self.cellHeight - 20 - self.imageSize.height - self.imageTextDistance)/2;
                    [self.imgIco mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.bottom.mas_equalTo(self.mas_bottom).offset( - allHeight);
                        make.centerX.mas_equalTo(self);
                        make.size.mas_equalTo(self.imageSize);
                    }];
                    
                    [self.labName mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.bottom.mas_equalTo(self.imgIco.mas_top).offset(-self.imageTextDistance);
                        make.centerX.mas_equalTo(self.imgIco);
                        make.height.mas_equalTo(20);
                    }];
                }
                    break;
                    
                default:
                    break;
            }
            
        }
            break;
    }

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
