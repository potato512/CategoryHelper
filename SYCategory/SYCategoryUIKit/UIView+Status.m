//
//  UIView+Status.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2017/11/20.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "UIView+Status.h"
#import <objc/runtime.h>

@interface UIView ()

@property (nonatomic, strong) UIActivityIndicatorView *handleActivityView;
@property (nonatomic, strong) UIImageView *handleImageView;
@property (nonatomic, strong) UILabel *handleLabel;
@property (nonatomic, strong) UIButton *handleButton;
@property (nonatomic, copy) void (^handleClick)(void);

@end

@implementation UIView (Status)

/// 添加状态视图方法及回调 UIActivityIndicatorView
- (void)addStatusActivityViewWithConfigurationHandler:(void (^)(UIActivityIndicatorView *activityView))configurationHandler
{
    if (configurationHandler) {
        if (self.handleActivityView == nil) {
            self.handleActivityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            self.handleActivityView.backgroundColor = [UIColor clearColor];
            self.handleActivityView.hidesWhenStopped = YES;
            [self addSubview:self.handleActivityView];
        }
        self.handleActivityView.hidden = NO;
        
        configurationHandler(self.handleActivityView);
    }
}

/// 添加状态视图方法及回调 UIImageView UILabel UIButton
- (void)addStatusViewWithConfigurationHandler:(void (^)(UIImageView *imageView, UILabel *label, UIButton *button))configurationHandler click:(void (^)(void))clickHandle
{
    if (configurationHandler) {
        if (self.handleActivityView.animating) {
            [self.handleActivityView stopAnimating];
        }
        if (self.handleImageView == nil) {
            self.handleImageView = [[UIImageView alloc] init];
            [self addSubview:self.handleImageView];
        }
        if (self.handleLabel == nil) {
            self.handleLabel = [[UILabel alloc] init];
            [self addSubview:self.handleLabel];
        }
        if (self.handleButton == nil) {
            self.handleButton = [[UIButton alloc] init];
            [self addSubview:self.handleButton];
        }
        self.handleImageView.hidden = NO;
        self.handleLabel.hidden = NO;
        self.handleButton.hidden = NO;
        
        configurationHandler(self.handleImageView, self.handleLabel, self.handleButton);
    }
    
    if (clickHandle) {
        [self.handleButton addTarget:self action:@selector(handleButtonClick) forControlEvents:UIControlEventTouchUpInside];
        self.handleClick = [clickHandle copy];
    }
}

/// 移动状态视图
- (void)removeStatusView
{
    if (self.handleActivityView) {
        self.handleActivityView.hidden = YES;
    }
    if (self.handleImageView) {
        self.handleImageView.hidden = YES;
    }
    if (self.handleLabel) {
        self.handleLabel.hidden = YES;
    }
    if (self.handleButton) {
        self.handleButton.hidden = YES;
    }
}


- (void)handleButtonClick
{
    if (self.handleClick) {
        self.handleClick();
    }
}

- (UIActivityIndicatorView *)handleActivityView
{
    return objc_getAssociatedObject(self, @selector(handleActivityView));
}
- (void)setHandleActivityView:(UIActivityIndicatorView *)handleActivityView
{
    objc_setAssociatedObject(self, @selector(handleActivityView), handleActivityView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIImageView *)handleImageView
{
    return objc_getAssociatedObject(self, @selector(handleImageView));
}
- (void)setHandleImageView:(UIImageView *)handleImageView
{
    objc_setAssociatedObject(self, @selector(handleImageView), handleImageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UILabel *)handleLabel
{
    return objc_getAssociatedObject(self, @selector(handleLabel));
}
- (void)setHandleLabel:(UILabel *)handleLabel
{
    objc_setAssociatedObject(self, @selector(handleLabel), handleLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIButton *)handleButton
{
    return objc_getAssociatedObject(self, @selector(handleButton));
}
- (void)setHandleButton:(UIButton *)handleButton
{
    objc_setAssociatedObject(self, @selector(handleButton), handleButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void (^)(void))handleClick
{
    return objc_getAssociatedObject(self, @selector(handleClick));
}
- (void)setHandleClick:(void (^)(void))handleClick
{
    objc_setAssociatedObject(self, @selector(handleClick), handleClick, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
