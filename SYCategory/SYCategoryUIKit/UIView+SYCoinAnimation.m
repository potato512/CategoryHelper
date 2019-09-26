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

//- (void)initializeCornView:(CGRect)frame view:(UIView *)superview primaryView:(UIView *)primaryView secondaryView:(UIView *)secondaryView
//{
//    self.frame = frame;
//    if (superview) {
//        [superview addSubview:self];
//    }
//
//    // Initialization code
//    self.primaryView = primaryView;
//    self.secondaryView = secondaryView;
//
//    displayingPrimary = YES;
//    self.spinTime = 1.0;
//}
//
//#pragma mark - set方法
//
//- (void)setPrimaryView:(UIView *)primaryView
//{
//    if (primaryView) {
//        CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//        primaryView.frame = frame;
//        [self roundView:primaryView];
//        primaryView.userInteractionEnabled = YES;
//        [self addSubview:primaryView];
//
//        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipTouched:)];
//        gesture.numberOfTapsRequired = 1;
//        [primaryView addGestureRecognizer:gesture];
//        [self roundView:self];
//        //
//        objc_setAssociatedObject(self, @selector(primaryView), primaryView, OBJC_ASSOCIATION_RETAIN);
//    }
//}
//
//- (UIView *)primaryView
//{
//    return objc_getAssociatedObject(self, @selector(primaryView));
//}
//
//- (void)setSecondaryView:(UIView *)secondaryView
//{
//    if (secondaryView) {
//        CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//        secondaryView.frame = frame;
//        [self roundView:secondaryView];
//        secondaryView.userInteractionEnabled = YES;
//        [self addSubview:secondaryView];
//        [self sendSubviewToBack:secondaryView];
//
//        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipTouched:)];
//        gesture.numberOfTapsRequired = 1;
//        [secondaryView addGestureRecognizer:gesture];
//        [self roundView:self];
//
//        objc_setAssociatedObject(self, @selector(secondaryView), secondaryView, OBJC_ASSOCIATION_RETAIN);
//    }
//}
//
//- (UIView *)secondaryView
//{
//    return objc_getAssociatedObject(self, @selector(secondaryView));
//}
//
//- (void)setSpinTime:(float)spinTime
//{
//    objc_setAssociatedObject(self, @selector(spinTime), @(spinTime), OBJC_ASSOCIATION_ASSIGN);
//}
//
//- (float)spinTime
//{
//    NSNumber *number = objc_getAssociatedObject(self, @selector(spinTime));
//    return number.floatValue;
//}
//
//#pragma mark - 视图属性设置
//
//- (void)roundView:(UIView *)view
//{
//    view.layer.cornerRadius = (self.frame.size.height / 2);
//    view.layer.masksToBounds = YES;
//}
//
//#pragma mark - 响应方法
//
//- (void)flipTouched:(UITapGestureRecognizer *)sender
//{
//    UIView *fromView = (displayingPrimary ? self.primaryView : self.secondaryView);
//    UIView *toView = (displayingPrimary ? self.secondaryView : self.primaryView);
//    UIViewAnimationOptions options = (displayingPrimary ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight) + UIViewAnimationOptionCurveEaseInOut;
//    //
//    [UIView transitionFromView:fromView toView:toView duration:self.spinTime options:options completion:^(BOOL finished) {
//                        if (finished) {
//                            displayingPrimary = !displayingPrimary;
//                        }
//                    }
//     ];
//}


@end
