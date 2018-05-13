//
//  UIView+SYRecognizer.m
//  DemoCategory
//
//  Created by Herman on 2018/5/13.
//  Copyright © 2018年 zhangshaoyu. All rights reserved.
//

#import "UIView+SYRecognizer.h"
#import <objc/runtime.h>

typedef void(^TapBlock)(UITapGestureRecognizer *recognizer);
typedef void(^LongPressBlock)(UILongPressGestureRecognizer *recognizer);
typedef void(^PanBlock)(UIPanGestureRecognizer *recognizer);
typedef void(^PinchBlock)(UIPinchGestureRecognizer *recognizer);
typedef void(^SwipeBlock)(UISwipeGestureRecognizer *recognizer);
typedef void(^RotationBlock)(UIRotationGestureRecognizer *recognizer);

@interface UIView ()

@property (nonatomic, copy) TapBlock tapBlock;
@property (nonatomic, copy) LongPressBlock longPressBlock;
@property (nonatomic, copy) PanBlock panBlock;
@property (nonatomic, copy) PinchBlock pinchBlock;
@property (nonatomic, copy) SwipeBlock swipeBlock;
@property (nonatomic, copy) RotationBlock rotationBlock;

@end

@implementation UIView (SYRecognizer)

#pragma mark - 解摸手势

/// 单击，或双击响应
- (void)tapRecognizer:(NSInteger)tapNumber action:(void (^)(UITapGestureRecognizer *recognizer))action
{
    self.tapBlock = [action copy];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    recognizer.numberOfTapsRequired = (0 >= tapNumber ? 1 : tapNumber);
    if (self)
    {
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:recognizer];
    }
}

/// 长按手势（长按时间默认0.5）
- (void)longPressRecognizer:(CFTimeInterval)time action:(void (^)(UILongPressGestureRecognizer *recognizer))action
{
    self.longPressBlock = [action copy];
    
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressClick:)];
    recognizer.minimumPressDuration = time;
    if (self)
    {
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:recognizer];
    }
}

/// 拖动手势
- (void)panRecognizer:(void (^)(UIPanGestureRecognizer *recognizer))action
{
    self.panBlock = [action copy];
    
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panClick:)];
    if (self)
    {
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:recognizer];
    }
}

/// 拿捏手势
- (void)pinchRecognizer:(void (^)(UIPinchGestureRecognizer *recognizer))action
{
    self.pinchBlock = [action copy];
    
    UIPinchGestureRecognizer *recognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchClick:)];
    if (self)
    {
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:recognizer];
    }
}

/// 滑动手势
- (void)swipeRecognizer:(UISwipeGestureRecognizerDirection)direction action:(void (^)(UISwipeGestureRecognizer *recognizer))action
{
    self.swipeBlock = [action copy];
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeClick:)];
    recognizer.direction = direction;
    if (self)
    {
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:recognizer];
    }
}

/// 旋转手势
- (void)rotationRecognizer:(void (^)(UIRotationGestureRecognizer *recognizer))action
{
    self.rotationBlock = [action copy];
    
    UIRotationGestureRecognizer *recognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationClick:)];
    if (self)
    {
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:recognizer];
    }
}

#pragma mark - setter/getter

- (void)setTapBlock:(TapBlock)tapBlock
{
    if (tapBlock)
    {
        objc_setAssociatedObject(self, @selector(tapBlock), tapBlock, OBJC_ASSOCIATION_COPY);
    }
}

- (TapBlock)tapBlock
{
    TapBlock recognizer = objc_getAssociatedObject(self, @selector(tapBlock));
    return recognizer;
}

- (void)setLongPressBlock:(LongPressBlock)longPressBlock
{
    if (longPressBlock)
    {
        objc_setAssociatedObject(self, @selector(longPressBlock), longPressBlock, OBJC_ASSOCIATION_COPY);
    }
}

- (LongPressBlock)longPressBlock
{
    LongPressBlock recognizer = objc_getAssociatedObject(self, @selector(longPressBlock));
    return recognizer;
}

- (void)setPanBlock:(PanBlock)panBlock
{
    if (panBlock)
    {
        objc_setAssociatedObject(self, @selector(panBlock), panBlock, OBJC_ASSOCIATION_COPY);
    }
}

- (PanBlock)panBlock
{
    PanBlock recognizer = objc_getAssociatedObject(self, @selector(panBlock));
    return recognizer;
}

- (void)setPinchBlock:(PinchBlock)pinchBlock
{
    if (pinchBlock)
    {
        objc_setAssociatedObject(self, @selector(pinchBlock), pinchBlock, OBJC_ASSOCIATION_COPY);
    }
}

- (PinchBlock)pinchBlock
{
    PinchBlock recognizer = objc_getAssociatedObject(self, @selector(pinchBlock));
    return recognizer;
}

- (void)setSwipeBlock:(SwipeBlock)swipeBlock
{
    if (swipeBlock)
    {
        objc_setAssociatedObject(self, @selector(swipeBlock), swipeBlock, OBJC_ASSOCIATION_COPY);
    }
}

- (SwipeBlock)swipeBlock
{
    SwipeBlock recognizer = objc_getAssociatedObject(self, @selector(swipeBlock));
    return recognizer;
}

- (void)setRotationBlock:(RotationBlock)rotationBlock
{
    if (rotationBlock)
    {
        objc_setAssociatedObject(self, @selector(rotationBlock), rotationBlock, OBJC_ASSOCIATION_COPY);
    }
}

- (RotationBlock)rotationBlock
{
    RotationBlock recognizer = objc_getAssociatedObject(self, @selector(rotationBlock));
    return recognizer;
}

#pragma mark - 方法

- (void)tapClick:(UITapGestureRecognizer *)recognizer
{
    if (self.tapBlock)
    {
        self.tapBlock(recognizer);
    }
}

- (void)longPressClick:(UILongPressGestureRecognizer *)recognizer
{
    if (self.longPressBlock)
    {
        self.longPressBlock(recognizer);
    }
}

- (void)panClick:(UIPanGestureRecognizer *)recognizer
{
    if (self.panBlock)
    {
        self.panBlock(recognizer);
    }
}

- (void)pinchClick:(UIPinchGestureRecognizer *)recognizer
{
    if (self.pinchBlock)
    {
        self.pinchBlock(recognizer);
    }
}

- (void)swipeClick:(UISwipeGestureRecognizer *)recognizer
{
    if (self.swipeBlock)
    {
        self.swipeBlock(recognizer);
    }
}

- (void)rotationClick:(UIRotationGestureRecognizer *)recognizer
{
    if (self.rotationBlock)
    {
        self.rotationBlock(recognizer);
    }
}

@end
