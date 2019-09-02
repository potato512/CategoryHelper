//
//  UILabel+SYClick.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2019/9/2.
//  Copyright © 2019 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UILabelClickDelegate <NSObject>

@optional
/**
 *  UILabelClickDelegate
 *
 *  @param string  点击的字符串
 *  @param range   点击的字符串range
 *  @param index   点击的字符在数组中的index
 */
- (void)labelClick:(UILabel *)label string:(NSString *)string range:(NSRange)range index:(NSInteger)index;

@end



@interface UILabel (SYClick)

/// 是否打开点击效果，默认是打开
@property (nonatomic, assign) BOOL enabledEffect;
/// 点击字体背景高亮色 默认是[UIColor lightGrayColor] 需打开enabledEffect才有效
@property (nonatomic, strong) UIColor *highlightedColor;
/// 是否扩大点击范围，默认是打开
@property (nonatomic, assign) BOOL enlargeClickArea;
/// 点击字体高亮
@property (nonatomic, strong) UIColor *highlightTextColor;

/**
 *  给文本添加点击事件Block回调
 *
 *  @param strings  需要添加的字符串数组
 *  @param tapClick 点击事件回调
 */
- (void)labelClickAddWithStrings:(NSArray <NSString *> *)strings clicked:(void (^)(UILabel *label, NSString *string, NSRange range, NSInteger index))click;

/**
 *  给文本添加点击事件delegate回调
 *
 *  @param strings  需要添加的字符串数组
 *  @param delegate delegate
 */
- (void)labelClickAddWithStrings:(NSArray <NSString *> *)strings delegate:(id<UILabelClickDelegate>)delegate;

/**
 *  根据range给文本添加点击事件Block回调
 *
 *  @param ranges  需要添加的Range字符串数组
 *  @param tapClick 点击事件回调
 */
- (void)labelClickAddWithRanges:(NSArray <NSString *> *)ranges click:(void (^)(UILabel *label, NSString *string, NSRange range, NSInteger index))click;

/**
 *  根据range给文本添加点击事件delegate回调
 *
 *  @param ranges  需要添加的Range字符串数组
 *  @param delegate delegate
 */
- (void)labelClickAddWithRanges:(NSArray <NSString *> *)ranges delegate:(id<UILabelClickDelegate>)delegate;

/**
 *  删除label上的点击事件
 */
- (void)labelClickRemove;

@end

NS_ASSUME_NONNULL_END
