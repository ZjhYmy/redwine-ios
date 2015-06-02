//
//  SearchBarViewController.h
//  RedWine
//
//  Created by LH on 15/5/26.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchBarViewController : UIViewController<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *searchTableView;

@property (nonatomic,strong)UISearchBar *searchBar;
@end
