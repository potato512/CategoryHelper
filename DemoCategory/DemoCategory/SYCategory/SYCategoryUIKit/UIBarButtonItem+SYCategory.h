//
//  UIBarButtonItem+SYCategory.h
//  DemoCategory
//
//  Created by zhangshaoyu on 17/3/21.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SYCategory)

/**
 *  实例化UIBarButtonItem
 *
 *  @param title  标题
 *  @param action 回调方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)buttonItemWithTitle:(NSString *)title action:(void (^)(UIButton *item))action;

/**
 *  实例化UIBarButtonItem
 *
 *  @param image  图标
 *  @param action 回调方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)buttonItemWithImage:(UIImage *)image action:(void (^)(UIButton *item))action;

/**
 *  实例化UIBarButtonItem
 *
 *  @param title      标题
 *  @param titleH     高亮标题
 *  @param color      标题颜色
 *  @param colorH     高亮时标题颜色
 *  @param image      图标
 *  @param imageH     高亮时图标
 *  @param backImage  背景图片
 *  @param backImageH 高亮时背景图片
 *  @param action     回调方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)buttonItemWithTitle:(NSString *)title titleHlight:(NSString *)titleH titleColor:(UIColor *)color titleColorHlight:(UIColor *)colorH image:(UIImage *)image imageHlight:(UIImage *)imageH backImage:(UIImage *)backImage backImageHlight:(UIImage *)backImageH action:(void (^)(id item))action;


@end
