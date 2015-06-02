//
//  IssueViewController.h
//  RedWine
//
//  Created by LH on 15/5/27.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IssueViewController : UIViewController<UITextViewDelegate,UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) UILabel *label;
@end
