//
//  testTableViewCell.h
//  666666
//
//  Created by BlueDream on 2016/11/11.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import <UIKit/UIKit.h>


@class testTableViewCell;
@protocol testTableViewCellDelegate <NSObject>

-(void)uodataTableViewCellHight:(testTableViewCell*)cell andHight:(CGFloat)hight andIndexPath:(NSIndexPath *)indexPath;
@end

@interface testTableViewCell : UITableViewCell
@property(nonatomic,strong)NSIndexPath *indexPath;
@property(nonatomic,strong)NSArray *dataArr;
@property(nonatomic,weak) id<testTableViewCellDelegate>deleget;
@property(nonatomic,strong)UILabel *lable;
@end
