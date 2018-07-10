//
//  FaloutViewController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/10.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "FaloutViewController.h"
#import "UICollectionViewWaterfallLayout.h"
#import "GoodsCollectionViewCell.h"

#define KscreenWidth [UIScreen mainScreen].bounds.size.width
#define KscreenHeight [UIScreen mainScreen].bounds.size.height

@interface FaloutViewController ()<UICollectionViewDelegateWaterfallLayout,UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *_height;
    
}

@end

@implementation FaloutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    _height=@[@"150",@"150",@"200",@"250",@"300",@"350"];
    
    //自定义fallLayout
    UICollectionViewWaterfallLayout* layout = [[UICollectionViewWaterfallLayout alloc] init];
    //设置显示几列
    layout.columnCount = 2;
    //设置宽
    layout.itemWidth = (KscreenWidth - 18) / 2;
    //设置开始的偏移量
    //上左下右
    layout.sectionInset = UIEdgeInsetsMake(100, 6, 0, 6);
    layout.delegate = self;
    
    UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    
    collectionView.backgroundColor = [UIColor blueColor];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [collectionView registerClass:[GoodsCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

    //[collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:collectionView];
    
    

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _height.count;
}

//设置单个的高
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterfallLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    return [_height[indexPath.row] integerValue];
    
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GoodsCollectionViewCell *item=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    item.backgroundColor=[UIColor redColor];
    item.titleLabel.text=@"瀑布流";
    item.imageV.image=[UIImage imageNamed:@"1.jpg"];
    return item;
    
    
}



@end
