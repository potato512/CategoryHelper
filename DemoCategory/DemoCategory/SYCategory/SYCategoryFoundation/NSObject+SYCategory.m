//
//  NSObject+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSObject+SYCategory.h"
#import <ifaddrs.h>
#import <arpa/inet.h>

@implementation NSObject (SYCategory)

/// 计算字符高度（根据字符，字体，及指定宽度）
- (CGFloat)heightWithText:(NSString *)string font:(UIFont *)font constrainedToWidth:(CGFloat)width
{
    CGSize rtSize;
    if (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0))
    {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        
        rtSize = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
        return ceil(rtSize.height) + 0.5;
    }
    else
    {
        rtSize = [string sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
        return rtSize.height;
    }
}

/// 单行文字宽度
- (CGFloat)widthWithText:(NSString *)string font:(UIFont *)font
{
    CGSize rtSize;
    if (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0))
    {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        
        rtSize = [string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
        return ceil(rtSize.width) + 0.5;
    }
    else
    {
        rtSize = [string sizeWithFont:font constrainedToSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
        return rtSize.width;
    }
}

/// 结束编辑
- (void)finishEditing
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

/**
 *  判断图片类型（图片名称，或图片url地址，或图片image）
 *
 *  @return 图片类型
 */
- (SYImageType)imageTypeWithImage
{
    SYImageType type = SYImageTypeName;
    
    if ([self isKindOfClass:[NSString class]])
    {
        id object = (NSString *)self;
        if ([object hasPrefix:@"http://"] || [object hasPrefix:@"https://"])
        {
            // 图片网络地址，即http://，或https://
            type = SYImageTypeUrl;
        }
        else
        {
            // 图片名称，即NSString类型
            type = SYImageTypeName;
        }
    }
    else if ([self isKindOfClass:[UIImage class]])
    {
        // 图片，即UIImage类型
        type = SYImageTypeImage;
    }
    
    return type;
}


@end
