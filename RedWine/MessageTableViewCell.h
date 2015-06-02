//
//  MessageTableViewCell.h
//  RedWine
//
//  Created by LH on 15/5/29.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;//头像图片
@property (strong, nonatomic) IBOutlet UILabel *nameLab;//昵称
@property (strong, nonatomic) IBOutlet UILabel *neiRongLab;//内容
@property (strong, nonatomic) IBOutlet UILabel *timeLab;//时间

@end
