//
//  FindViewController.m
//  RedWine
//
//  Created by LH on 15/5/22.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "FindViewController.h"
#import "FindTableViewCell.h"
#import "ExerciseViewController.h"
#import "PinXViewController.h"
#import "GrapeViewController.h"
@interface FindViewController ()


#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@end

@implementation FindViewController

- (void)viewWillDisappear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    [self table];
}
#pragma mark-TableView
- (void)table
{
    UIView *view = [UIView new];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.tableFooterView = view;
    [self.view addSubview:self.tableView];
}

#pragma mark-TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    FindTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FindTableViewCell" owner:self options:nil] objectAtIndex:0];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            
            cell.ImageView.image = [UIImage imageNamed:@"find_huodong"];
            cell.rightImage.image = [UIImage imageNamed:@"index_miqi"];
            cell.Lab.text = @"活动";
        }else if (indexPath.row==1)
        {
            cell.ImageView.image = [UIImage imageNamed:@"find_px"];
            cell.Lab.text = @"拼箱";
        }
    }
    if (indexPath.section==1)
    {
        cell.ImageView.image = [UIImage imageNamed:@"find_putaojiuxueyuan"];
        cell.Lab.text = @"葡萄学院";
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            ExerciseViewController *exercise = [[ExerciseViewController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:exercise animated:YES];
        }
        
        if (indexPath.row==1) {
            PinXViewController *pinx= [[PinXViewController alloc]init];
            self.hidesBottomBarWhenPushed = YES;

            [self.navigationController pushViewController:pinx animated:YES];
        }
    }
    if (indexPath.section==1) {
        GrapeViewController *grape = [[GrapeViewController alloc]init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:grape animated:YES];
    }
}

@end
