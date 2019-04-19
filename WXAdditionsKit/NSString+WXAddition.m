//
//  NSString+WXAddition.m
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

#import "NSString+WXAddition.h"

@implementation NSString (WXAddition)

- (NSString *)reverse {
    NSMutableString *reversedString = [NSMutableString string];
    NSInteger charIndex = [self length];
    while (charIndex > 0) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reversedString appendString:[self substringWithRange:subStrRange]];
    }
    return [reversedString copy];
}

- (NSString *)stringByRemovingWithPattern:(NSString *)patternString {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:patternString
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    return [regex stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:@""];
}

- (NSMutableAttributedString *)adjustTextColor:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    [attributedString setAttributes:@{ NSForegroundColorAttributeName: color } range:range];
    return attributedString;
}

- (BOOL)isEmpty {
    NSString *string =
    [[self stringByReplacingOccurrencesOfString:@" " withString:@""] stringByReplacingOccurrencesOfString:@"\n"
                                                                                               withString:@""];
    return !string.length;
}

- (BOOL)containsString:(NSString *)str {
    NSRange range = [self rangeOfString:str];
    return range.length != 0;
}

- (NSString *)encryptedPhone {
    if (!self || self.length < 8) {
        return @"****";
    }
    NSString *pattern = @"(1)[0-9]{10}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    if ([pred evaluateWithObject:self]) {
        return [self stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    }
    return self;
}



@end
