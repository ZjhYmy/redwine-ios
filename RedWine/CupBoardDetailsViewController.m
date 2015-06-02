//
//  CupBoardDetailsViewController.m
//  RedWine
//
//  Created by LH on 15/5/22.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "CupBoardDetailsViewController.h"

@interface CupBoardDetailsViewController ()

@end

@implementation CupBoardDetailsViewController

- (void)viewWillDisappear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
}

- (IBAction)backBtn:(UIButton *)sender {
    
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
