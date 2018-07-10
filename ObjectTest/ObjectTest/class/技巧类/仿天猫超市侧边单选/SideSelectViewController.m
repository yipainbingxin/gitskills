//
//  ViewController.m
//  0000000
//
//  Created by BlueDream on 2016/11/17.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "SideSelectViewController.h"
#import "TableViewCell.h"
#import "GoodsCollectionViewCell2.h"
#import "UICollectionViewWaterfallLayout.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:1.0]
#define kWidth (kScreenWidth / 320)
#define kHeight (kScreenHeight / 568)

@interface SideSelectViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateWaterfallLayout>
{
    
    UICollectionView *_collectionView;
    UITableView *_tableView;
    NSIndexPath *_indexP;
    NSInteger _index;
}

@end

@implementation SideSelectViewController

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    self.navigationController.tabBarController.tabBar.hidden = YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =UIColorFromHex(0xEDEDED);
    self.navigationController.navigationBar.translucent = NO;
    self.leftTitleArray=[[NSMutableArray alloc]initWithObjects:@"热门推荐",@"生鲜水果",@"食品饮料",@"粮油副食",@"美容洗护",@"家居用品",@"生活保健", nil];
    
    [self creatUI];
    
}


-(void)creatUI{
    
    
    UILabel *rightLabel=[[UILabel alloc]initWithFrame:CGRectMake(130*kWidth, 10*kHeight, kScreenWidth-125*kWidth, 30*kHeight)];
    rightLabel.text=@"类目:";
    rightLabel.textColor=UIColorFromHex(0x989898);
    [self.view addSubview:rightLabel];
    
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 100*kWidth, self.view.frame.size.height) style:UITableViewStylePlain ];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=UIColorFromHex(0xEDEDED);
    _tableView.tableFooterView=[UIView new];
    _tableView.scrollEnabled = NO;
    [self.view addSubview:_tableView];
    
    
    //自定义fallLayout
    UICollectionViewWaterfallLayout* layout = [[UICollectionViewWaterfallLayout alloc] init];
    //设置显示几列
    layout.columnCount =3;
    //设置宽
    layout.itemWidth = (kScreenWidth-160)/3*kWidth;
    //设置开始的偏移量
    //上左下右
    layout.sectionInset = UIEdgeInsetsMake(6*kHeight, 6*kWidth, 0, 6*kWidth);
    layout.delegate = self;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(130*kWidth, 40*kHeight, kScreenWidth-130*kWidth, kScreenHeight-104*kHeight) collectionViewLayout:layout];
    
    _collectionView.backgroundColor = UIColorFromHex(0xEDEDED);
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    [_collectionView registerClass:[GoodsCollectionViewCell2 class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
    
    
    
}



#pragma mark-----UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.leftTitleArray.count  ;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    cell.textLabel.text=self.leftTitleArray[indexPath.row];
    cell.textLabel.font=[UIFont systemFontOfSize:12];
    cell.button.hidden=YES;
    if (_index==indexPath.row) {
        cell.button.hidden=NO;
        _indexP=indexPath;
        cell.textLabel.textColor=[UIColor redColor];
        
        
    }
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_indexP==indexPath) {
        return;
    }
    //上一个button隐藏
    TableViewCell *cellLast=[_tableView cellForRowAtIndexPath:_indexP];
    cellLast.button.hidden=YES;
    cellLast.textLabel.textColor=[UIColor blackColor];
    
    
    //当前button显示
    TableViewCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
    cell.button.hidden=NO;
    cell.textLabel.textColor=[UIColor redColor];
    
    
    //上一个重新赋值
    _indexP=indexPath;
    //记录下当前值刷新使用
    _index=indexPath.row;
    
    [_collectionView reloadData];
    
    NSLog(@"----%ld",(long)_index);
    
}



#pragma mark-----UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}


// 返回cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsCollectionViewCell2  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.backgroundColor=[UIColor redColor];
    cell.titleLabel.text=[NSString stringWithFormat:@"%ld",(long)_index];
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}
//设置单个的高
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterfallLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return (kScreenWidth-100)/3*kHeight;
    
}




@end
