//
//  FirstTableViewCell.h
//  RedWine
//
//  Created by LH on 15/5/22.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLab; //名字
@property (weak, nonatomic) IBOutlet UIImageView *touXiangLab;//头像
@property (weak, nonatomic) IBOutlet UILabel *contentLab;//内容
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;//时间
@property (weak, nonatomic) IBOutlet UILabel *yanJingLab;//眼睛数
@property (weak, nonatomic) IBOutlet UILabel *supportLab;//点赞数
@property (weak, nonatomic) IBOutlet UILabel *commentLab;//评论数

@end
