//
// Created by 123456 on 15/11/4.
// Copyright (c) 2015 fc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FC_yyyy_MM_dd @"yyyy-MM-dd"
#define FC_yyyy_MM_dd_HH_mm_ss @"yyyy-MM-dd HH:mm:ss"

@interface NSDate (FCFormatter)
- (NSString *)YMDDate;

- (NSString *)YMDHMSDate;

- (NSString *)formatterDate:(NSString *)formatter;

- (NSDate *)localeDate;

@end


@interface NSString (FCFormatter)

- (NSString *)getCurrenteTimeStamp;

- (NSDate *)getDate;

- (NSDate *)getDate:(NSString *)formatter;

- (NSString *)timeStampStr;

- (NSString *)timeStampStr:(NSString *)format;

- (long)timeStamp:(NSString *)formatter;


@end