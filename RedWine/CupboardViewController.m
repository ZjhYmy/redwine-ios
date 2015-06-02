//
//  CupboardViewController.m
//  RedWine
//
//  Created by LH on 15/5/22.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "CupboardViewController.h"
#import "CupboardTableViewCell.h"
#import "CupBoardDetailsViewController.h"
#import "WebViewController.h"
#import "EnterViewController.h"
@interface CupboardViewController ()

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@end

@implementation CupboardViewController
- (void)viewWillDisappear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self setScrollV];
    [self tableV];
    
}
#pragma mark-scrollView
- (void)setScrollV
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 114, ScreenWidth, 35)];
    self.scrollView.delegate =self;
    self.scrollView.backgroundColor = [UIColor whiteColor];
//    self.scrollView.contentSize = CGSizeMake((ScreenWidth-240)*3,0);
    self.scrollView.contentSize = CGSizeMake((ScreenWidth-213)*3,0);
    self.scrollView.contentOffset = CGPointMake(0, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    [self.view addSubview:self.scrollView];
    
    NSArray *titleArray = @[@"国家",@"产区",@"年份"];
    for (NSInteger i=0; i<3; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake((ScreenWidth-213)*i, 0, (ScreenWidth-213), self.scrollView.bounds.size.height);
        button.tag = 10+i;
        if (button.tag==10) {
            [button setTitleColor:[UIColor colorWithRed:236/255.0 green:99/255.0 blue:41/255.0 alpha:1] forState:UIControlStateNormal];
        }else{
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button addTarget:self action:@selector(setScBtn:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        
        [self.scrollView addSubview:button];
    }
    

}
#pragma mark-Table
- (void)tableV
{
    
    
    UIView *view =[UIView new];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 150, ScreenWidth, ScreenHeight-200) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.tableFooterView = view;
    [self.view addSubview:self.tableView];
    
    
    self.search = [[UISearchBar alloc]initWithFrame:CGRectMake(0,64,ScreenWidth , 44)];
    self.search.delegate = self;
    self.search.placeholder = @"搜索";
    self.search.barStyle = UIBarStyleDefault;
    //self.search.barTintColor = [UIColor whiteColor];
    [self.view addSubview:self.search];
    
    //UIImageView *searchImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"find_sousuo"]];
    //searchImage.frame = CGRectMake(10,5, [UIScreen mainScreen].bounds.size.width-20, 34);
    //[self.search addSubview:searchImage];
    
}
//#pragma mark-searchBar
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
//        [self.tableView reloadData];
//    }
//    else
//    {
//        self.dataArray = [NSMutableArray arrayWithArray:self.destinationArray];
//        [self.tableView reloadData];
//    }
//    
//}
//
//-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
//    [self searchBar:self.search textDidChange:nil];
//    [self.search resignFirstResponder];
//}
//
//- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
//{
//    [self searchBar:self.search textDidChange:nil];
//    [self.search resignFirstResponder];
//}


#pragma mark-TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifierOne = @"Cell";
    CupboardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierOne];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CupboardTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 65;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    WebViewController *webView = [[WebViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webView animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (void)setScBtn:(UIButton *)button
{
        static NSInteger currentSelectBtn = 0;
        static NSInteger previousSelectBtn = 10;
        currentSelectBtn = button.tag;
    
        UIButton *previousbtn = (UIButton *)[self.view viewWithTag:previousSelectBtn];
        [previousbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
        UIButton *currentbtn = (UIButton *)[self.view viewWithTag:currentSelectBtn];
       [currentbtn setTitleColor:[UIColor colorWithRed:236/255.0 green:99/255.0 blue:41/255.0 alpha:1] forState:UIControlStateNormal];
    
        previousSelectBtn = currentSelectBtn;
}
- (IBAction)sheetBtn:(UIButton *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"入库", @"出库",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
   
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0) {
        
        EnterViewController *enter = [[EnterViewController alloc]init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:enter animated:YES];
        
    }else if (buttonIndex == 1) {
        
        WebViewController *webView = [[WebViewController alloc]init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:webView animated:YES];
        
    }    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
