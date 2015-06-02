//
//  AppDelegate.m
//  RedWine
//
//  Created by LH on 15/5/22.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "AppDelegate.h"
#import "FindViewController.h"
#import "FirstViewController.h"
#import "ChatViewController.h"
#import "CupboardViewController.h"
#import "OurViewController.h"
#import "LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
//    LoginViewController *login = [[LoginViewController alloc]init];
//    self.window.rootViewController = login;
    
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    self.window.rootViewController = tabBarController;

    
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
    [self.window makeKeyAndVisible];
    return YES;
}

@end
