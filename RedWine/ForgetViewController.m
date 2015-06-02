//
//  ForgetViewController.m
//  RedWine
//
//  Created by LH on 15/5/26.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import "ForgetViewController.h"

@interface ForgetViewController ()

@end

@implementation ForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.passTf.delegate = self;
    self.sureTf.delegate = self;
    self.phoneTf.delegate = self;
    self.yanZmTf.delegate = self;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGes)];
    [self.scrollView addGestureRecognizer:tap];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
   
    [self.passTf resignFirstResponder];
    [self.sureTf resignFirstResponder];
    [self.phoneTf resignFirstResponder];
    [self.yanZmTf resignFirstResponder];
    
    [self setIfEnable:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    

    self.passTf.userInteractionEnabled = YES;
    self.sureTf.userInteractionEnabled = YES;
    self.phoneTf.userInteractionEnabled = YES;
    self.yanZmTf.userInteractionEnabled = YES;
}


#pragma mark - touch
-(void)tapGes
{
   
    [self.passTf resignFirstResponder];
    [self.sureTf resignFirstResponder];
    [self.phoneTf resignFirstResponder];
    [self.yanZmTf resignFirstResponder];
    
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
        
                [self.passTf resignFirstResponder];
        
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    return YES;
}


#pragma mark - 设置是否接收手势
-(void)setIfEnable:(BOOL)enabel
{
   
    self.passTf.userInteractionEnabled = enabel;
    self.sureTf.userInteractionEnabled = enabel;
    self.phoneTf.userInteractionEnabled = enabel;
    self.yanZmTf.userInteractionEnabled = enabel;
}
- (IBAction)okBtn:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)getBtn:(UIButton *)sender {
    
}

- (IBAction)backBtn:(UIButton *)sender {
    
   [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
