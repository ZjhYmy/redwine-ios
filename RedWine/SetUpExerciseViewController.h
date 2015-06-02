//
//  SetUpExerciseViewController.h
//  RedWine
//
//  Created by LH on 15/6/1.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetUpExerciseViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *leftImage;
@property (strong, nonatomic) IBOutlet UITextField *timeTf;
@property (strong, nonatomic) IBOutlet UITextField *peopelTf;
@property (strong, nonatomic) IBOutlet UITextField *cityTf;
@property (strong, nonatomic) IBOutlet UITextField *moneyTf;
@property (strong, nonatomic) IBOutlet UITextField *textTf;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
