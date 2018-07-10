//
//  ZhifubaoViewController.m
//  ObjectTest
//
//  Created by BlueDream on 2016/12/19.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "ZhifubaoViewController.h"

@interface ZhifubaoViewController ()

@end

@implementation ZhifubaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    NSString *string=@ "{\"alipay_trade_app_pay_response\":{\"code\":\"10000\",\"msg\":\"Success\",\"app_id\":\"2016111702912103\",\"auth_app_id\":\"2016111702912103\",\"charset\":\"utf-8\",\"timestamp\":\"2016-12-09 17:19:47\",\"total_amount\":\"0.01\",\"trade_no\":\"2016120921001004620290554092\",\"seller_id\":\"2088521240045344\",\"out_trade_no\":\"1481275131805\"},\"sign\":\"JaaX1xA/oCmCw1l0RgrJoRTDooIK+eihAg7G+L8i9hdgcGCnLMIFc4amFTzi86QozjFJeT8qUBfgTJYBenP+esaPB9CK8QrQq+fXK+KkAS+USf8SJYVSBoPhrZiL3q9DDDDK8Cq7to52Nl3TRWj93mfKfgLk4mmgvUMg1rLIa2c=\",\"sign_type\":\"RSA\"}";
    
    
    //验签
    //去掉返回字典中result值里面的“\\”
    NSString *result = [string stringByReplacingOccurrencesOfString:@"\\\\" withString:@""];
    
    
    NSLog(@"--------%@",result);
    NSData *JSONData = [result dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"--------%@",responseJSON[@"sign"]);

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
