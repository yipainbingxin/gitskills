//
//  ViewController.m
//  Password
//
//  Created by BlueDream on 16/9/19.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "PasswordViewController.h"

@interface PasswordViewController ()
{
    NSMutableArray *_dataArray;
    
    NSMutableString *_stringPassword;

    UITextField *_bigTextField;
    
}

@end

@implementation PasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    

    self.view.backgroundColor=[UIColor whiteColor];
    
    _dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    UIView *mainView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-20, self.view.frame.size.height/2)];
    //mainView.backgroundColor=[UIColor redColor];
    mainView.center=self.view.center;
    [self.view addSubview:mainView];
    
    CGFloat width = (mainView.frame.size.width-20)/6;
    

    // 密码输入框
    _bigTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 160 , mainView.frame.size.width, width )];
    _bigTextField.hidden = YES;
    _bigTextField.backgroundColor=[UIColor blueColor];
    _bigTextField.keyboardType = UIKeyboardTypeNumberPad;
    [_bigTextField addTarget:self action:@selector(bigTextFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [mainView addSubview:_bigTextField];
    
    UIButton *bigButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bigButton.frame = CGRectMake(0, 160 , mainView.frame.size.width, width );
    [bigButton addTarget:self action:@selector(bigButtonClick) forControlEvents:UIControlEventTouchUpInside];
    //bigButton.backgroundColor=[UIColor blueColor];
    [mainView addSubview:bigButton];
    
    
    for (int i = 0; i < 6; i++)
    {
        UITextField *littleTextField = [[UITextField alloc] initWithFrame:CGRectMake(10+i*width, 160 , width+1, width)];
        littleTextField.layer.borderColor = [UIColor grayColor].CGColor;
//        pwdLabel.backgroundColor=[UIColor blueColor];
        littleTextField.borderStyle= UITextBorderStyleLine;
        littleTextField.enabled = NO;
        littleTextField.textAlignment = NSTextAlignmentCenter;//居中
        littleTextField.secureTextEntry = YES;//设置密码模式
        littleTextField.layer.borderWidth = 0.5;
        [mainView addSubview:littleTextField];
        
        [_dataArray addObject:littleTextField];
    }

    
    //确定按钮
    UIButton *sureButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    sureButton.frame = CGRectMake(10, 180+width, mainView.frame.size.width - 20  , 44 );
    [sureButton addTarget:self action:@selector(sureButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    [sureButton setTitle:NSLocalizedString(@"确定", nil)  forState:(UIControlStateNormal)];
    sureButton.backgroundColor = [UIColor orangeColor];
    sureButton.layer.cornerRadius =5;
    sureButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [mainView addSubview:sureButton];

}


//确定按钮输出
- (void)sureButtonClick
{
    _stringPassword = [NSMutableString string];
    for (UITextField *text in _dataArray) {
        [_stringPassword appendString:text.text];
    }
    if (_stringPassword.length == 6) {

    //确定按钮输出
    NSLog(@"----%@",_stringPassword);
        
    }
}

#pragma mark 文本框内容改变

- (void)bigTextFieldChange:(UITextField *)tx
{
    
    NSString *textbigTF = _bigTextField.text;
    
    for (int i = 0; i < _dataArray.count; i++) {
        UITextField *littleTextField=[_dataArray objectAtIndex:i];
        NSString *string;
        if (i < textbigTF.length) {
            string = [textbigTF substringWithRange:NSMakeRange(i, 1)];
        }
        littleTextField.text=string;
    }
    if (textbigTF.length == _dataArray.count) {
        //这里可以自动监听
        NSLog(@"------%@",_bigTextField.text);
        
    }
    
}




- (void)bigButtonClick
{
    [_bigTextField becomeFirstResponder];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [_bigTextField resignFirstResponder];
}




@end
