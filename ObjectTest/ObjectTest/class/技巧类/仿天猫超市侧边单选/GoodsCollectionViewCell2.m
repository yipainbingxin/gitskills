//
//  OneCollectionViewCell.m
//  FengShou
//
//  Created by gch on 16/6/17.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "GoodsCollectionViewCell2.h"

@implementation GoodsCollectionViewCell2

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
          [self addViews];
    }
    return self;
}

- (void)addViews
{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.frame.size.width-10, self.frame.size.height/3*2 )];
    self.imageView.backgroundColor = [UIColor greenColor];
    [self addSubview:self.imageView];
    
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame) , self.frame.size.width, self.frame.size.height/3)];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
    self.titleLabel.text=@"1234";
    [self addSubview:self.titleLabel];
    


}

@end
