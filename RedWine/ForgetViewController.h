//
//  ForgetViewController.h
//  RedWine
//
//  Created by LH on 15/5/26.
//  Copyright (c) 2015年 LH. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ForgetViewController : UIViewController<UITextFieldDelegate,UIGestureRecognizerDelegate>
- (IBAction)backBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITextField *passTf;
@property (weak, nonatomic) IBOutlet UITextField *sureTf;
@property (weak, nonatomic) IBOutlet UITextField *phoneTf;
@property (weak, nonatomic) IBOutlet UITextField *yanZmTf;
@end
