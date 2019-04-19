//
//  NSObject+WXSwizzling.m
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

#import "NSObject+WXSwizzling.h"
#import <objc/runtime.h>


typedef IMP _Nullable  * IMPPointer;

/**
 *  @author Tyne
 *
 *  @brief  调配类方法和实例方法
 */
@implementation NSObject (WXSwizzling)

/**
 *  @brief  交换实例方法的实现
 *
 *  @param cls         类
 *  @param oldSelector
 *  @param newSelector
 */
+ (void)instanceSwizzle:(Class)cls oldSelector:(SEL)oldSelector newSelector:(SEL)newSelector {
    Method oldMethod = class_getInstanceMethod(cls, oldSelector);
    Method newMethod = class_getInstanceMethod(cls, newSelector);
    
    if (class_addMethod(cls, oldSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
        class_replaceMethod(cls, newSelector, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
    } else {
        method_exchangeImplementations(oldMethod, newMethod);
    }
}

/**
 *  @brief  交换类方法的实现
 *
 *  @param cls         类
 *  @param oldSelector
 *  @param newSelector
 */
+ (void)classSwizzle:(Class)cls oldSelector:(SEL)oldSelector newSelector:(SEL)newSelector {
    cls = object_getClass(cls);
    [NSObject instanceSwizzle:cls oldSelector:oldSelector newSelector:newSelector];
}

- (void)instanceSwizzle:(SEL)oldSelector newSelector:(SEL)newSElector {
    [NSObject instanceSwizzle:[self class] oldSelector:oldSelector newSelector:newSElector];
}

- (void)classSwizzle:(SEL)oldSelector newSelector:(SEL)newSelector {
    [NSObject classSwizzle:[self class] oldSelector:oldSelector newSelector:newSelector];
}
@end
