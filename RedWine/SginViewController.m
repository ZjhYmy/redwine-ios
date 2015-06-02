//
//  SginViewController.m
//  RedWine
//
//  Created by LH on 15/6/2.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "SginViewController.h"

@interface SginViewController ()

@end

@implementation SginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)backBtn:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
