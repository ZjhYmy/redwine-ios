//
//  PinXTableViewCell.h
//  RedWine
//
//  Created by LH on 15/5/26.
//  Copyright (c) 2015年 LH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinXTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *touXiangIMage;
@property (strong, nonatomic) IBOutlet UILabel *nameLab;
@property (strong, nonatomic) IBOutlet UILabel *wineNameLab;
@property (strong, nonatomic) IBOutlet UILabel *timeLab;
@property (strong, nonatomic) IBOutlet UILabel *moneyLan;
@property (strong, nonatomic) IBOutlet UILabel *jieDanLab;
@property (strong, nonatomic) IBOutlet UILabel *pinXiangLab;
@end
