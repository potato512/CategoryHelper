//
//  UIImage+SYQrcode.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2018/9/18.
//  Copyright © 2018年 zhangshaoyu. All rights reserved.
//  二维码，或条形码生成

#import <UIKit/UIKit.h>

@interface UIImage (SYQrcode)

/// 生成二维码（指定内容，指定大小，指定颜色）
+ (UIImage *)QrcodeImageWithContent:(NSString *)content size:(CGFloat)size colorRed:(CGFloat)red colorGreen:(CGFloat)green colorBlue:(CGFloat)blue;

/// 生成二维码（指定内容，指定大小，透明色）
+ (UIImage *)QrcodeImageWithContent:(NSString *)content size:(CGFloat)size;

/// 生成条形码 条形码尺寸大小
+ (UIImage *)BarcodeImageWithContent:(NSString *)content size:(CGSize)size;

@end
