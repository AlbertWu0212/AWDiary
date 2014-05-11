//
//  ZBDiaryEntry.h
//  Diary
//
//  Created by wuzhengbin on 14-5-11.
//  Copyright (c) 2014年 withtrip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ENUM(int16_t, ZBDiaryEntryMood) {
    ZBDiaryEntryMoodGood = 0,
    ZBDiaryEntryMoodAverage = 1,
    ZBDiaryEntryMoodBad = 2,
};

@interface ZBDiaryEntry : NSManagedObject

@property (nonatomic) NSTimeInterval date;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSData * imageData;
@property (nonatomic) int16_t mood;
@property (nonatomic, retain) NSString * location;

@property (nonatomic, readonly) NSString *sectionName;

@end
