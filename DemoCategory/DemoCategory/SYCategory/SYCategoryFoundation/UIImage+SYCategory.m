//
//  UIImage+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UIImage+SYCategory.h"

@implementation UIImage (SYCategory)

/**
 *  图片滤镜处理
 *
 *  @param filterName 滤镜名称
 *
 *  怀旧 CIPhotoEffectInstant
 *  黑白 CIPhotoEffectNoir
 *  色调 CIPhotoEffectTonal
 *  岁月 CIPhotoEffectTransfer
 *  单色 CIPhotoEffectMono
 *  褪色 CIPhotoEffectFade
 *  冲印 CIPhotoEffectProcess
 *  铬黄 CIPhotoEffectChrome
 *
 *  @return 处理后 image 对象
 */
- (UIImage *)filterImageWithFilterName:(NSString *)filterName
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc] initWithImage:self];
    CIFilter *filter = [CIFilter filterWithName:filterName];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    CIImage *outputImage = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:outputImage fromRect:outputImage.extent];
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return image;
}

/**
 *  图片模糊处理
 *
 *  @param blurName 滤镜名称
 *  @param radius   滤镜半径
 *
 *  高斯模糊                                CIGaussianBlur
 *  均值模糊                                CIBoxBlur
 *  环形卷积模糊                             CIDiscBlur
 *  中值模糊，用于消除图像噪点（无需设置radius） CIMedianFilter
 *  运动模糊，用于模拟相机移动拍摄时的扫尾效果    CIMotionBlur
 *
 *
 *  @return 处理后 image 对象
 */
- (UIImage *)blurImageWithBlurName:(NSString *)blurName radius:(NSInteger)radius
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc] initWithImage:self];
    
    if (0 != blurName.length)
    {
        CIFilter *filter = [CIFilter filterWithName:blurName];
        [filter setValue:inputImage forKey:kCIInputImageKey];
        if ([blurName isEqualToString:@"CIMedianFilter"])
        {
            [filter setValue:@(radius) forKey:@"inputRadius"];
        }
        
        CIImage *outputImage = [filter valueForKey:kCIOutputImageKey];
        CGImageRef cgImage = [context createCGImage:outputImage fromRect:outputImage.extent];
        UIImage *image = [UIImage imageWithCGImage:cgImage];
        CGImageRelease(cgImage);
        return image;
    }
    
    return nil;
}

/**
 *  图片调整（饱和度、亮度、对比度）
 *
 *  @param saturation 饱和度
 *  @param brightness 亮度
 *  @param contrast   对比度
 *
 *  @return 处理后 image 对象
 */

- (UIImage *)adjustImageWithSaturation:(CGFloat)saturation brightness:(CGFloat)brightness contrast:(CGFloat)contrast
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc] initWithImage:self];
    CIFilter *filter = [CIFilter filterWithName:@"CIColorControls"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    
    [filter setValue:@(saturation) forKey:@"inputSaturation"];
    [filter setValue:@(brightness) forKey:@"inputBrightness"];
    [filter setValue:@(contrast) forKey:@"inputContrast"];
    
    CIImage *outputImage = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:outputImage fromRect:outputImage.extent];
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return image;
}

/**
 *  全屏截图
 *
 *  @return 截图后 image 对象
 */
+ (UIImage *)printscreenMainScreen
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIImage *image = [self pringscreenWithView:window];
    return image;
}

/**
 *  指定view截图
 *
 *  @param view 指定view
 *
 *  @return 截图后 image 对象
 */
+ (UIImage *)pringscreenWithView:(UIView *)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 *  指定view中指定区域截图
 *
 *  @param view  指定view
 *  @param scope 指定区域
 *
 *  @return 截图后 image 对象
 */
+ (UIImage *)pringscreenWithView:(UIView *)view scope:(CGRect)scope
{
    UIImage *image = [self pringscreenWithView:view];
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, scope);
    UIGraphicsBeginImageContext(scope.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0.0, 0.0, scope.size.width, scope.size.height);
    CGContextTranslateCTM(context, 0, rect.size.height); // 下移
    CGContextScaleCTM(context, 1.0, -1.0); // 上翻
    CGContextDrawImage(context, rect, imageRef);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(imageRef);
    CGContextRelease(context);
    return result;
}

/**
 *  图片调整尺寸大小
 *
 *  @param size 调整后尺寸大小
 *
 *  @return 调整后 image 对象
 */
- (UIImage *)adjustImageWithSizeDimension:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0.0, 0.0, size.width, size.height)];
    UIGraphicsEndImageContext();
    return self;
}

/**
 *  图片调整文件大小
 *
 *  @param size 调整后文件大小
 *
 *  @return 调整后 image 对象
 */
- (UIImage *)adjustImageWithSizeFile:(CGFloat)size
{
    NSData *data = UIImageJPEGRepresentation(self, 1.0);
    CGFloat dataKBytes = data.length / 1000.0;
    CGFloat maxQuqlity = 0.9;
    CGFloat lastData = dataKBytes;
    while (dataKBytes > size && maxQuqlity > 0.01)
    {
        maxQuqlity = maxQuqlity - 0.01;
        data = UIImageJPEGRepresentation(self, maxQuqlity);
        dataKBytes = data.length / 1000.0;
        if (lastData == dataKBytes)
        {
            break;
        }
        else
        {
            lastData = dataKBytes;
        }
    }
    
    UIImage *image = [UIImage imageWithData:data];
    return image;
}


@end
