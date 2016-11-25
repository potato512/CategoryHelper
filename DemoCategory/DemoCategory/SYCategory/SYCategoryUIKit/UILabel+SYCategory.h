//
//  UILabel+SYCategory.h
//  DemoCategory
//
//  Created by herman on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 自适应大小类型（宽高，或宽）
typedef NS_ENUM(NSInteger, SYLabelAutoSizeType)
{
    /// 自适应宽
    SYLabelAutoSizeTypeHorizontal = 1,
    
    /// 自适应宽高
    SYLabelAutoSizeTypeAll
};

@interface UILabel (SYCategory)

/**
 *  修改标签信息
 *
 *  @param characterSpace 字体间距
 *  @param rowSpace       行间距
 *  @param string         要修改的文字
 *  @param color          要修改的文字颜色
 */
- (void)adjustLabel:(CGFloat)characterSpace rowSpace:(CGFloat)rowSpace text:(NSString *)string color:(UIColor *)color;

/// 设置自适应标签宽高
- (void)labelAutoSize:(SYLabelAutoSizeType)type;

@end
