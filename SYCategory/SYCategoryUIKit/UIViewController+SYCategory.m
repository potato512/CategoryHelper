//
//  UIViewController+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UIViewController+SYCategory.h"
#import <objc/runtime.h>

@interface UIViewController ()

@end

@implementation UIViewController (SYCategory)

#pragma mark - setter/getter

- (void)setButtonActionClick:(void (^)(UIBarButtonItem *))buttonActionClick
{
    objc_setAssociatedObject(self, @selector(buttonActionClick), buttonActionClick, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UIBarButtonItem *))buttonActionClick
{
    return objc_getAssociatedObject(self, @selector(buttonActionClick));
}

- (void)setHiddenKeyboard:(BOOL)hiddenKeyboard
{
    objc_setAssociatedObject(self, @selector(hiddenKeyboard), @(hiddenKeyboard), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)hiddenKeyboard
{
    NSNumber *number = objc_getAssociatedObject(self, @selector(hiddenKeyboard));
    return number.boolValue;
}

#pragma mark - 响应手势

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.hiddenKeyboard) {
        [self.view endEditing:YES];
    }
}

#pragma mark --

/// 是否是根视图
- (BOOL)isRootController
{
    if (self.navigationController.viewControllers.count == 1) {
        return YES;
    }
    
    return NO;
}

#pragma mark - 导航栏设置

#pragma mark 返回上层视图响应

/// 返回上层视图响应
- (void)backPreviousController
{
    if (self.isRootController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        if (self.presentedViewController) {
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

#pragma mark setter/getter

- (void)setNavigationItemTitleView:(UIView *)navigationItemTitleView
{
    objc_setAssociatedObject(self, @selector(navigationItemTitleView), navigationItemTitleView, OBJC_ASSOCIATION_RETAIN);
    self.navigationItem.titleView = navigationItemTitleView;
}
- (UIView *)navigationItemTitleView
{
    return objc_getAssociatedObject(self, @selector(navigationItemTitleView));
}

- (void)setNavigationItemTitle:(NSString *)navigationItemTitle
{
    objc_setAssociatedObject(self, @selector(navigationItemTitle), navigationItemTitle, OBJC_ASSOCIATION_RETAIN);
    self.navigationItem.title = navigationItemTitle;
}
- (NSString *)navigationItemTitle
{
    return objc_getAssociatedObject(self, @selector(navigationItemTitle));
}

#pragma mark - 链式属性

/// 链式编程 适配（视图显示在导航栏之下）
- (UIViewController *(^)(void))autoLayoutExtended
{
    return ^(void) {
        if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
            // 不要往四周边沿展开，避免被导航栏遮挡
            self.edgesForExtendedLayout = UIRectEdgeNone;
        
            // 取消半透明色，避免被导航栏遮挡
            self.navigationController.navigationBar.translucent = NO;
            
            // 展开时不包含导航栏，避免被导航栏遮挡
            self.extendedLayoutIncludesOpaqueBars = NO;
            
            // 改变scrollView的contentInsets，避免scrollView，tableView，collectionView的contentInset.top = 64
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        return self;
    };
}

@end
