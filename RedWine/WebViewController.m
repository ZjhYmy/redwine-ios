//
//  WebViewController.m
//  RedWine
//
//  Created by LH on 15/5/22.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height


@property(nonatomic,strong)UIWebView *webView;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.hidden = YES;
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, 320, ScreenHeight-64)];
    [NSThread detachNewThreadSelector:@selector(coummunity) toTarget:self withObject:nil];
    [self.view addSubview:self.webView];
    
}
- (void)coummunity
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    
    [self.webView loadRequest:request];
}

- (IBAction)backBtn:(UIButton *)sender {
  
    [self.navigationController popViewControllerAnimated:YES];
}


@end
