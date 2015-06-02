//
//  ExerciseTableViewCell.h
//  RedWine
//
//  Created by LH on 15/5/26.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExerciseTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *nameLab;//La名称
@property (strong, nonatomic) IBOutlet UILabel *placeLab;//地点
@property (strong, nonatomic) IBOutlet UILabel *moneyLab;//现金
@property (strong, nonatomic) IBOutlet UILabel *dateLab;//日期
@property (strong, nonatomic) IBOutlet UIImageView *bgImage;//bg图片
@property (strong, nonatomic) IBOutlet UILabel *diMingLab;

@end
