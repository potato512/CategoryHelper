//
//  UIGestureRecognizer+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UIGestureRecognizer+SYCategory.h"
#import <objc/runtime.h>

/*
typedef void (^TapRecognizer)(UITapGestureRecognizer *recognizer);
static TapRecognizer tapRecognizer;

typedef void (^LongPressRecognizer)(UILongPressGestureRecognizer *recognizer);
static LongPressRecognizer longPressRecognizer;

typedef void (^PanRecognizer)(UIPanGestureRecognizer *recognizer);
static PanRecognizer panRecognizer;

typedef void (^PinchRecognizer)(UIPinchGestureRecognizer *recognizer);
static PinchRecognizer pinchRecognizer;

typedef void (^SwipeRecognizer)(UISwipeGestureRecognizer *recognizer);
static SwipeRecognizer swipeRecognizer;

typedef void (^RotationRecognizer)(UIRotationGestureRecognizer *recognizer);
static RotationRecognizer rotationRecognizer;
*/

@implementation UIGestureRecognizer (SYCategory)

/*
void removeRecognizer(UIView *view)
{
    for (UIGestureRecognizer *recognizer in view.gestureRecognizers)
    {
        [view removeGestureRecognizer:recognizer];
    }
}

#pragma mark - 点击手势

// 点击手势（点击次数默认1）
+ (void)tapRecognizer:(UIView *)view tapNumber:(NSInteger)number action:(void (^)(UITapGestureRecognizer *recognizer))action
{
    removeRecognizer(view);
    
    tapRecognizer = action;
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    recognizer.numberOfTapsRequired = (0 >= number ? 1 : number);
    if (view)
    {
        view.userInteractionEnabled = YES;
        [view addGestureRecognizer:recognizer];
    }
}

+ (void)tapClick:(UITapGestureRecognizer *)recognizer
{
    if (tapRecognizer)
    {
        tapRecognizer(recognizer);
    }
}

#pragma mark - 长按手势

// 长按手势（长按时间默认0.5）
+ (void)longPressRecognizer:(UIView *)view minimumPressDuration:(CFTimeInterval)time action:(void (^)(UILongPressGestureRecognizer *recognizer))action
{
    removeRecognizer(view);
    
    longPressRecognizer = action;
    
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressClick:)];
    recognizer.minimumPressDuration = (0 >= time ? 0.5 : time);
    if (view)
    {
        view.userInteractionEnabled = YES;
        [view addGestureRecognizer:recognizer];
    }
}

+ (void)longPressClick:(UILongPressGestureRecognizer *)recognizer
{
    if (longPressRecognizer)
    {
        longPressRecognizer(recognizer);
    }
}

#pragma mark - 拖拽手势

+ (void)panRecognizer:(UIView *)view action:(void (^)(UIPanGestureRecognizer *recognizer))action
{
    removeRecognizer(view);
    
    panRecognizer = action;
    
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panClick:)];
    if (view)
    {
        view.userInteractionEnabled = YES;
        [view addGestureRecognizer:recognizer];
    }
}

+ (void)panClick:(UIPanGestureRecognizer *)recognizer
{
    if (panRecognizer)
    {
        panRecognizer(recognizer);
    }
}

#pragma mark - 拿捏缩放手势

+ (void)pinchRecognizer:(UIView *)view action:(void (^)(UIPinchGestureRecognizer *recognizer))action
{
    removeRecognizer(view);
    
    pinchRecognizer = action;
    
    UIPinchGestureRecognizer *recognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchClick:)];
    if (view)
    {
        view.userInteractionEnabled = YES;
        [view addGestureRecognizer:recognizer];
    }
}

+ (void)pinchClick:(UIPinchGestureRecognizer *)recognizer
{
    if (pinchRecognizer)
    {
        pinchRecognizer(recognizer);
    }
}

#pragma mark - 滑动手势

+ (void)swipeRecognizer:(UIView *)view direction:(UISwipeGestureRecognizerDirection)direction action:(void (^)(UISwipeGestureRecognizer *recognizer))action
{
    removeRecognizer(view);
    
    swipeRecognizer = action;
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeClick:)];
    recognizer.direction = direction;
    if (view)
    {
        view.userInteractionEnabled = YES;
        [view addGestureRecognizer:recognizer];
    }
}

+ (void)swipeClick:(UISwipeGestureRecognizer *)recognizer
{
    if (swipeRecognizer)
    {
        swipeRecognizer(recognizer);
    }
}

#pragma mark - 旋转手势

+ (void)rotationRecognizer:(UIView *)view action:(void (^)(UIRotationGestureRecognizer *recognizer))action
{
    removeRecognizer(view);
    
    rotationRecognizer = action;
    
    UIRotationGestureRecognizer *recognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationClick:)];
    if (view)
    {
        view.userInteractionEnabled = YES;
        [view addGestureRecognizer:recognizer];
    }
}

+ (void)rotationClick:(UIRotationGestureRecognizer *)recognizer
{
    if (rotationRecognizer)
    {
        rotationRecognizer(recognizer);
    }
}
*/


@end
