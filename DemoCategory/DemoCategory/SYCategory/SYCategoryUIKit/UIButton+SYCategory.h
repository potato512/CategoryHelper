//
//  UIButton+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 图片与标题显示样式
typedef NS_ENUM(NSInteger, SYButtonStyle)
{
    /// 图片与标题显示样式：图片居左，文字居右（默认，水平居中）
    SYButtonStyleDefault = 0,
    
    /// 图片与标题显示样式：图片居右，文字居左（水平居中）
    SYButtonStyleImageRightTextLeftHorizontalCenter = 1,
    
    /// 图片与标题显示样式：图片居中，文字居中（水平居中，垂直居中）
    SYButtonStyleCenter = 2,
    
    /// 图片与标题显示样式：图片居上，文字居下（垂直居中）
    SYButtonStyleImageUpTextDownVerticalCenter = 3,
    
    /// 图片与标题显示样式：图片居下，文字居上（垂直居中）
    SYButtonStyleImageDownTextUpVerticalCenter = 4,
};

@interface UIButton (SYCategory)

/// 图片与标题显示样式（offset大于0时拉开距离，offset小于0时缩小距离）
- (void)buttonStyle:(SYButtonStyle)style offSet:(CGFloat)offset;

// 倒计时按钮

@end
