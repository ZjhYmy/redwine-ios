//
//  AlterViewController.m
//  RedWine
//
//  Created by LH on 15/5/28.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "AlterViewController.h"

@interface AlterViewController ()

@end

@implementation AlterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView.delegate = self;
}
//textView 代理
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return NO;
}
- (IBAction)backBtn:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
