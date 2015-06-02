//
//  SetViewController.m
//  RedWine
//
//  Created by LH on 15/5/27.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "SetViewController.h"
#import "WeiXunHaoViewController.h"
#import "SecretViewController.h"
#import "AboutViewController.h"
#import "LoginViewController.h"
@interface SetViewController ()


#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@end

@implementation SetViewController

- (void)viewWillDisappear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.hidden = YES;
    self.firstTitleArray = @[@"微醺号",@"密码",@"信息通知"];
    [self tableV];
}

- (void)tableV
{
    
    UIView *view = [UIView new];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64,  ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
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
        return self.firstTitleArray.count;
    }if (section==1) {
        return 2;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.section==0) {
        cell.textLabel.text = [self.firstTitleArray objectAtIndex:indexPath.row];
        
        if(indexPath.row==2){
            UISegmentedControl *segmentedControl = [ [ UISegmentedControl alloc ]initWithFrame:CGRectMake(230, 6, 80 , 30)];
            segmentedControl.tintColor = [UIColor colorWithRed:67/255.0 green:212/255.0 blue:81/255.0 alpha:1];
            [ segmentedControl insertSegmentWithTitle:@"声音" atIndex: 0 animated: NO ];
            [ segmentedControl insertSegmentWithTitle: @"震动" atIndex: 1 animated: NO ];
            segmentedControl.selectedSegmentIndex = 0;
            [ segmentedControl addTarget: self action: @selector(controlPressed:)
                        forControlEvents: UIControlEventValueChanged];
            [cell.contentView addSubview:segmentedControl];
        }
    }else if (indexPath.section==1)
    {
        if (indexPath.row==0) {
            cell.textLabel.text = @"关于微醺";
        }else
        {
            cell.textLabel.text = @"退出";
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (void)controlPressed:(UISegmentedControl *)segmentedControl
{
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    NSLog(@"Segment %ld selected\n", (long)selectedSegment);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            
            WeiXunHaoViewController *weiXun = [[WeiXunHaoViewController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:weiXun animated:YES];
        }else if(indexPath.row ==1){
            SecretViewController *secre = [[SecretViewController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:secre animated:YES];
        }
    }else if (indexPath.section==1)
    {
        if (indexPath.row==0) {
            AboutViewController *about = [[AboutViewController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:about animated:YES];
        }else if (indexPath.row==1)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"确定要退出" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            alert.delegate = self;
            [alert show];
            
        }
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
        return;
        
    }else
    {
        LoginViewController *login = [[LoginViewController alloc]init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:login animated:YES];
    }
}
- (IBAction)backBtn:(UIButton *)sender {
    

    [self.navigationController popViewControllerAnimated:YES];
}

@end
