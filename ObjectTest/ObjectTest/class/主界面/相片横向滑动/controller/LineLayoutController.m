//
//  ViewController.m
//  AYCustomLayout
//
//  Created by AY on 16/7/21.
//  Copyright © 2016年 Jasperay. All rights reserved.
//

#import "LineLayoutController.h"
#import "AYLineLayout.h"
#import "AYPhotoCell.h"

@interface LineLayoutController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation LineLayoutController

static NSString * const AYPhotoId = @"photo";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建布局
    AYLineLayout *layout = [[AYLineLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    
    // 创建CollectionView
    CGFloat collectionW = self.view.frame.size.width;
    CGFloat collectionH = 200;
    CGRect frame = CGRectMake(0, 150, collectionW, collectionH);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
    // 注册
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([AYPhotoCell class]) bundle:nil] forCellWithReuseIdentifier:AYPhotoId];
    
    // 继承UICollectionViewLayout
    // 继承UICollectionViewFlowLayout
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AYPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AYPhotoId forIndexPath:indexPath];
    
    cell.imageName = [NSString stringWithFormat:@"11.jpg"];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"------%zd", indexPath.item);
}
@end
