//
//  PinXiangViewController.h
//  RedWine
//
//  Created by LH on 15/5/27.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinXiangViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UITableView *tableView2;
@property (nonatomic,strong)UITableView *tableView3;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIButton *leftBtn;
@property (strong, nonatomic) IBOutlet UIButton *rightBtn;
@property (strong, nonatomic) IBOutlet UIButton *middleBtn;
@property (strong, nonatomic) IBOutlet UILabel *move;

@end
