//
//  SetUpExerciseViewController.m
//  RedWine
//
//  Created by LH on 15/6/1.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "SetUpExerciseViewController.h"
#import "ManageViewController.h"
@interface SetUpExerciseViewController ()

@end

@implementation SetUpExerciseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timeTf.delegate = self;
    self.peopelTf.delegate = self;
    self.cityTf.delegate = self;
    self.moneyTf.delegate = self;
    self.textTf.delegate = self;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGes)];
    [self.scrollView addGestureRecognizer:tap];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    [self.timeTf resignFirstResponder];
    [self.peopelTf resignFirstResponder];
    [self.cityTf resignFirstResponder];
    [self.moneyTf resignFirstResponder];
    [self.textTf resignFirstResponder];
    
    [self setIfEnable:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    self.timeTf.userInteractionEnabled = YES;
    self.peopelTf.userInteractionEnabled = YES;
    self.cityTf.userInteractionEnabled = YES;
    self.moneyTf.userInteractionEnabled = YES;
    self.textTf.userInteractionEnabled = YES;
}


#pragma mark - touch
-(void)tapGes
{
    
    [self.timeTf resignFirstResponder];
    [self.peopelTf resignFirstResponder];
    [self.cityTf resignFirstResponder];
    [self.moneyTf resignFirstResponder];
    [self.textTf resignFirstResponder];
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    [self.scrollView setContentOffset:CGPointMake(0, (textField.tag - 1)*30) animated:YES];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}
#pragma mark - uitextFiledDelegate 完成按钮
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        
        [self.timeTf resignFirstResponder];
        [self.peopelTf resignFirstResponder];
        [self.cityTf resignFirstResponder];
        [self.moneyTf resignFirstResponder];
        [self.textTf resignFirstResponder];
        
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    return YES;
}


#pragma mark - 设置是否接收手势
-(void)setIfEnable:(BOOL)enabel
{
    
    self.timeTf.userInteractionEnabled = enabel;
    self.peopelTf.userInteractionEnabled = enabel;
    self.cityTf.userInteractionEnabled = enabel;
    self.moneyTf.userInteractionEnabled = enabel;
    self.textTf.userInteractionEnabled = enabel;

}
- (IBAction)setUpBtn:(UIButton *)sender {
    
    ManageViewController *manage = [[ManageViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:manage animated:YES];
}

- (IBAction)backBtn:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
