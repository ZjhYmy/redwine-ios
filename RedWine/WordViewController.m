//
//  WordViewController.m
//  RedWine
//
//  Created by LH on 15/5/27.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "WordViewController.h"
#import "WordTableViewCell.h"
@interface WordViewController ()


#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@end

@implementation WordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    [self table];
}
#pragma mark-TableView
- (void)table
{
    //背景图片和view
    UIView *bgVIew = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 175)];
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"image3"]];
    image.frame = CGRectMake(0, 0,  ScreenWidth, 150);
    [bgVIew addSubview:image];
    
    //nameLab
    UILabel *nameLab = [[UILabel alloc]initWithFrame:CGRectMake(180, 120, 60, 30)];
    nameLab.text = @"小温同学";
    nameLab.textColor = [UIColor whiteColor];
    nameLab.font = [UIFont systemFontOfSize:14];
    [bgVIew addSubview:nameLab];
    
    
    //头像image
    UIImageView *touXiangImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my_touxiang.fw"]];
    touXiangImage.frame = CGRectMake(245, 110,  60, 60);
    [bgVIew addSubview:touXiangImage];
    
    //tableView
    UIView *view = [UIView new];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.tableHeaderView = bgVIew;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    
    
    static NSString *cellIdentifierOne = @"Cell1";
    static NSString *cellIdentifierTwo = @"Cell2";
    static NSString *cellIdentifierThree = @"Cell1";
    static NSString *cellIdentifierFour = @"Cell2";
    WordTableViewCell *cell = nil;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierOne];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"WordTableViewCell" owner:self options:nil] objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        UIButton *btn = (UIButton *)[cell viewWithTag:68];
        [btn addTarget:self action:@selector(xiangJibtnClick:) forControlEvents:UIControlEventTouchUpInside];

    }else if (indexPath.section == 1){
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierTwo];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"WordTableViewCell" owner:self options:nil] objectAtIndex:1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        
    }else if (indexPath.section == 2){
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierThree];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"WordTableViewCell" owner:self options:nil] objectAtIndex:2];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
    }else if (indexPath.section == 3){
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierFour];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"WordTableViewCell" owner:self options:nil] objectAtIndex:3];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 78;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
- (void)xiangJibtnClick:(UIButton *)button
{
    
}
- (IBAction)backBtn:(UIButton *)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
