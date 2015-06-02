//
//  SearchBarViewController.m
//  RedWine
//
//  Created by LH on 15/5/26.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "SearchBarViewController.h"
#import "FirstTableViewCell.h"
@interface SearchBarViewController ()


#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@end

@implementation SearchBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self table];
    
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,64, [UIScreen mainScreen].bounds.size.height, 44)];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"搜索";
    self.searchBar.barStyle = UIBarStyleDefault;
    self.searchTableView.tableHeaderView = self.searchBar;
    
    
}

#pragma mark-TableView
- (void)table
{
    
    UIView *view = [UIView new];
     self.searchTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    self.searchTableView.delegate = self;
    self.searchTableView.dataSource = self;
    self.searchTableView.showsHorizontalScrollIndicator = NO;
    self.searchTableView.showsVerticalScrollIndicator = NO;
    self.searchTableView.tableFooterView = view;
    self.searchTableView.rowHeight = 120;
    [self.view addSubview:self.searchTableView];
    

}
#pragma mark-TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return  10;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"FirstTableViewCell" owner:self options:nil]objectAtIndexedSubscript:1];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
    return cell;
}
#pragma mark-searchBar
//- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;
//{
//    if (searchText!=nil && searchText.length>0) {
//        self.dataArray= [NSMutableArray array];
//        for (Destination *dest in self.destinationArray) {
//            if ([dest.name rangeOfString:searchText options:NSCaseInsensitiveSearch].length >0 ) {
//                [self.dataArray addObject:dest];
//
//            }
//        }
//        [self.searchTableView reloadData];
//    }
//    else
//    {
//        self.dataArray = [NSMutableArray arrayWithArray:self.destinationArray];
//        [self.searchTableView reloadData];
//    }
//
//}

-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self searchBar:self.searchBar textDidChange:nil];
    [self.searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [self searchBar:self.searchBar textDidChange:nil];
    [self.searchBar resignFirstResponder];
}

- (IBAction)backBtn:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
