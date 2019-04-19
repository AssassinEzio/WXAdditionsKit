//
//  UIView+WXBadge.h
//  WXAdditionsKit
//
//  Created by youtu on 2019/4/18.
//  Copyright © 2019 youtu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WXBadge)

/**
 *  @brief 是否显示badge
 */
@property (nonatomic, assign) BOOL shouldShowBadge;

/**
 *  @brief badge内容，为空则显示小红点
 */
@property (nonatomic, copy) NSString *badgeString;

@property (nonatomic, strong) UILabel *badgeLabel;


/**
 *  @brief 配置badge，参数UIView didMoveToSuperview
 */
@property (nonatomic, copy, nullable) void (^badgeConfigBlock)(UIView *);

@end


NS_ASSUME_NONNULL_END
