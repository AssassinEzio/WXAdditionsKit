//
//  UIView+WXBorders.m
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

@import CoreGraphics;

#import "NSObject+AssociatedObject.h"
#import "NSObject+WXSwizzling.h"
#import "UIView+WXBorders.h"

@interface UIView ()

@property (nonatomic, strong) UIColor *borderColor;
@property (assign) CGFloat borderWidth;
@property (assign) WXUIViewBorderPosition borderPosition;
@property (assign) WXUIViewBorderType borderType;
@property (nonatomic, copy) NSArray <NSNumber *> *lineDashPattern;

@property (nonatomic, strong) CAShapeLayer *borderLayer;

@end

@implementation UIView (WXBorders)

#pragma mark - life cycle


#pragma mark - public methods

- (void)setBorder:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    [self setBorder:borderWidth borderColor:borderColor borderType:WXUIViewBorderTypeSolid];
}

- (void)setBorder:(CGFloat)borderWidth borderColor:(UIColor *)borderColor borderType:(WXUIViewBorderType)borderType {
    [self setBorder:borderWidth
        borderColor:borderColor
     borderPosition:WXUIViewBorderPositionTop | WXUIViewBorderPositionRight | WXUIViewBorderPositionBottom |
     WXUIViewBorderPositionLeft
         borderType:borderType];
}

- (void)setBorder:(CGFloat)borderWidth
      borderColor:(UIColor *)borderColor
   borderPosition:(WXUIViewBorderPosition)borderPosition {
    [self setBorder:borderWidth
        borderColor:borderColor
     borderPosition:borderPosition
         borderType:WXUIViewBorderTypeSolid];
}

- (void)setBorder:(CGFloat)borderWidth
      borderColor:(UIColor *)borderColor
   borderPosition:(WXUIViewBorderPosition)borderPosition
       borderType:(WXUIViewBorderType)borderType {
    self.borderWidth = borderWidth;
    self.borderColor = borderColor;
    self.borderPosition = borderPosition;
    self.borderType = borderType;
    self.clipsToBounds = YES;
    [self drawBorders];
}

#pragma mark - private methods

- (void)_drawRect:(CGRect)rect {
    [self _drawRect:rect];
    [self drawBorders];
}

- (void)drawBorders {
    if (self.borderWidth == 0 || CGColorEqualToColor(self.borderColor.CGColor, [UIColor clearColor].CGColor) ||
        self.borderPosition == WXUIViewBorderPositionNone) {
        return;
    }
    if (self.borderLayer) {
        [self.borderLayer removeFromSuperlayer];
    }
    
    self.borderLayer = [CAShapeLayer layer];
    self.borderLayer.lineWidth = self.borderWidth;
    self.borderLayer.strokeColor = self.borderColor.CGColor;
    if (self.borderType == WXUIViewBorderTypeDashed) {
        [self.borderLayer setLineCap:kCALineCapSquare];
        [self.borderLayer setLineDashPattern:self.lineDashPattern?:@[@(2 * self.borderWidth), @(4 * self.borderWidth)]];
        [self.borderLayer setLineDashPhase:0.0f];
    } else if (self.borderType == WXUIViewBorderTypeDoted) {
        [self.borderLayer setLineCap:kCALineCapRound];
        [self.borderLayer setLineDashPattern:self.lineDashPattern?:@[@(self.borderWidth / 4), @(2 * self.borderWidth)]];
        [self.borderLayer setLineDashPhase:0.0f];
    }
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGFloat minX = CGRectGetMinX(self.bounds);
    CGFloat maxX = CGRectGetMaxX(self.bounds);
    
    CGFloat minY = CGRectGetMinY(self.bounds);
    CGFloat maxY = CGRectGetMaxY(self.bounds);
    
    if (self.borderPosition & WXUIViewBorderPositionTop) {
        CGPathMoveToPoint(path, NULL, minX, minY + self.borderWidth / 2);
        CGPathAddLineToPoint(path, NULL, maxX, minY + self.borderWidth / 2);
    }
    if (self.borderPosition & WXUIViewBorderPositionRight) {
        CGPathMoveToPoint(path, NULL, maxX - self.borderWidth / 2, minY);
        CGPathAddLineToPoint(path, NULL, maxX - self.borderWidth / 2, maxY);
    }
    if (self.borderPosition & WXUIViewBorderPositionBottom) {
        CGPathMoveToPoint(path, NULL, minX, maxY - self.borderWidth / 2);
        CGPathAddLineToPoint(path, NULL, maxX, maxY - self.borderWidth / 2);
    }
    if (self.borderPosition & WXUIViewBorderPositionLeft) {
        CGPathMoveToPoint(path, NULL, minX + self.borderWidth / 2, minY);
        CGPathAddLineToPoint(path, NULL, minX + self.borderWidth / 2, maxY);
    }
    [self.borderLayer setPath:path];
    CGPathRelease(path);
    [self.layer addSublayer:self.borderLayer];
}

#pragma mark - properties

- (CGFloat)borderWidth {
    return [[self object:@selector(setBorderWidth:)] floatValue];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    [self setRetainNonatomicObject:@(borderWidth) withKey:@selector(setBorderWidth:)];
}

- (UIColor *)borderColor {
    return [self object:@selector(setBorderColor:)];
}

- (void)setBorderColor:(UIColor *)borderColor {
    [self setRetainNonatomicObject:borderColor withKey:@selector(setBorderColor:)];
}

- (WXUIViewBorderPosition)borderPosition {
    return [[self object:@selector(setBorderPosition:)] integerValue];
}

- (void)setBorderPosition:(WXUIViewBorderPosition)borderPosition {
    [self setRetainNonatomicObject:@(borderPosition) withKey:@selector(setBorderPosition:)];
}

- (WXUIViewBorderType)borderType {
    return [[self object:@selector(setBorderType:)] integerValue];
}

- (void)setBorderType:(WXUIViewBorderType)borderType {
    [self setRetainNonatomicObject:@(borderType) withKey:@selector(setBorderType:)];
}

- (CAShapeLayer *)borderLayer {
    return [self object:@selector(setBorderLayer:)];
}

- (void)setBorderLayer:(CAShapeLayer *)borderLayer {
    [self setRetainNonatomicObject:borderLayer withKey:@selector(setBorderLayer:)];
}

- (void)setLineDashPattern:(NSArray<NSNumber *> *)lineDashPattern {
    [self setCopyNonatomicObject:lineDashPattern withKey:@selector(setLineDashPattern:)];
}

- (NSArray<NSNumber *> *)lineDashPattern {
    return [self object:@selector(setLineDashPattern:)];
}


@end
