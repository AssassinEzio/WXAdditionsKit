//
//  NSArray+WXOperation.m
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

#import "NSArray+WXOperation.h"

@implementation NSArray (WXOperation)

- (CGFloat)getSum {
    return [[self valueForKeyPath:@"@sum.self"] floatValue];
}

- (CGFloat)getMax {
    return [[self valueForKeyPath:@"@max.self"] floatValue];
}
@end
