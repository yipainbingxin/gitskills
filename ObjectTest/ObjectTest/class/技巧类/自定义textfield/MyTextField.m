//
//  tf.m
//  TextFieldTest
//
//  Created by BlueDream on 16/5/18.
//  Copyright © 2016年 宋信广. All rights reserved.
//

#import "MyTextField.h"

@implementation MyTextField



//设置placeholder的初始位置
- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super textRectForBounds:bounds];
    iconRect.origin.x += 10;// 右偏10
    return iconRect;
}

//设置编辑状态的初始位置
- (CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super editingRectForBounds:bounds];
    iconRect.origin.x += 10;// 右偏10
    return iconRect;
}

//设置左边leftView的初始位置
- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 10;// 右偏10
    return iconRect;
    
}

@end
