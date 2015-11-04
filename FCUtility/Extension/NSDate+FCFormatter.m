//
// Created by 123456 on 15/11/4.
// Copyright (c) 2015 fc. All rights reserved.
//

#import "NSDate+FCFormatter.h"
#import "FCUtility.h"

@implementation NSDate (FCFormatter)

- (NSString *)formatterDate:(NSString *)formatter {
    return [[FCUtility getDateFormatter:formatter] stringFromDate:self];
}

- (NSString *)YMDDate {
    return [[FCUtility getDateFormatter:FC_yyyy_MM_dd] stringFromDate:self];
}

- (NSString *)YMDHMSDate {
    return [[FCUtility getDateFormatter:FC_yyyy_MM_dd_HH_mm_ss] stringFromDate:self];
}
@end

@implementation NSString (FCFormatter)

- (NSString *)getCurrenteTimeStamp {
    return [NSString stringWithFormat:@"%ld", (long) time(nil)];
}

- (NSString *)timeStamp:(NSString *)formatter {
    return [NSString stringWithFormat:@"%ld", (long) [[self getDate:formatter] timeIntervalSince1970]];
}

- (NSString *)timeStamp {
    return [self timeStamp:FC_yyyy_MM_dd];
}

- (NSDate *)getDate:(NSString *)formatter {
    return [[FCUtility getDateFormatter:formatter] dateFromString:self];
}

- (NSDate *)getDate {
    return [[FCUtility getDateFormatter:FC_yyyy_MM_dd] dateFromString:self];
}
@end
