//
//  EnterViewController.m
//  RedWine
//
//  Created by LH on 15/5/28.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "EnterViewController.h"
#import "EnterTableViewCell.h"
#import "SureEnterViewController.h"
@interface EnterViewController (){
    NSInteger numberCount;
}

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@end

@implementation EnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    self.tableArray = [NSMutableArray arrayWithCapacity:0];
    [self table];
}
#pragma mark-Table
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
    if (section == 0) {
        return 1;
    }
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifierOne = @"Cell1";
    static NSString *cellIdentifierTwo = @"Cell2";
    EnterTableViewCell *cell = nil;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierOne];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"EnterTableViewCell" owner:self options:nil] objectAtIndex:0];

        }
        
        UIButton *button =(UIButton *)[cell.contentView viewWithTag:66];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *secondButton =(UIButton *)[cell.contentView viewWithTag:67];
        [secondButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }else if (indexPath.section == 1){
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierTwo];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"EnterTableViewCell" owner:self options:nil] objectAtIndex:1];
            }
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 97;
    }else if (indexPath.section==1){
        return 74;
    }
    
    
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
// 访问系统相册
- (void)buttonClick:(UIButton *)button
{
    if (button.tag ==66) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePickerController animated:YES completion:^{
            
        }];
    }else
    {
        numberCount+=1;
       
    }
    
}
//UIImagePickerController的代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
   UIButton *button =(UIButton *)[self.view viewWithTag:66];
    [picker dismissViewControllerAnimated:YES completion:^{
        
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSLog(@"%@",image);
        
        button.imageView.image = image;
    }];
    
    
}
//点击cancel按钮时调用
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"cancel");
        
    }];
}

- (IBAction)sureBtn:(UIButton *)sender {
    
    SureEnterViewController *sureEnter = [[SureEnterViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:sureEnter animated:YES];
}

- (IBAction)backBtn:(UIButton *)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
