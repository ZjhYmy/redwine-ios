//
//  LoginViewController.m
//  RedWine
//
//  Created by LH on 15/5/26.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetViewController.h"


#import "FindViewController.h"
#import "FirstViewController.h"
#import "ChatViewController.h"
#import "CupboardViewController.h"
#import "OurViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userTf.delegate = self;
    self.passTf.delegate = self;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGes)];
    [self.scrollerView addGestureRecognizer:tap];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [self.userTf resignFirstResponder];
    [self.passTf resignFirstResponder];
    
    [self setIfEnable:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.userTf.userInteractionEnabled = YES;
    self.passTf.userInteractionEnabled = YES;
    
}


#pragma mark - touch
-(void)tapGes
{
    [self.userTf resignFirstResponder];
    [self.passTf resignFirstResponder];
}


#pragma mark - uitextviewdelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag == 1) {
        [self.scrollerView setContentOffset:CGPointMake(0, 30) animated:YES];
    }
    else if (textField.tag == 2)
    {
        [self.scrollerView setContentOffset:CGPointMake(0, 50) animated:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.scrollerView setContentOffset:CGPointMake(0, -64) animated:YES];
}

#pragma mark - uitextFiledDelegate 完成按钮
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        
        [self.userTf resignFirstResponder];
        [self.passTf resignFirstResponder];
        
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    return YES;
}


#pragma mark - 设置是否接收手势
-(void)setIfEnable:(BOOL)enabel
{
    self.userTf.userInteractionEnabled = enabel;
    self.passTf.userInteractionEnabled = enabel;
}


- (IBAction)LoginBtn:(UIButton *)sender {
    
    if (sender.tag ==71) {
        RegisterViewController *regist = [[RegisterViewController alloc]init];
        
        [self presentViewController:regist animated:YES completion:nil];
        
    }else if (sender.tag==72)
    {
        ForgetViewController *forget = [[ForgetViewController alloc]init];
        
        
        [self presentViewController:forget animated:YES completion:nil];
    }if (sender.tag==70) {
        
        
        UITabBarController *tabBarController = [[UITabBarController alloc]init];
        
        //首页
        FirstViewController *firstVC = [[FirstViewController alloc]init];
        firstVC.tabBarItem.title = @"首页";
        firstVC.tabBarItem.image = [UIImage imageNamed:@"6.png"];
        UINavigationController *firstNav = [[UINavigationController alloc]initWithRootViewController:firstVC];
        
        
        
        //聊天
        ChatViewController *chatVC = [[ChatViewController alloc]init];
        chatVC.tabBarItem.title = @"聊天";
        chatVC.tabBarItem.image = [UIImage imageNamed:@"2.png"];
        UINavigationController *chatNav = [[UINavigationController alloc]initWithRootViewController:chatVC];
        
        //酒柜
        CupboardViewController *cupboardVC = [[CupboardViewController alloc]init];
        cupboardVC.tabBarItem.title = @"酒柜";
        cupboardVC.tabBarItem.image = [UIImage imageNamed:@"4.png"];
        UINavigationController *cupboardNav  = [[UINavigationController alloc]initWithRootViewController:cupboardVC];
        
        //发现
        FindViewController *findVC = [[FindViewController alloc]init];
        findVC.tabBarItem.title = @"发现";
        findVC.tabBarItem.image = [UIImage imageNamed:@"1.png"];
        UINavigationController *findNav = [[UINavigationController alloc]initWithRootViewController:findVC];
        
        
        //我的
        OurViewController *ourVC = [[OurViewController alloc]init];
        ourVC.tabBarItem.title = @"我的";
        ourVC.tabBarItem.image = [UIImage imageNamed:@"3.png"];
        UINavigationController *ourNav  = [[UINavigationController alloc]initWithRootViewController:ourVC];
        
        
        tabBarController.viewControllers = @[firstNav,chatNav,cupboardNav,findNav,ourNav];
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
