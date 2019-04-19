//
//  NSObject+AssociatedObject.m
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

#import "NSObject+AssociatedObject.h"
#import <objc/runtime.h>


@implementation NSObject (AssociatedObject)

- (id)object:(SEL)key {
    return objc_getAssociatedObject(self, key);
}

- (void)setRetainNonatomicObject:(id)object withKey:(SEL)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setCopyNonatomicObject:(id)object withKey:(SEL)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setRetainObject:(id)object withKey:(SEL)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN);
}

- (void)setCopyObject:(id)object withKey:(SEL)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_COPY);
}
@end
