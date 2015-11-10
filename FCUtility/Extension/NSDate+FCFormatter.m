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
    return [[FCUtility getDateFormatter:formatter] stringFromDate:self];
}

/**
 *  获取 yyyy-MM-dd 格式日期字符串
 *
 *  @return
 */
- (NSString *)YMDDate {
    return [[FCUtility getDateFormatter:FC_yyyy_MM_dd] stringFromDate:self];
}

/**
 *  获取 yyyy-MM-dd HH:mm:ss 格式日期字符串
 *
 *  @return
 */
- (NSString *)YMDHMSDate {
    return [[FCUtility getDateFormatter:FC_yyyy_MM_dd_HH_mm_ss] stringFromDate:self];
}
@end


@implementation NSString (FCFormatter)

/**
 *  获取当前时间戳(秒)
 *
 *  @return
 */
- (NSString *)getCurrenteTimeStamp {
    return [NSString stringWithFormat:@"%li", (long) time(nil)];
}

/**
 *  <#Description#>
 *
 *  @param formatter <#formatter description#>
 *
 *  @return <#return value description#>
 */
- (NSString *)timeStamp:(NSString *)formatter {
    return [NSString stringWithFormat:@"%ld", (long) [[self getDate:formatter] timeIntervalSince1970]];
}

/**
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
- (NSString *)timeStamp {
    return [self timeStamp:FC_yyyy_MM_dd];
}

/**
 *  <#Description#>
 *
 *  @param formatter <#formatter description#>
 *
 *  @return <#return value description#>
 */
- (NSDate *)getDate:(NSString *)formatter {
    return [[FCUtility getDateFormatter:formatter] dateFromString:self];
}

/**
 *  <#Description#>
 *
 *  @return <#return value description#>
 */
- (NSDate *)getDate {
    return [[FCUtility getDateFormatter:FC_yyyy_MM_dd] dateFromString:self];
}
@end
