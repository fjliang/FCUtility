//
// Created by 123456 on 15/11/4.
// Copyright (c) 2015 fc. All rights reserved.
//

#import "NSDate+FCFormatter.h"
#import "FCUtility.h"

@implementation NSDate (FCFormatter)
/**
 *  格式化Date
 *
 *  @param formatter  日期格式(yyyy-MM-dd)
 *
 *  @return  formatter指定的格式
 */
- (NSString *)formatterDate:(NSString *)formatter {
    return [[FCUtility getDateFormatter:formatter] stringFromDate: self ];
}

/**
 *  获取 yyyy-MM-dd 格式日期字符串
 *
 *  @return
 */
- (NSString *)YMDDate {
    return [[FCUtility getDateFormatter:FC_yyyy_MM_dd] stringFromDate: self ];
}

/**
 *  获取 yyyy-MM-dd HH:mm:ss 格式日期字符串
 *
 *  @return
 */
- (NSString *)YMDHMSDate {
    return [[FCUtility getDateFormatter:FC_yyyy_MM_dd_HH_mm_ss] stringFromDate: self ];
}

/**
 * 获取系统时区的Date
 */
- (NSDate *)localeDate {
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:self];
    NSDate *localeDate = [self dateByAddingTimeInterval:interval];
    return localeDate;
}


@end


@implementation NSString (FCFormatter)

/**
 *  获取当前时间戳(秒)
 *
 *  @return
 */
- (NSString *)getCurrenteTimeStamp {
    return [NSString stringWithFormat:@"%ld", (long) time(nil)];
}

/**
 * 日期字符串 -->  时间戳字符串(秒)
 *
 *  @param formatter  日期格式(yyyy-MM-dd)
 *
 *  @return
 */
- (NSString *)timeStampStr:(NSString *)formatter {
    return [NSString stringWithFormat:@"%ld", [self timeStamp:formatter]];
}

/**
 * 日期字符串 -->  时间戳(秒)
 *
 *  @param formatter  日期格式(yyyy-MM-dd)
 *
 *  @return
 */
- (long)timeStamp:(NSString *)formatter {
    NSDate *date = [[FCUtility getDateFormatter:formatter] dateFromString:self];
    return (long) [date timeIntervalSince1970];
}

/**
 *  yyyy-MM-dd格式日期字符串 -->  时间戳字符串(秒)
 *
 *  @return
 */
- (NSString *)timeStampStr {
    return [self timeStampStr:FC_yyyy_MM_dd];
}

/**
 *  日期字符串 -->  NSDate
 *
 *  @param formatter 日期格式
 *
 *  @return
 */
- (NSDate *)getDate:(NSString *)formatter {
    NSDate *date = [[FCUtility getDateFormatter:formatter] dateFromString:self];
    return [date localeDate];
}

/**
 *  yyyy-MM-dd格式日期字符串 --> NSDate
 *
 *  @return
 */
- (NSDate *)getDate {
    NSDate *date = [[FCUtility getDateFormatter:FC_yyyy_MM_dd] dateFromString:self];
    return [date localeDate];
}
@end
