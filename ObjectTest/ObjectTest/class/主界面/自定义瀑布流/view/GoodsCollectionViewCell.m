//
//  OneCollectionViewCell.m
//  FengShou
//
//  Created by gch on 16/6/17.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "GoodsCollectionViewCell.h"
#import "UIView+WLFrame.h"

@implementation GoodsCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    [self creatUI];
    }
    return self;
}

- (void)creatUI
{
    self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 150 )];
    [self addSubview:self.imageV];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.imageV.bottom+10  , self.frame.size.width, 35)];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.titleLabel];

    
   }

@end
