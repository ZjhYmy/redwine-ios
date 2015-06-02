//
//  ExerciseViewController.m
//  RedWine
//
//  Created by LH on 15/5/26.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "ExerciseViewController.h"
#import "ExerciseTableViewCell.h"
#import "SetUpExerciseViewController.h"
@interface ExerciseViewController ()


#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@end

@implementation ExerciseViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.hidesBottomBarWhenPushed = YES;
    
}
- (void)viewWillDisappear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden =YES ;
    [self table];
    
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.height, 44)];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"搜索";
//    self.searchBar.barTintColor = [UIColor whiteColor];
    self.searchBar.barStyle = UIBarStyleDefault;
    self.tableView.tableHeaderView = self.searchBar;
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


#pragma mark-TableView
- (void)table
{
    UIView *view = [UIView new];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.tableFooterView = view;
    [self.view addSubview:self.tableView];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.searchBar resignFirstResponder];
}
#pragma mark-TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static  NSString *Identifier = @"cell";
    ExerciseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ExerciseTableViewCell" owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 232;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

- (IBAction)backBtn:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addBtn:(UIButton *)sender {
    
    SetUpExerciseViewController *setup = [[SetUpExerciseViewController alloc]init];
    
    [self.navigationController pushViewController:setup animated:YES];
}


@end
