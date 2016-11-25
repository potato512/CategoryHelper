//
//  NSObject+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  图片对象类型（图片名称、图片url地址、图片image）
 */
typedef NS_ENUM(NSInteger, SYImageType)
{
    /**
     *  图片对象类型-图片名称
     */
    SYImageTypeName = 1,
    /**
     *  图片对象类型-图片url地址
     */
    SYImageTypeUrl = 2,
    /**
     *  图片对象类型-图片image
     */
    SYImageTypeImage = 3
};

@interface NSObject (SYCategory)

/**
 *  获取设备 ip 地址
 *
 *  @return ip 地址字符串
 */
+ (NSString *)getIPAddress;

/// 计算字符高度（根据字符，字体，及指定宽度）
- (CGFloat)heightWithText:(NSString *)string font:(UIFont *)font constrainedToWidth:(CGFloat)width;

/// 单行文字宽度
- (CGFloat)widthWithText:(NSString *)string font:(UIFont *)font;

/// 结束编辑
- (void)finishEditing;

/**
 *  判断图片类型（图片名称，或图片url地址，或图片image）
 *
 *  @return 图片类型
 */
- (SYImageType)imageTypeWithImage;

@end
