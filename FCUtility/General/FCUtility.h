//
// Created by 123456 on 15/10/21.
// Copyright (c) 2015 fc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FCUtility : NSObject
//+ (FCUtility *)utility;

+ (NSString *)dirDoc;

+ (void)writeFile:(NSString *)path content:(NSString *)content;

+ (NSString *)toJSONData:(id)data;

+ (id)toOCData:(NSString *)data;

+ (long)getRandomNumber:(long)from to:(long)to;

+ (BOOL)isBlankString:(NSString *)string;

+ (NSString *)trim:(NSString *)str;

+ (NSDateFormatter *)getDateFormatter:(NSString *)formatter;

+ (NSDateFormatter *)getDateFormatter:(NSString *)formatter timeZone:(NSTimeZone *)timeZone;

+ (long long)getCurrentMillisecond;

+ (int)getDaysOfMonth:(NSDate *)date;

@end