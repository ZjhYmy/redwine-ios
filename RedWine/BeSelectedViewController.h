//
//  BeSelectedViewController.h
//  RedWine
//
//  Created by LH on 15/6/2.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeSelectedViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end