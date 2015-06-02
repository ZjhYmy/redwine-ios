//
//  WordTableViewCell.h
//  RedWine
//
//  Created by LH on 15/5/28.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *cell2NeiRongLab;//cell2内容
@property (strong, nonatomic) IBOutlet UILabel *cell2TimeLab;//cell2时间




@property (strong, nonatomic) IBOutlet UIImageView *cell3image1;
@property (strong, nonatomic) IBOutlet UIImageView *cell3Image2;
@property (strong, nonatomic) IBOutlet UIImageView *cell3Image3;
@property (strong, nonatomic) IBOutlet UIImageView *cell3Image4;
@property (strong, nonatomic) IBOutlet UILabel *cell3NeiRongLab;//cell3内容
@property (strong, nonatomic) IBOutlet UILabel *cell3ShuliangLab;//cell3共几张
@property (strong, nonatomic) IBOutlet UILabel *cell3DateLab;//cell3日期
@property (strong, nonatomic) IBOutlet UILabel *cell3mondyLab;//cell3月份



@property (strong, nonatomic) IBOutlet UILabel *cell4dateLab;//cell4日期
@property (strong, nonatomic) IBOutlet UILabel *cell4mondyLab;//cell4月份
@property (strong, nonatomic) IBOutlet UILabel *cell4NeiRonglab;//cell4内容
@property (strong, nonatomic) IBOutlet UIImageView *cell4Image;//cell4图片
@property (strong, nonatomic) IBOutlet UILabel *cell4ImgeEndLab;//cell4图片后的Lab


@end
