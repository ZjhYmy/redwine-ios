//
//  GrapeTableViewCell.h
//  RedWine
//
//  Created by LH on 15/5/26.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GrapeTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *cellTouXiangImage;//cell1头像
@property (strong, nonatomic) IBOutlet UILabel *cellNameLab;//cell1名字
@property (strong, nonatomic) IBOutlet UILabel *cellContent;//cell1内容
@property (strong, nonatomic) IBOutlet UIImageView *cellImage1;
@property (strong, nonatomic) IBOutlet UIImageView *cellImag2;
@property (strong, nonatomic) IBOutlet UIImageView *cellImage3;
@property (strong, nonatomic) IBOutlet UIImageView *cellImage4;
@property (strong, nonatomic) IBOutlet UILabel *cellTimeLab;//cell1时间
@property (strong, nonatomic) IBOutlet UILabel *cellZhiShiLab;//cell1知识
@property (strong, nonatomic) IBOutlet UILabel *cellPingLun;//cell1评论数



@property (strong, nonatomic) IBOutlet UIImageView *cell2TouXiangImage;//cell2头像
@property (strong, nonatomic) IBOutlet UILabel *cell2NameLab;//cell1名字
@property (strong, nonatomic) IBOutlet UILabel *cell2NeiRongLab;//cell2内容
@property (strong, nonatomic) IBOutlet UIImageView *cell2Image;//cell2图片
@property (strong, nonatomic) IBOutlet UILabel *cell2ConnectLab;//cell2内容
@property (strong, nonatomic) IBOutlet UILabel *cell2TimeLab;//cell2时间
@property (strong, nonatomic) IBOutlet UILabel *cell2ZhiShiLab;//cell2知识
@property (strong, nonatomic) IBOutlet UILabel *cell2PingLunLan;//cell2评论数


@end
