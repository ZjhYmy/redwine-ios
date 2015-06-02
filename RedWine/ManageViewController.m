//
//  ManageViewController.m
//  RedWine
//
//  Created by LH on 15/6/1.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "ManageViewController.h"
#import "ManageTableViewCell.h"
#import "BeSelectedViewController.h"
#import "SelectDrinkViewController.h"
#import "ShareViewController.h"
@interface ManageViewController ()

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@end

@implementation ManageViewController

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
    [self.view addSubview:self.tableView];
}

#pragma mark-TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *cellIdentifierOne = @"cell1";
    static NSString *cellIdentifierTwo = @"cell2";
    static NSString *cellIdentifierThree = @"cell3";
    static NSString *cellIdentifierFour = @"cell4";
    ManageTableViewCell *cell = nil;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierOne];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ManageTableViewCell" owner:self options:nil] objectAtIndex:0];
            
        }
      
        UITextView *textView = (UITextView *)[cell.contentView viewWithTag:33];
        textView.delegate = self;
        
        UIButton *button = (UIButton *)[cell.contentView viewWithTag:15];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button1 = (UIButton *)[cell.contentView viewWithTag:16];
        [button1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button2 = (UIButton *)[cell.contentView viewWithTag:17];
        [button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }else if (indexPath.section == 1){
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierTwo];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ManageTableViewCell" owner:self options:nil] objectAtIndex:1];
            
        }
    
    }else if (indexPath.section == 2){
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierThree];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ManageTableViewCell" owner:self options:nil] objectAtIndex:2];
            
        }
        
        UIButton *button = (UIButton *)[cell.contentView viewWithTag:20];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button2 = (UIButton *)[cell.contentView viewWithTag:21];
        [button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }else if (indexPath.section == 3){
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierFour];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ManageTableViewCell" owner:self options:nil] objectAtIndex:3];
            
        }
        UIButton *button = (UIButton *)[cell.contentView viewWithTag:26];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
            return 250;
            break;
        case 1:
            return 98;
            break;
        case 2:
            return 205;
            break;
        case 3:
            return 384;
            break;
        default:
            break;
    }
    return 0;
}
- (void)buttonClick:(UIButton *)button
{
    if (button.tag== 15) {
        NSLog(@"66666");
        
    }else if (button.tag== 17 || button.tag== 16) {
        
        
        
    } else if (button.tag== 20) {
        BeSelectedViewController *select = [[BeSelectedViewController alloc]init];
        
        [self.navigationController pushViewController:select animated:YES];
    }else if (button.tag== 21) {
        SelectDrinkViewController *selectDrink = [[SelectDrinkViewController alloc]init];
        
        [self.navigationController pushViewController:selectDrink animated:YES];
    }
    else if (button.tag== 26) {
        ShareViewController *share = [[ShareViewController alloc]init];
        
        [self.navigationController pushViewController:share animated:YES];
    }
}
//textView 代理
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return NO;
}
- (IBAction)backBtn:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
