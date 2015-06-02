//
//  FirstViewController.m
//  RedWine
//
//  Created by LH on 15/5/22.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"
#import "WebViewController.h"
#import "SearchBarViewController.h"
#import "IssueViewController.h"
#import "MessageViewController.h"

@interface FirstViewController ()
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

@end

@implementation FirstViewController

- (void)viewWillDisappear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = NO;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:50/255.0 green:63/255.0 blue:83/255.0 alpha:1];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self tableAndScrollView];
    
    
}

#pragma mark-Table
- (void)tableAndScrollView
{
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
    self.scrollView.delegate =self;
    self.scrollView.contentSize = CGSizeMake(ScreenWidth*4,0);
    self.scrollView.contentOffset = CGPointMake(0, 0);
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.showsHorizontalScrollIndicator = YES;
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.pagingEnabled = YES;

    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64-49) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    
   
    //scrollView 上得图片
    for (int i=0; i<4; i++)
    {
        UIImageView *img=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"image%d",i]]];
        img.frame=CGRectMake(ScreenWidth*i, 0, ScreenWidth, 150);
        img.userInteractionEnabled = YES;
        [self.scrollView addSubview:img];
        
    }
    
    //创建 PageControl
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(130, 120, 60, 30)];
    [self.pageControl addTarget:self action:@selector(pageControl:) forControlEvents:UIControlEventEditingChanged];
    self.pageControl.numberOfPages = 4;
    self.pageControl.currentPage = 0;
    [self.view addSubview:self.pageControl];
    
}

#pragma mark-pageControl
- (void)pageControl:(UIPageControl *)page
{
    NSInteger count = page.currentPage;
    
    [self.scrollView setContentOffset:CGPointMake(ScreenWidth*count,0) animated:YES];
}
#pragma mark-scrollViewDidEndDecelerating
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = _scrollView.contentOffset.x/ScreenWidth;
    
    self.pageControl.currentPage = index;
    
}

#pragma mark-TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }return 10;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifierOne = @"Cell1";
    static NSString *cellIdentifierTwo = @"Cell2";
    FirstTableViewCell *cell = nil;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierOne];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"FirstTableViewCell" owner:self options:nil] objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            
            UIButton *btn = (UIButton *)[cell viewWithTag:48];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            
            UISegmentedControl *segment =(UISegmentedControl *)[cell.contentView viewWithTag:33];
            [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
            

        }
        
        if (indexPath.row==0) {
            [cell.contentView addSubview:self.scrollView];
            [cell.contentView addSubview:self.pageControl];
            
            
        }
        
    }else if (indexPath.section == 1){
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierTwo];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"FirstTableViewCell" owner:self options:nil] objectAtIndex:1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }

    
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if (indexPath.row==0) {
            return 150;
        }else{
            return 75;
        }
        
    }else if (indexPath.section==1){
        return 120;
    }
    
    
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0) {
        if (indexPath.row==1) {
            return;
        }
    }else
    {
        WebViewController *webView = [[WebViewController alloc]init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:webView animated:YES];
    }
    
}
-(void)segmentAction:(UISegmentedControl *)Seg{
    NSInteger Index = Seg.selectedSegmentIndex;
    NSLog(@"Seg.selectedSegmentIndex:%ld",(long)Index);
    
    switch (Index) {
        case 0:
        {
            
        }
            break;
        case 1:
        {

        }
            break;
        default:
            break;
    }
    
}
- (void)btnClick:(UIButton *)button
{
    MessageViewController *message = [[MessageViewController alloc]init];
    
    [self.navigationController presentViewController:message animated:YES completion:nil];
}
- (IBAction)rightButton:(UIButton *)sender {
    
    if (sender.tag==2) {
        SearchBarViewController *search = [[SearchBarViewController alloc]init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:search animated:YES];
    }else
    {
        IssueViewController *issue = [[IssueViewController alloc]init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:issue animated:YES];
    }
}



@end
