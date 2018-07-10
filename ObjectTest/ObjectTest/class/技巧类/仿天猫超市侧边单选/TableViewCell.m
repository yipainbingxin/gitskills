//
//  TableViewCell.m
//  0000000
//
//  Created by BlueDream on 2016/11/17.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        self.button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, self.frame.size.height)];
        [self.button setImage:[UIImage imageNamed:@"22"] forState:UIControlStateNormal];

        [self.contentView addSubview:self.button];
        
        UIView *rightLine=[[UIView alloc]initWithFrame:CGRectMake(99, 0, 1, self.frame.size.height)];
        rightLine.backgroundColor=[UIColor grayColor];
        [self.contentView addSubview:rightLine];
        
        
        
        
        
        
        
    }
    return  self;
    
    
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
