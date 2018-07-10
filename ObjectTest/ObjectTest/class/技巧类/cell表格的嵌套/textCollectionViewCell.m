//
//  textCollectionViewCell.m
//  666666
//
//  Created by BlueDream on 2016/11/11.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "textCollectionViewCell.h"
@interface textCollectionViewCell ()
@property(nonatomic,strong)UIImageView *imageView;

@end

@implementation textCollectionViewCell
-(instancetype)initWithFrame:(CGRect)fram{
    if (self = [super initWithFrame:fram]) {
        self.imageView  = [[UIImageView alloc]init];
        self.backgroundView = self.imageView;
        self.imageView.image = [UIImage imageNamed:@"a"];
    }
    return self;
}

-(void)setImageName:(NSString *)imageName{
    _imageName  = imageName;
    self.imageView.image = [UIImage imageNamed:_imageName];
}@end
