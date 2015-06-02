//
//  IssueViewController.m
//  RedWine
//
//  Created by LH on 15/5/27.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "IssueViewController.h"

@interface IssueViewController ()

@end

@implementation IssueViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 200, 20)];
    self.label.enabled = NO;
    self.label.text = @"写点什么吧......";
    self.label.font =  [UIFont systemFontOfSize:15];
    self.label.textColor = [UIColor lightGrayColor];
    [self.textView addSubview:self.label];
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text length] == 0) {
        [self.label setHidden:YES];
    }else{
        [self.label setHidden:NO];
    }
}
- (IBAction)issueBtn:(UIButton *)sender {
    
}
- (IBAction)addImage:(UIButton *)sender {
    NSLog(@"11111111");
    
}
- (IBAction)backBtn:(UIButton *)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end



