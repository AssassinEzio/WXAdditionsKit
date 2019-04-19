//
//  UIView+RedDot.h
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (RedDot)

- (void)addRedDotWithRadius:(CGFloat)radius offsetX:(CGFloat)offsetX offsetY:(CGFloat)offsetY;

- (void)showRedDotWithRadius:(CGFloat)radius offsetX:(CGFloat)offsetX offsetY:(CGFloat)offsetY;

- (void)shownRedDot;

- (void)hiddenRedDot;
@end

NS_ASSUME_NONNULL_END
