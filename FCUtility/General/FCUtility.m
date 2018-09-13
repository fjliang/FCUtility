//
// Created by 123456 on 15/10/21.
// Copyright (c) 2015 fc. All rights reserved.
//

#import <sys/time.h>
#import "FCUtility.h"


@implementation FCUtility {

}

+ (FCUtility *)utility {
    static FCUtility *utility = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        utility = [[self alloc] init];
    });
    return utility;
}

/**
 *  获取Documents目录
 *
 *  @return Documents目录
 */
+ (NSString *)dirDoc {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    return documentsDirectory;
}

/**
 *  写文件
 *
 *  @param path    文件路径
 *  @param content 文件内容
 */
+ (void)writeFile:(NSString *)path content:(NSString *)content {

    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:path]) {
        [manager createFileAtPath:path contents:nil attributes:nil];
    }

    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
    if (fileHandle == nil) {
        return;
    }

    [fileHandle seekToEndOfFile];
    [fileHandle writeData:[content dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandle closeFile];

}


/**
 *  将字典或者数组转化为JSON串
 *
 *  @param data  NSDictionary 或 NSArray
 *
 *  @return json字符串
 */
+ (NSString *)toJSONData:(id)data {
    if (!data)
        return nil;

    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if ([jsonData length] > 0 && !error) {
        NSString *result = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return [result stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    }
    return nil;
}

/**
 *  将JSON字符串转为字典或数组
 *
 *  @param NSString
 *
 *  @return NSArray 或 NSDictionary
 */
+ (id)toOCData:(NSString *)data {
    if (!data)
        return nil;

    NSData *jsonData = [data dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    id o = [NSJSONSerialization JSONObjectWithData:jsonData
                                           options:NSJSONReadingMutableContainers
                                             error:&error];
    if (o && !error) {
        return o;
    }
    return nil;
}

/**
 *  获取指定区间随机数
 *
 *  @param from  起始
 *  @param to    结束
 *
 *  @return
 */
+ (long)getRandomNumber:(long)from to:(long)to {
    return (long) (from + (arc4random() % (to - from + 1)));
}

/**
 *  字符串判空
 *
 *  @param string
 *
 *  @return  YES 空  NO 非空
 */
+ (BOOL)isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self trim:string] length] == 0) {
        return YES;
    }
    return NO;
}

/**
 *  字符串去空格
 *
 *  @param str
 *
 *  @return
 */
+ (NSString *)trim:(NSString *)str {
    NSString *cleanString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return cleanString;
}

/**
 *  获取NSDateFormatter(默认使用系统时区)
 *
 *  @param formatter yyyy-MM-dd (格式)
 *
 *  @return
 */
+ (NSDateFormatter *)getDateFormatter:(NSString *)formatter {
    return [self getDateFormatter:formatter timeZone:[NSTimeZone systemTimeZone]];
}

/**
 *  获取NSDateFormatter
 *
 *  @param formatter  yyyy-MM-dd (格式)
 *  @param timeZone   时区
 *
 *  @return
 */
+ (NSDateFormatter *)getDateFormatter:(NSString *)formatter timeZone:(NSTimeZone *)timeZone {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    dateFormatter.timeZone = timeZone;
//    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hans"];
    return dateFormatter;
}

/**
 *  获取当前毫秒
 *
 *  @return
 */
+ (long long)getCurrentMillisecond {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return ((long long) tv.tv_sec) * 1000 + tv.tv_usec / 1000;
}

/**
 *  获取指定月份的天数
 *
 *  @param date  yyyy-MM-dd (格式)
 *  @return
 */
+ (int)getDaysOfMonth:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}

@end