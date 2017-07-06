//
//  UISwitch+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/12/2.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SwitchClick)(UISwitch *sender);

@interface UISwitch (SYCategory)

/// 回调方法
@property (nonatomic, copy) SwitchClick switchClick;

/**
 *  实例化UISwitch
 *
 *  @param frame       坐标大小
 *  @param superview   父视图
 *  @param isOff       状态开关
 *  @param switchClick 响应回调
 *
 *  @return UISwitch
 */
+ (instancetype)switchWithFrame:(CGRect)frame view:(UIView *)superview status:(BOOL)isOff action:(SwitchClick)switchClick;


#pragma mark - 链式属性

- (UISwitch *(^)(UIColor *color))onTintColor;

- (UISwitch *(^)(UIColor *color))tintColor;

- (UISwitch *(^)(UIColor *color))thumbTintColor;

- (UISwitch *(^)(UIImage *image))onImage;

- (UISwitch *(^)(UIImage *image))offImage;

- (UISwitch *(^)(BOOL isEnable))on;

@end
