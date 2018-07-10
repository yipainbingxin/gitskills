//
//  ViewController.m
//  TextFieldTest
//
//  Created by BlueDream on 16/5/17.
//  Copyright © 2016年 宋信广. All rights reserved.
//

#import "TextfieldViewController.h"
#import "MyTextField.h"

@interface TextfieldViewController ()<UITextFieldDelegate>
{
    MyTextField *tf;
}
@property (nonatomic, assign) BOOL isHaveDian;
@property (nonatomic, assign) BOOL isFirstZero;
@end

@implementation TextfieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor whiteColor];

    tf=[[MyTextField alloc]initWithFrame:CGRectMake(10, 100, 300, 40)];
    tf.borderStyle=UITextBorderStyleRoundedRect;
    tf.placeholder=@"1234rtyu";
    tf.delegate=self;
    //最右侧加图片是以下代码　 左侧类似
    UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lock.png"]];
    tf.leftView=image;
    tf.leftViewMode = UITextFieldViewModeAlways;
    
    
    //修改placeholder的默认颜色
    UIColor *color = [UIColor purpleColor];
    tf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"1234" attributes:@{NSForegroundColorAttributeName: color}];

    
    [self.view addSubview:tf];
    
}


-(void)setTextFieldLeftPadding:(UITextField *)textField forWidth:(CGFloat)leftWidth
{
    CGRect frame = textField.frame;
    frame.size.width = leftWidth;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = leftview;
}



//最全的键盘输入,小数点,0的判断
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == tf) {
        
        if ([textField.text rangeOfString:@"."].location==NSNotFound) {
            _isHaveDian = NO;
        }
        if ([textField.text rangeOfString:@"0"].location==NSNotFound) {
            _isFirstZero = NO;
        }
        
        if ([string length]>0)
        {
            unichar single=[string characterAtIndex:0];//当前输入的字符
            if ((single >='0' && single<='9') || single=='.')//数据格式正确
            {
                
                if([textField.text length]==0){
                    if(single == '.'){
                        //首字母不能为小数点
                        return NO;
                    }
                    if (single == '0') {
                        _isFirstZero = YES;
                        return YES;
                    }
                }
                
                if (single=='.'){
                    if(!_isHaveDian)//text中还没有小数点
                    {
                        _isHaveDian=YES;
                        return YES;
                    }else{
                        return NO;
                    }
                }else if(single=='0'){
                    if ((_isFirstZero&&_isHaveDian)||(!_isFirstZero&&_isHaveDian)) {
                        //首位有0有.（0.01）或首位没0有.（10200.00）可输入两位数的0
                        if([textField.text isEqualToString:@"0.0"]){
                            return NO;
                        }
                        NSRange ran=[textField.text rangeOfString:@"."];
                        int tt=(int)(range.location-ran.location);
                        if (tt <= 2){
                            return YES;
                        }else{
                            return NO;
                        }
                    }else if (_isFirstZero&&!_isHaveDian){
                        //首位有0没.不能再输入0
                        return NO;
                    }else{
                        return YES;
                    }
                }else{
                    if (_isHaveDian){
                        //存在小数点，保留两位小数
                        NSRange ran=[textField.text rangeOfString:@"."];
                        int tt= (int)(range.location-ran.location);
                        if (tt <= 2){
                            return YES;
                        }else{
                            return NO;
                        }
                    }else if(_isFirstZero&&!_isHaveDian){
                        //首位有0没点
                        return NO;
                    }else{
                        return YES;
                    }
                }
            }else{
                //输入的数据格式不正确
                return NO;
            }
        }else{
            return YES;
        }
    }
    return YES;
}




@end
