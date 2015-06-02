//
//  OurViewController.m
//  RedWine
//
//  Created by LH on 15/5/22.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "OurViewController.h"
#import "OurTableViewCell.h"
#import "InformationViewController.h"
#import "SetViewController.h"
#import "PinXiangViewController.h"
#import "MyExerciseViewController.h"
#import "CupboardViewController.h"
#import "WordViewController.h"
@interface OurViewController ()
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

@end

@implementation OurViewController

- (void)viewWillDisappear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    [self tableV];
}


#pragma mark-Table
- (void)tableV
{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,64, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    
    
}

#pragma mark-TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifierOne = @"Cell1";
    static NSString *cellIdentifierTwo = @"Cell2";
    static NSString *cellIdentifierThree = @"Cell3";
    OurTableViewCell *cell = nil;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierOne];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"OurTableViewCell" owner:self options:nil] objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        UIButton *btn = (UIButton *)[cell viewWithTag:10];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    }else if (indexPath.section == 1){
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierTwo];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"OurTableViewCell" owner:self options:nil] objectAtIndex:1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        UIButton *btn = (UIButton *)[cell viewWithTag:20];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn2 = (UIButton *)[cell viewWithTag:30];
        [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }else if (indexPath.section == 2){
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierThree];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"OurTableViewCell" owner:self options:nil] objectAtIndex:2];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

        }
        UIButton *btn = (UIButton *)[cell viewWithTag:40];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

        UIButton *btn2 = (UIButton *)[cell viewWithTag:50];
        [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn3 = (UIButton *)[cell viewWithTag:60];
        [btn3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn4 = (UIButton *)[cell viewWithTag:70];
        [btn4 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 ) {
        
        return 75;
    }else if (indexPath.section==1)
    {
        return 88;
    }
    return 156;
}
- (void)btnClick:(UIButton *)btn{
    switch (btn.tag) {
        case 10:
        {
            InformationViewController *infornation = [[InformationViewController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:infornation animated:YES];
        }
            break;
        case 20:
        {
            SetViewController *setVC = [[SetViewController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:setVC animated:YES];
        }
            break;
        case 30:
        {
            
        }
            break;
            
        case 40:
        {
            PinXiangViewController *pinXiang = [[PinXiangViewController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:pinXiang animated:YES];
        }
            break;
        case 50:
        {
            WordViewController *word = [[WordViewController alloc]init];
           self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:word animated:YES];
        }
            break;
        case 60:
        {
            MyExerciseViewController *myExercise = [[MyExerciseViewController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:myExercise animated:YES];
        }
            break;
        case 70:
        {
            CupboardViewController *cupBoard = [[CupboardViewController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:cupBoard animated:YES];
        }
            break;
        default:
            break;
    }
    
    
    
}

@end
