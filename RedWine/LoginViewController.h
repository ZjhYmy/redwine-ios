//
//  LoginViewController.h
//  RedWine
//
//  Created by LH on 15/5/26.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate,UIGestureRecognizerDelegate>

- (IBAction)LoginBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *userTf;
@property (weak, nonatomic) IBOutlet UITextField *passTf;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;

@end
