//
//  ImagePicViewController.m
//  ObjectTest
//
//  Created by bing on 2018/7/2.
//  Copyright © 2018年 BlueDream. All rights reserved.
//

#import "ImagePicViewController.h"
#import "WSImagePickerView.h"
#import "Masonry.h"
@interface ImagePicViewController ()
@property(nonatomic,strong) WSImagePickerView *pickerView;
@property(nonatomic,strong) MASLayoutConstraint *photoViewHieghtConstraint;
@property(nonatomic,strong) UIView *photoView;
@end

@implementation ImagePicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"多选图片选择库";
    
    self.photoView=[[UIView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.photoView];
    
    WSImagePickerConfig *config = [WSImagePickerConfig new];
    config.itemSize = CGSizeMake(70, 70);
    config.photosMaxCount = 9;
    
    WSImagePickerView *pickerView = [[WSImagePickerView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 0) config:config];
    __weak typeof(self) weakSelf = self;
    pickerView.viewHeightChanged = ^(CGFloat height) {
        weakSelf.photoViewHieghtConstraint.constant = height;
        [weakSelf.view setNeedsLayout];
        [weakSelf.view layoutIfNeeded];
    };
    pickerView.navigationController = self.navigationController;
    [self.photoView addSubview:pickerView];
    self.pickerView = pickerView;
    [pickerView refreshImagePickerViewWithPhotoArray:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
