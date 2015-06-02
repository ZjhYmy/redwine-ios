//
//  TwoDimensionalViewController.m
//  RedWine
//
//  Created by LH on 15/6/2.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "TwoDimensionalViewController.h"

@interface TwoDimensionalViewController ()

@end

@implementation TwoDimensionalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backBtn:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
