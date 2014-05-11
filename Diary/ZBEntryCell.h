//
//  ZBEntryCell.h
//  Diary
//
//  Created by wuzhengbin on 14-5-11.
//  Copyright (c) 2014年 withtrip. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZBDiaryEntry;

@interface ZBEntryCell : UITableViewCell

+ (CGFloat)heightForEntry:(ZBDiaryEntry *)entry;

- (void)configureCellForEntry:(ZBDiaryEntry *)entry;

@end
