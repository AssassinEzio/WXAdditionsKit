//
//  NSMutableArray+WXQueue.h
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (WXQueue)

/**
 *  @brief 队列的容量，大于0为有效容量，小于等于0表示不限制容量
 */
@property (nonatomic, assign) NSInteger queueSize;

- (void)enqueueObject:(id)anObject;

- (nullable id)dequeueObject;
@end

NS_ASSUME_NONNULL_END
