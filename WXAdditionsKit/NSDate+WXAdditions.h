//
//  NSDate+WXAdditions.h
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (WXAdditions)

/**
 获取时间字符串，指定 dataFormat
 
 @param date
 @param dataFormat
 @return
 */
+ (NSString *)stringFromDate:(NSDate *)date setDateFormat:(NSString *)dataFormat;

/**
 获取 NSDate，指定 dataFormat
 
 @param dateString
 @param dataFormat
 @return
 */
+ (nullable NSDate *)dateFromString:(NSString *)dateString setDateFormat:(NSString *)dataFormat;

/**
 获取当前时间字符串，指定 dataFormat
 
 @param format @"yyyy-MM-dd HH:mm:ss"、@"yyyy年MM月dd日 HH时mm分ss秒"
 @return
 */
+ (NSString *)currentDateWithFormat:(NSString *)format;

/**
 计算两个时间戳的差值
 
 @param timestamp
 @param anotherTimestamp
 @return 差值
 */
+ (NSInteger)differenceOfTimestamp:(NSInteger)timestamp anotherTimestamp:(NSInteger)anotherTimestamp;

/**
 根据时间戳计算距离现在的时间
 
 @param lastTime
 @param currentTime
 @return
 */
+ (NSString *)timeIntervalFromLastTime:(NSDate *)lastTime ToCurrentTime:(NSDate *)currentTime;

/**
 *  获取时间段的描述，xx时xx分
 *
 *  @param timeInterval 多少秒
 */
+ (NSString *)timeIntervalString:(NSInteger)timeInterval;

@end


NS_ASSUME_NONNULL_END
