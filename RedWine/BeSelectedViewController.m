//
//  BeSelectedViewController.m
//  RedWine
//
//  Created by LH on 15/6/2.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "BeSelectedViewController.h"
#import "BeSelectTableViewCell.h"
@interface BeSelectedViewController ()

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@end

@implementation BeSelectedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self table];
}
#pragma mark-TableView
- (void)table
{
    UIView *view = [UIView new];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.tableFooterView = view;
    self.tableView.rowHeight = 68;
    [self.view addSubview:self.tableView];
}

#pragma mark-TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    BeSelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell  = [[[NSBundle mainBundle]loadNibNamed:@"BeSelectTableViewCell" owner:nil options:nil]objectAtIndex:0];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}

- (IBAction)backBtn:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sureBtn:(UIButton *)sender {
}

@end
