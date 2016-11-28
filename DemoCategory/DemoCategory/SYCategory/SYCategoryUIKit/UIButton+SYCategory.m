//
//  UIButton+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UIButton+SYCategory.h"

@implementation UIButton (SYCategory)

/// 图片与标题显示样式
- (void)buttonStyle:(SYButtonStyle)style offSet:(CGFloat)offset
{
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    // image中心移动的x距离
    CGFloat imageOringinX = (imageWidth + labelWidth) / 2 - imageWidth / 2;
    // image中心移动的y距离
    CGFloat imageOriginY = imageHeight / 2 + offset / 2;
    // label中心移动的x距离
    CGFloat labelOriginX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;
    // label中心移动的y距离
    CGFloat labelOriginY = labelHeight / 2 + offset / 2;
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + offset - tempHeight;
    
    switch (style)
    {
        case SYButtonStyleDefault:
        {
            self.imageEdgeInsets = UIEdgeInsetsMake(0.0, (-offset / 2), 0.0, (offset / 2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0.0, (offset / 2), 0.0, (-offset / 2));
            self.contentEdgeInsets = UIEdgeInsetsMake(0.0, (offset / 2), 0.0, (offset / 2));
        }
            break;
        case SYButtonStyleImageRightTextLeftHorizontalCenter:
        {
            self.imageEdgeInsets = UIEdgeInsetsMake(0.0, (labelWidth + offset / 2), 0.0, -(labelWidth + offset / 2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -(imageWidth + offset / 2), 0.0, (imageWidth + offset / 2));
            self.contentEdgeInsets = UIEdgeInsetsMake(0.0, offset / 2, 0.0, offset / 2);
        }
            break;
        case SYButtonStyleCenter:
        {
            self.imageEdgeInsets = UIEdgeInsetsMake(0.0, imageOringinX, 0.0, -imageOringinX);
            self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -labelOriginX, 0.0, labelOriginX);
            self.contentEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
        }
            break;
        case SYButtonStyleImageUpTextDownVerticalCenter:
        {
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOriginY, imageOringinX, imageOriginY, -imageOringinX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOriginY, -labelOriginX, -labelOriginY, labelOriginX);
            self.contentEdgeInsets = UIEdgeInsetsMake(imageOriginY, (-changedWidth / 2), (changedHeight - imageOriginY), (-changedWidth / 2));
        }
            break;
        case SYButtonStyleImageDownTextUpVerticalCenter:
        {
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOriginY, imageOringinX, -imageOriginY, -imageOringinX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOriginY, -labelOriginX, labelOriginY, labelOriginX);
            self.contentEdgeInsets = UIEdgeInsetsMake((changedHeight - imageOriginY), (-changedWidth / 2), imageOriginY, (-changedWidth / 2));
        }
            break;
            
        default:
            break;
    }
}

@end
