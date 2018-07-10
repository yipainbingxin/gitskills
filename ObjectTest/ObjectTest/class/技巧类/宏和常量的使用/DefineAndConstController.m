//
//  DefineAndConstController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/22.
//  Copyright © 2016年 BlueDream. All rights reserved.
/*
 
 
 当我们想全局共用一些数据时，可以用宏、变量、常量
 宏：
 #define HSCoder @"汉斯哈哈哈"
 
 变量：
 NSString *HSCoder = @"汉斯哈哈哈";
 
 常量：
 四种写法：
 static const NSString *HSCoder = @"汉斯哈哈哈";
 const NSString *HSCoder = @"汉斯哈哈哈";
 NSString const *HSCoder = @"汉斯哈哈哈";
 NSString * const HSCoder = @"汉斯哈哈哈";
 
 思考：宏与常/变量的选择？
 
 宏：只是在预处理器里进行文本替换，没有类型，不做任何类型检查，编译器可以对相同的字符串进行优化。只保存一份到 .rodata 段。甚至有相同后缀的字符串也可以优化，你可以用GCC 编译测试，"Hello world" 与 "world" 两个字符串，只存储前面一个。取的时候只需要给前面和中间的地址，如果是整形、浮点型会有多份拷贝，但这些数写在指令中。占的只是代码段而已，大量用宏会导致二进制文件变大
 变量：共享一块内存空间，就算项目中N处用到，也不会分配N块内存空间，可以被修改，在编译阶段会执行类型检查
 常量：共享一块内存空间，就算项目中N处用到，也不会分配N块内存空间，可以根据const修饰的位置设定能否修改，在编译阶段会执行类型检查
 尽量使用const，看苹果api使用常量多点
 
 
 常量区分
 全局常量：不管你定义在任何文件夹，外部都能访问
 
 const NSString *HSCoder = @"汉斯哈哈哈";
 
 局部常量：用static修饰后，不能提供外界访问
 
 static const NSString *HSCoder = @"汉斯哈哈哈";
 
 const修饰位置不同，代表什么？
  1.const NSString *HSCoder = @"汉斯哈哈哈";
 "*HSCoder"不能被修改， "HSCoder"能被修改
 
 2.NSString const *HSCoder = @"汉斯哈哈哈";
 "*HSCoder"不能被修改， "HSCoder"能被修改
 
 3.NSString * const HSCoder = @"汉斯哈哈哈";
 "HSCoder"不能被修改，"*HSCoder"能被修改
 
 注意：1和2其实没什么区别
 结论：const右边的总不能被修改
 
 所以一般我们定义一个常量又不想被修改应该这样：
 
 NSString * const HSCoder = @"汉斯哈哈哈";
 
 
 
 */

#import "DefineAndConstController.h"

@interface DefineAndConstController ()

@end

@implementation DefineAndConstController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    extern NSString *string;
    NSLog(@"-----%@",string);
    
    
    
    
    
    
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
