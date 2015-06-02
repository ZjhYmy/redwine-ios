//
//  MyExerciseViewController.m
//  RedWine
//
//  Created by LH on 15/5/27.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "MyExerciseViewController.h"
#import "PinXTableViewCell.h"
@interface MyExerciseViewController ()

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@end

@implementation MyExerciseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBar.hidden = YES;
    [self setScrollView];
    [self tableV];
}

#pragma mark-setScrollView
- (void)setScrollView
{
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(320*3,0);
    self.scrollView.contentOffset = CGPointMake(0, 0);
    self.scrollView.showsHorizontalScrollIndicator = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger offX = scrollView.contentOffset.x / ScreenWidth;
    
    
    if (offX == 0) {
        
        self.moveLab.frame = CGRectMake(self.leftBtn.frame.origin.x+10, 43, 70, 1);
        
        [self.leftBtn setTitleColor:[UIColor colorWithRed:32/255.0 green:174/255.0 blue:137/255.0 alpha:1] forState:UIControlStateNormal];
        [self.middleBtn setTitleColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1] forState:UIControlStateNormal];
        [self.rightBtn setTitleColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1] forState:UIControlStateNormal];
        
    }else if(offX == 1){
        
        
        self.moveLab.frame = CGRectMake(self.middleBtn.frame.origin.x+10, 43, 70, 1);
        
        [self.leftBtn setTitleColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1] forState:UIControlStateNormal];
        
        [self.middleBtn setTitleColor:[UIColor colorWithRed:32/255.0 green:174/255.0 blue:137/255.0 alpha:1] forState:UIControlStateNormal];
        
        [self.rightBtn setTitleColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1] forState:UIControlStateNormal];
    }else
    {
        self.moveLab.frame = CGRectMake(self.rightBtn.frame.origin.x+10, 43, 70, 1);
        
        [self.leftBtn setTitleColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1] forState:UIControlStateNormal];
        
        [self.middleBtn setTitleColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1] forState:UIControlStateNormal];
        
        [self.rightBtn setTitleColor:[UIColor colorWithRed:32/255.0 green:174/255.0 blue:137/255.0 alpha:1] forState:UIControlStateNormal];
    }
}

#pragma mark-Table
- (void)tableV
{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-130) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.scrollView addSubview:self.tableView];
    
    
    self.tableView2 = [[UITableView alloc]initWithFrame:CGRectMake(320, 0, ScreenWidth, ScreenHeight-130) style:UITableViewStylePlain];
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    self.tableView2.backgroundColor = [UIColor clearColor];
    self.tableView2.showsHorizontalScrollIndicator = NO;
    self.tableView2.showsVerticalScrollIndicator = NO;
    [self.scrollView addSubview:self.tableView2];
    
    
    self.tableView3 = [[UITableView alloc]initWithFrame:CGRectMake(640, 0, ScreenWidth, ScreenHeight-130) style:UITableViewStylePlain];
    self.tableView3.delegate = self;
    self.tableView3.dataSource = self;
    self.tableView3.backgroundColor = [UIColor clearColor];
    self.tableView3.showsHorizontalScrollIndicator = NO;
    self.tableView3.showsVerticalScrollIndicator = NO;
    [self.scrollView addSubview:self.tableView3];

    
    
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
    
    
    PinXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PinXTableViewCell" owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
       
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 135;
}

- (IBAction)BackBtn:(UIButton *)sender {
    

    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)buttonClick:(UIButton *)sender {
    
    [self.scrollView setContentOffset:CGPointMake((sender.tag - 55) * ScreenWidth, 0) animated:YES];
    self.moveLab.frame = CGRectMake(sender.frame.origin.x+10, 43, 70, 1);
    
    if (sender.tag == 55) {
        
        [self.leftBtn setTitleColor:[UIColor colorWithRed:32/255.0 green:174/255.0 blue:137/255.0 alpha:1] forState:UIControlStateNormal];
        
        [self.middleBtn setTitleColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1] forState:UIControlStateNormal];
        [self.rightBtn setTitleColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1] forState:UIControlStateNormal];
        
        
        
    }
    if(sender.tag==56)
    {
        
        
        [self.leftBtn setTitleColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1] forState:UIControlStateNormal];
        
        [self.middleBtn setTitleColor:[UIColor colorWithRed:32/255.0 green:174/255.0 blue:137/255.0 alpha:1] forState:UIControlStateNormal];
        
        [self.rightBtn setTitleColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1] forState:UIControlStateNormal];
        
    }
    if(sender.tag==57)
    {
        
        [self.leftBtn setTitleColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1] forState:UIControlStateNormal];
        
        [self.middleBtn setTitleColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1] forState:UIControlStateNormal];
        
        [self.rightBtn setTitleColor:[UIColor colorWithRed:32/255.0 green:174/255.0 blue:137/255.0 alpha:1] forState:UIControlStateNormal];
        
    }

}

@end
