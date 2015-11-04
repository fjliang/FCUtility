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
- (NSString *)dirDoc {
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
- (void)writeFile:(NSString *)path content:(NSString *)content {

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
- (NSString *)toJSONData:(id)data {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if ([jsonData length] > 0 && !error) {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
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
- (long)getRandomNumber:(long)from to:(long)to {
    return (long) (from + (arc4random() % (to - from + 1)));
}


- (BOOL)isBlankString:(NSString *)string {
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


- (NSString *)trim:(NSString *)str {
    NSString *cleanString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return cleanString;
}

+ (NSDateFormatter *)getDateFormatter:(NSString *)formatter {
    return [self getDateFormatter:formatter timeZone:[NSTimeZone systemTimeZone]];
}

+ (NSDateFormatter *)getDateFormatter:(NSString *)formatter timeZone:(NSTimeZone *)timeZone {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    dateFormatter.timeZone = timeZone;
    return dateFormatter;
}

+ (long)getCurrentillisecond {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return tv.tv_sec * 1000 + tv.tv_usec / 1000;
}

@end