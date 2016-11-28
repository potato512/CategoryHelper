//
//  UIViewController+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+SYCategory.h"

@interface UIViewController (SYCategory)

/// 是否是根视图
- (BOOL)isRootController;

/// 返回上层视图响应
- (void)backPreviousController;

/// 设置导航栏标题视图
- (void)setNavigationTitleView:(UIView *)titleView;
/// 设置导航栏标题
- (void)setNavigationTitle:(NSString *)title;
/// 导航栏标题
@property (nonatomic, strong) NSString *navigationItemTitle;

#pragma mark - 导航栏按钮

#pragma mark 导航栏左按钮

/**
 *  UIBarButtonItem导航栏左按钮（默认图标与标题）
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)leftBarButtonDefault;

/**
 *  UIBarButtonItem
 *
 *  @param isRootControllerName 按钮标题：显示根视图控制器名称，或返回
 *  @param target               响应对象
 *  @param action               响应方法
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)leftBarButtonWithRootControllerName:(BOOL)isRootControllerName
                                                  target:(id)target
                                                  action:(SEL)action;

/**
 *  UIBarButtonItem自定义标题、图标
 *
 *  @param title       按钮标题
 *  @param imageNormal 按钮图标
 *  @param target      响应对象
 *  @param action      响应方法
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)leftBarButtonWithTitle:(NSString *)title
                                      image:(UIImage *)imageNormal
                                     target:(id)target
                                     action:(SEL)action;

/**
 *  UIBarButtonItem导航栏左按钮（自定义标题及其高亮颜色，图标）
 *
 *  @param title          按钮标题
 *  @param colorHighlight 按钮标题高亮颜色
 *  @param imageNormal    按钮图标
 *  @param target         响应对象
 *  @param action         响应方法
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)leftBarButtonWithTitle:(NSString *)title
                             colorHighlight:(UIColor *)colorHighlight
                                      image:(UIImage *)imageNormal
                                     target:(id)target
                                     action:(SEL)action;

#pragma mark 导航栏右按钮

/**
 *  UIBarButtonItem导航栏右按钮（自定义标题-常规/选中，及背景图标）
 *
 *  @param title          按钮标题-常规
 *  @param titleSel       按钮标题-选中
 *  @param imageNormal    按钮背景图标-常规
 *  @param imageHighlight 按钮背景图标-高亮
 *  @param imageSel       按钮背景图标-选中
 *  @param target         响应对象
 *  @param action         响应方法
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)rightBarButtonWithTitle:(NSString *)title
                                    titleSel:(NSString *)titleSel
                                brgoundImage:(UIImage *)imageNormal
                       bgroundImageHighlight:(UIImage *)imageHighlight
                             bgroundImageSel:(UIImage *)imageSel
                                      target:(id)target
                                      action:(SEL)action;

/**
 *  UIBarButtonItem导航栏右按钮（自定义标题及其高亮颜色，图标）
 *
 *  @param title          按钮标题
 *  @param image          按钮图片
 *  @param colorHighlight 按钮标题高亮颜色
 *  @param target         响应对象
 *  @param action         响应方法
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)rightBarButtonWithTitle:(NSString *)title
                                       image:(UIImage *)image
                                   highlight:(UIColor *)colorHighlight
                                      target:(id)target
                                      action:(SEL)action;

/**
 *  UIBarButtonItem导航栏右按钮（自定义标题和图标）
 *
 *  @param title     按钮标题
 *  @param image     按钮图标
 *  @param target    响应对象
 *  @param action    响应方法
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)rightBarButtonWithTitle:(NSString *)title
                                       image:(UIImage *)image
                                      target:(id)target
                                      action:(SEL)action;

/**
 *  UIBarButtonItem导航栏右按钮（自定义多属性）
 *
 *  @param title            按钮标题-常规状态
 *  @param titleSel         按钮标题-选中状态
 *  @param colorNormal      按钮标题颜色-常规状态
 *  @param colorSel         按钮标题颜色-选中状态
 *  @param colorHighlight   按钮标题颜色-高亮状态
 *  @param colorNormal      按钮图标-常规状态
 *  @param colorSel         按钮图标-选中状态
 *  @param bgImageNormal    按钮背景图标-常规状态
 *  @param bgImageHighlight 按钮背景图标-高亮状态
 *  @param bgImageSel       按钮背景图标-选中状态
 *  @param style            按钮类型-图标与标题对齐方式
 *  @param target           响应对象
 *  @param action           响应方法
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)rightBarButtonWithTitle:(NSString *)title
                                    titleSel:(NSString *)titleSel
                                       color:(UIColor *)colorNormal
                                    colorSel:(UIColor *)colorSel
                              colorHighlight:(UIColor *)colorHighlight
                                       image:(UIImage *)imageNormal
                                    imageSel:(UIImage *)imageSel
                                bgroundImage:(UIImage *)bgImageNormal
                       bgroundImageHighlight:(UIImage *)bgImageHighlight
                             bgroundImageSel:(UIImage *)bgImageSel
                                       style:(SYButtonStyle)style
                                      target:(id)target
                                      action:(SEL)action;

@end
