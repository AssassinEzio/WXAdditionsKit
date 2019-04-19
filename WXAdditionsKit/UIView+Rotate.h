//
//  UIView+Rotate.h
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Rotate)

- (void)startRotatingWithDuration:(NSTimeInterval)time;
- (void)stopRotating;
- (void)rotateWithAngle:(CGFloat)angle duration:(NSTimeInterval)time completion:(void(^)(void))completion;
@end

NS_ASSUME_NONNULL_END
