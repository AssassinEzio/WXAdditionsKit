//
//  NSMutableArray+WXQueue.m
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

#import "NSMutableArray+WXQueue.h"
#import "NSObject+AssociatedObject.h"

@implementation NSMutableArray (WXQueue)

BOOL queueSizeFlag = NO;

- (void)enqueueObject:(id)anObject {
    [self addObject:anObject];
    if (queueSizeFlag && self.count > self.queueSize) {
        [self removeObjectAtIndex:0];
    }
}

- (id)dequeueObject {
    id anObject = [self firstObject];
    if (self.count > 0) {
        [self removeObjectAtIndex:0];
    }
    return anObject;
}

#pragma mark - propertes

- (NSInteger)queueSize {
    return [[self object:@selector(setQueueSize:)] integerValue];
}

- (void)setQueueSize:(NSInteger)queueSize {
    [self setRetainNonatomicObject:@(queueSize) withKey:@selector(setQueueSize:)];
    if (queueSize > 0) {
        queueSizeFlag = YES;
    } else {
        queueSizeFlag = NO;
    }
}
@end
