//
//  InformationViewController.m
//  RedWine
//
//  Created by LH on 15/5/27.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "InformationViewController.h"
#import "InformationTableViewCell.h"
#import "WeiXunHaoViewController.h"
#import "SginViewController.h"
#import "TwoDimensionalViewController.h"
@interface InformationViewController ()

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

@end

@implementation InformationViewController

- (void)viewWillDisappear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.firstTitleArray = @[@"头像",@"昵称",@"微醺号",@"二维码名称",@"我的地址"];
    self.secondTitleArray = @[@"性别",@"地区",@"个性签名"];
    
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
    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifierOne = @"Cell1";
    static NSString *cellIdentifierTwo = @"Cell2";
    InformationTableViewCell *cell = nil;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierOne];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"InformationTableViewCell" owner:self options:nil] objectAtIndex:0];
            
            
        }
        
        UIButton *btn = (UIButton *)[cell viewWithTag:10];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn2 = (UIButton *)[cell viewWithTag:11];
        [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn3 = (UIButton *)[cell viewWithTag:12];
        [btn3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn4 = (UIButton *)[cell viewWithTag:13];
        [btn4 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn5 = (UIButton *)[cell viewWithTag:14];
        [btn5 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

    }else if (indexPath.section == 1){
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierTwo];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"InformationTableViewCell" owner:self options:nil] objectAtIndex:1];

        }
        
        UIButton *btn = (UIButton *)[cell viewWithTag:15];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn2 = (UIButton *)[cell viewWithTag:16];
        [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn3 = (UIButton *)[cell viewWithTag:17];
        [btn3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        
       return 238;
    }return 117;
}
- (void)btnClick:(UIButton *)button
{
    switch (button.tag) {
        case 10:
        {
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
            imagePickerController.delegate = self;
            imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:imagePickerController animated:YES completion:^{
                
            }];

        }
            break;
        case 11:
        case 12:
        {
            WeiXunHaoViewController *weixun = [[WeiXunHaoViewController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:weixun animated:YES];
        }
            break;
        case 13:
        {
            TwoDimensionalViewController *two = [[TwoDimensionalViewController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:two animated:YES];
        }
            break;
        case 14:
        {
            
        }
            break;
        case 15:
        {
            
        }
            break;
        case 16:
        {
           
        }
            break;
        case 17:
        {
            SginViewController *sgin = [[SginViewController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:sgin animated:YES];
        }
            break;
            
            
        default:
            break;
    }
}
//UIImagePickerController的代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImageView *imageview =(UIImageView *)[self.view viewWithTag:888];
    [picker dismissViewControllerAnimated:YES completion:^{
        
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSLog(@"%@",image);
        
        imageview.image = image;
    }];
    
    
}
//点击cancel按钮时调用
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"cancel");
        
    }];
}

- (IBAction)backBtn:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
