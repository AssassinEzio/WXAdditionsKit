//
//  NSString+WXAddition.h
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WXAddition)

- (NSString *)reverse;

- (NSString *)stringByRemovingWithPattern:(NSString *)patternString;

- (NSMutableAttributedString *)adjustTextColor:(UIColor *)color range:(NSRange)range;

- (BOOL)isEmpty;

- (BOOL)containsString:(NSString *)str;

- (NSString *)encryptedPhone;


@end

NS_ASSUME_NONNULL_END
