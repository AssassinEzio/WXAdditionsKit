//
//  NSObject+AssociatedObject.h
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  @author Tyne
 *
 *  @brief  动态添加属性到对象
 */
@interface NSObject (AssociatedObject)

- (id)object:(SEL)key;

- (void)setRetainNonatomicObject:(id)object withKey:(SEL)key;

- (void)setCopyNonatomicObject:(id)object withKey:(SEL)key;

- (void)setRetainObject:(id)object withKey:(SEL)key;

- (void)setCopyObject:(id)object withKey:(SEL)key;

@end

NS_ASSUME_NONNULL_END
