//
//  AYPhotoCell.m
//  AYCustomLayout
//
//  Created by AY on 16/7/21.
//  Copyright © 2016年 Jasperay. All rights reserved.
//

#import "AYPhotoCell.h"

@interface AYPhotoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation AYPhotoCell

- (void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];
    
    self.imgView.image = [UIImage imageNamed:imageName];
}

- (void)awakeFromNib {
    [super awakeFromNib];

    self.imgView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imgView.layer.borderWidth = 10;
}

@end
