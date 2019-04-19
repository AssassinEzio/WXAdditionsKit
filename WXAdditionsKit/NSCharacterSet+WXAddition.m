//
//  NSCharacterSet+WXAddition.m
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

#import "NSCharacterSet+WXAddition.h"

#define UNICHAR_MAX (1ull << (CHAR_BIT * sizeof(unichar))) - 1
@implementation NSCharacterSet (WXAddition)

- (NSSet *)toSet {
    NSData *data = [self bitmapRepresentation];
    uint8_t *ptr = (uint8_t *)[data bytes];
    NSMutableSet *set = [NSMutableSet set];
    // following from Apple's sample code
    for (unichar i = 0; i < UNICHAR_MAX; i++) {
        if (ptr[i >> 3] & (1u << (i & 7))) {
            [set addObject:[NSString stringWithCharacters:&i length:1]];
        }
    }
    return set;
}
@end
