//
//  ExerciseViewController.h
//  RedWine
//
//  Created by LH on 15/5/26.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExerciseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UISearchBar *searchBar;
@end
