//
//  ZBEntryCell.m
//  Diary
//
//  Created by wuzhengbin on 14-5-11.
//  Copyright (c) 2014年 withtrip. All rights reserved.
//

#import "ZBEntryCell.h"
#import "ZBDiaryEntry.h"

@interface ZBEntryCell ()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;//日期
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;//地理位置
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;//正文
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;//日记图片
@property (weak, nonatomic) IBOutlet UIImageView *moodImageView;//情绪小图

@end

@implementation ZBEntryCell

//返回 Cell 高度
+ (CGFloat)heightForEntry:(ZBDiaryEntry *)entry
{
    const CGFloat topMargin = 35.0f;
    const CGFloat bottomMargin = 80.0f;
    const CGFloat minHeight = 106.0f;
    
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGRect boundingBox = [entry.body boundingRectWithSize:CGSizeMake(208.0f, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: font} context:nil];
    
    return MAX(minHeight, CGRectGetHeight(boundingBox) + topMargin + bottomMargin);
}

//配置 Cell 内容
- (void)configureCellForEntry:(ZBDiaryEntry *)entry
{
    self.bodyLabel.text = entry.body;
    self.locationLabel.text = entry.location;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE, MMMM d yyyy"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:entry.date];
    self.dateLabel.text = [dateFormatter stringFromDate:date];
    
    if (entry.imageData)
        self.mainImageView.image = [UIImage imageWithData:entry.imageData];
    else
        self.mainImageView.image = [UIImage imageNamed:@"icn_noimage"];
    
    if (entry.mood == ZBDiaryEntryMoodGood)
        self.moodImageView.image = [UIImage imageNamed:@"icn_happy"];
    else if (entry.mood == ZBDiaryEntryMoodAverage)
        self.moodImageView.image = [UIImage imageNamed:@"icn_average"];
    else
        self.moodImageView.image = [UIImage imageNamed:@"icn_bad"];
    
    self.mainImageView.layer.cornerRadius = CGRectGetWidth(self.mainImageView.frame) / 2.0f;
    
    if (entry.location.length > 0)
        self.locationLabel.text = entry.location;
    else
        self.locationLabel.text = @"No location";
}

@end
