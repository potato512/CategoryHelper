//
//  UIView+SYCoinAnimation.m
//  DemoCategory
//
//  Created by zhangshaoyu on 2019/9/26.
//  Copyright © 2019 zhangshaoyu. All rights reserved.
//

#import "UIView+SYCoinAnimation.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

@interface UIView () {
    bool displayingPrimary;
}

@end

@implementation UIView (SYCoinAnimation)

- (void)reloadCornView:(CGRect)frame view:(UIView *)superview duration:(NSTimeInterval)durationTime primaryView:(UIView *)primaryView secondaryView:(UIView *)secondaryView
{
    self.frame = frame;
    if (superview) {
        [superview addSubview:self];
    }

    // Initialization code
    self.primaryView = primaryView;
    self.secondaryView = secondaryView;
    if (self.primaryView) {
        self.primaryView.frame = self.bounds;
        [self addSubview:self.primaryView];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipTouched:)];
        tapGesture.numberOfTapsRequired = 1;
        [self.primaryView addGestureRecognizer:tapGesture];
    }
    if (self.secondaryView) {
        self.secondaryView.frame = self.bounds;
        [self addSubview:self.secondaryView];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipTouched:)];
        tapGesture.numberOfTapsRequired = 1;
        [self.secondaryView addGestureRecognizer:tapGesture];
    }

    displayingPrimary = YES;
    self.durationTime = durationTime;
}

- (void)reloadCornView
{
    if (self.durationTime <= 0.0) {
        self.durationTime = 1.0;
    }
    if (self.superview == nil) {
        NSLog(@"coinAnimation view没有父视图");
    }
    if (self.primaryView) {
        self.primaryView.frame = self.bounds;
        [self addSubview:self.primaryView];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipTouched:)];
        tapGesture.numberOfTapsRequired = 1;
        [self.primaryView addGestureRecognizer:tapGesture];
    }
    if (self.secondaryView) {
        self.secondaryView.frame = self.bounds;
        [self addSubview:self.secondaryView];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipTouched:)];
        tapGesture.numberOfTapsRequired = 1;
        [self.secondaryView addGestureRecognizer:tapGesture];
    }
}

#pragma mark - set方法

- (void)setPrimaryView:(UIView *)primaryView
{
    objc_setAssociatedObject(self, @selector(primaryView), primaryView, OBJC_ASSOCIATION_RETAIN);
    
//    if (primaryView) {
//        CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//        primaryView.frame = frame;
//        [self roundView:primaryView];
//        primaryView.userInteractionEnabled = YES;
//        [self addSubview:primaryView];
//
//        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipTouched:)];
//        tapGesture.numberOfTapsRequired = 1;
//        [primaryView addGestureRecognizer:tapGesture];
//        //
//        objc_setAssociatedObject(self, @selector(primaryView), primaryView, OBJC_ASSOCIATION_RETAIN);
//    }
}

- (UIView *)primaryView
{
    return objc_getAssociatedObject(self, @selector(primaryView));
}

- (void)setSecondaryView:(UIView *)secondaryView
{
    objc_setAssociatedObject(self, @selector(secondaryView), secondaryView, OBJC_ASSOCIATION_RETAIN);
    
//    if (secondaryView) {
//        CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//        secondaryView.frame = frame;
//        [self roundView:secondaryView];
//        secondaryView.userInteractionEnabled = YES;
//        [self addSubview:secondaryView];
//        [self sendSubviewToBack:secondaryView];
//
//        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipTouched:)];
//        tapGesture.numberOfTapsRequired = 1;
//        [secondaryView addGestureRecognizer:tapGesture];
//
//        objc_setAssociatedObject(self, @selector(secondaryView), secondaryView, OBJC_ASSOCIATION_RETAIN);
//    }
}

- (UIView *)secondaryView
{
    return objc_getAssociatedObject(self, @selector(secondaryView));
}

- (void)setDurationTime:(NSTimeInterval)durationTime
{
    objc_setAssociatedObject(self, @selector(durationTime), @(durationTime), OBJC_ASSOCIATION_ASSIGN);
}

- (NSTimeInterval)durationTime
{
    NSNumber *number = objc_getAssociatedObject(self, @selector(durationTime));
    return number.floatValue;
}

#pragma mark - 视图属性设置

- (void)roundView:(UIView *)view
{
    view.layer.cornerRadius = (self.frame.size.height / 2);
    view.layer.masksToBounds = YES;
}

#pragma mark - 响应方法

- (void)flipTouched:(UITapGestureRecognizer *)sender
{
    UIView *fromView = (displayingPrimary ? self.primaryView : self.secondaryView);
    UIView *toView = (displayingPrimary ? self.secondaryView : self.primaryView);
    UIViewAnimationOptions options = (displayingPrimary ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight) + UIViewAnimationOptionCurveEaseInOut;
    //
    [UIView transitionFromView:fromView toView:toView duration:self.durationTime options:options completion:^(BOOL finished) {
                        if (finished) {
                            displayingPrimary = !displayingPrimary;
                        }
                    }
     ];
}


@end
