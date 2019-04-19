//
//  UIView+Rotate.m
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

#define ANIMATION_KEY @"WX_ANIMATION_KEY"

#import "UIView+Rotate.h"

@implementation UIView (Rotate)

- (void)startRotatingWithDuration:(NSTimeInterval)time {
    [self.layer removeAnimationForKey:ANIMATION_KEY];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:self.layer.transform];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, 3.14, 0, 0, 1.0)];
    animation.duration = time;
    animation.repeatDuration = CGFLOAT_MAX;
    [self.layer addAnimation:animation forKey:ANIMATION_KEY];
}

- (void)rotateWithAngle:(CGFloat)angle duration:(NSTimeInterval)time completion:(void(^)(void))completion {
    [UIView animateWithDuration:time animations:^{
        self.transform = CGAffineTransformMakeRotation(angle*M_PI/180);
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

- (void)stopRotating {
    [self.layer removeAnimationForKey:ANIMATION_KEY];
}
@end
