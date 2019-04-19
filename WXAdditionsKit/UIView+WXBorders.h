//
//  UIView+WXBorders.h
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, WXUIViewBorderType) {
    WXUIViewBorderTypeSolid,
    WXUIViewBorderTypeDashed,
    WXUIViewBorderTypeDoted
};

typedef NS_OPTIONS(NSUInteger, WXUIViewBorderPosition) {
    WXUIViewBorderPositionNone = 0,
    WXUIViewBorderPositionTop = 1 << 0,
    WXUIViewBorderPositionRight = 1 << 1,
    WXUIViewBorderPositionBottom = 1 << 2,
    WXUIViewBorderPositionLeft = 1 << 3,
};

/**
 *  @brief  灵活设置UIView的border
 */
@interface UIView (WXBorders)

- (CAShapeLayer *)borderLayer;

/**
 *  @brief  设置UIView的border,绘制所有border
 *
 *  @param borderWidth borderWidth
 *  @param borderColor borderColor
 */
- (void)setBorder:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  @brief  设置UIView的border，根据borderPosition设置对应的border
 *
 *  @param borderWidth    borderWidth
 *  @param borderColor    borderColor
 *  @param borderPosition borderPosition
 */
- (void)setBorder:(CGFloat)borderWidth
      borderColor:(UIColor *)borderColor
   borderPosition:(WXUIViewBorderPosition)borderPosition;

/**
 *  @brief  设置UIView的border,根据borderType绘制所有border
 *
 *  @param borderWidth borderWidth
 *  @param borderColor borderColor
 *  @param borderType  borderType
 */
- (void)setBorder:(CGFloat)borderWidth borderColor:(UIColor *)borderColor borderType:(WXUIViewBorderType)borderType;

/**
 *  @brief  设置UIView的border,根据borderType和borderPosition绘制border
 *
 *  @param borderWidth    borderWidth
 *  @param borderColor    borderColor
 *  @param borderPosition borderPosition
 *  @param borderType     borderType
 */
- (void)setBorder:(CGFloat)borderWidth
      borderColor:(UIColor *)borderColor
   borderPosition:(WXUIViewBorderPosition)borderPosition
       borderType:(WXUIViewBorderType)borderType;

- (void)setLineDashPattern:(NSArray<NSNumber *> *)lineDashPattern;
@end

NS_ASSUME_NONNULL_END
