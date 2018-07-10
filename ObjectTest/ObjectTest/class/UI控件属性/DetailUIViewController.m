//
//  DetailUIViewController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/20.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "DetailUIViewController.h"

@interface DetailUIViewController ()

@end

@implementation DetailUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:_sourceString ofType:@"docx"];
    NSURL *url = [NSURL fileURLWithPath:path];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [webView sizeToFit];
    webView.scalesPageToFit = YES;
    //webView.delegate = self;
    [self.view addSubview:webView];

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
