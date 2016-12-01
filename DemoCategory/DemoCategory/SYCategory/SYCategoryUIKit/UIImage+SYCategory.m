//
//  UIImage+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UIImage+SYCategory.h"
#import <AssetsLibrary/AssetsLibrary.h>

typedef void (^SaveToPhotosAlbumComplete)(BOOL isSuccess);
static SaveToPhotosAlbumComplete saveToPhotosAlbumComplete;

#pragma mark - 获取相册图片
static ALAssetsLibrary *assetsLibrary;
static NSMutableArray *imageResults;
typedef void (^startBlock)(void);
static startBlock assetsLibraryStartBlock;
typedef void (^successBlock)(NSArray *imageSuccess);
static successBlock assetsLibrarySuccessBlock;
typedef void (^errorBlock)(void);
static errorBlock assetsLibraryErrorBlock;

@implementation UIImage (SYCategory)

#pragma mark - 图片

static CGContextRef _newBitmapContext(CGSize size)
{
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    size_t imgWith = (size_t)(size.width + 0.5);
    size_t imgHeight = (size_t)(size.height + 0.5);
    size_t bytesPerRow = imgWith * 4;
    
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 imgWith,
                                                 imgHeight,
                                                 8,
                                                 bytesPerRow,
                                                 colorSpaceRef,
                                                 (kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst));
    CGColorSpaceRelease(colorSpaceRef);
    return context;
}

/// 生成指定颜色和大小的图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGContextRef context = _newBitmapContext(size);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    
    CGImageRef imgRef = CGBitmapContextCreateImage(context);
    UIImage *img = [UIImage imageWithCGImage:imgRef];
    
    CGContextRelease(context);
    CGImageRelease(imgRef);
    
    return img;
}

/// 获取图片，根据图片url（如：url = http://.../xxx.jpg）
+ (UIImage *)imageWithUrl:(NSString *)url
{
    return [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
}

/// 读取本地图片（如：name = xxx.png）
+ (UIImage *)imageWithBundleName:(NSString *)name
{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:nil]];
}

/// 读取本地图片（如：xxx.png，name = xxx，type = png）
+ (UIImage *)imageWithBundleName:(NSString *)name type:(NSString *)type
{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:type]];
}

#pragma mark - 图片拉升

/// 图片拉升
- (void)resizableImage
{
    [self resizableImage:UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0)];
}

/// 拉伸图片-指定UIEdgeInsets
- (void)resizableImage:(UIEdgeInsets)edge
{
    [self resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
}

/// 拉伸图片-指定UIEdgeInsets，指定UIImageResizingMode
- (void)resizableImage:(UIEdgeInsets)edge mode:(UIImageResizingMode)mode
{
    [self resizableImageWithCapInsets:edge resizingMode:mode];
}

#pragma mark - 图片压缩

/// 改变图片大小
- (UIImage *)scaleImageWithSize:(float)size
{
    CGSize temSize = CGSizeZero;
    if (MIN(self.size.width, self.size.height) <= size)
    {
        temSize = self.size;
    }
    else if (self.size.width - self.size.height > 0.0)
    {
        temSize = CGSizeMake(self.size.width * size / self.size.height, size);
    }
    else
    {
        temSize = CGSizeMake(size, self.size.height * size / self.size.width);
    }
    
    UIGraphicsBeginImageContext(temSize);
    [self drawInRect:CGRectMake(0.0, 0.0, temSize.width, temSize.height)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}

/**
 *  图片调整尺寸大小
 *
 *  @param size 调整后尺寸大小
 *
 *  @return 调整后 image 对象
 */
- (UIImage *)scaleImageWithSizeDimension:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0.0, 0.0, size.width, size.height)];
    UIGraphicsEndImageContext();
    return self;
}

/**
 *  图片调整文件大小
 *
 *  @param fileSize 调整后文件大小
 *c
 *  @return 调整后 image 对象
 */
- (UIImage *)compressionImageWithSize:(CGFloat)fileSize
{
    NSData *data = UIImageJPEGRepresentation(self, 1.0);
    CGFloat dataKBytes = data.length / 1000.0;
    CGFloat maxQuqlity = 0.9;
    CGFloat lastData = dataKBytes;
    while (dataKBytes > fileSize && maxQuqlity > 0.01)
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

#pragma mark - 图片裁剪

// 将图片裁剪成圆角的，并没有改变图片的质量
static void AddRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth, float ovalHeight)
{
    if (ovalWidth == 0.0 || ovalHeight == 0.0)
    {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    float fileWidth = CGRectGetWidth(rect) / ovalWidth;
    float fileHeight = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fileWidth, fileHeight / 2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fileWidth, fileHeight, fileWidth / 2, fileHeight, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fileHeight, 0, fileHeight / 2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fileWidth / 2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fileWidth, 0, fileWidth, fileHeight / 2, 1); // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

/// 生成圆角图片（默认圆角大小为8.0）
- (UIImage *)roundedImageWithRadius:(CGFloat)radius
{
    if (0.0 == radius)
    {
        radius = 8.0;
    }
    // the size of CGContextRef
    int width = self.size.width;
    int height = self.size.height;
    
    UIImage *img = self;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, 4 * width, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0.0, 0.0, width, height);
    
    CGContextBeginPath(context);
    AddRoundedRectToPath(context, rect, radius, radius);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0.0, 0.0, width, height), img.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return [UIImage imageWithCGImage:imageMasked];
}

/// 方形图片
- (UIImage *)squareImageWithSize:(CGSize)newSize
{
    double ratio;
    double delta;
    CGPoint offset;
    
    CGSize sz = CGSizeMake(newSize.width, newSize.width);
    
    if (self.size.width > self.size.height)
    {
        ratio = newSize.width / self.size.width;
        delta = (ratio * self.size.width - ratio * self.size.height);
        offset = CGPointMake(delta / 2, 0.0);
    }
    else
    {
        ratio = newSize.width / self.size.height;
        delta = (ratio * self.size.height - ratio * self.size.width);
        offset = CGPointMake(0.0, delta / 2);
    }
    
    CGRect clipRect = CGRectMake(-offset.x, -offset.y, (ratio * self.size.width) + delta, (ratio * self.size.height) + delta);
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
    {
        UIGraphicsBeginImageContextWithOptions(sz, YES, 0.0);
    }
    else
    {
        UIGraphicsBeginImageContext(sz);
    }
    UIRectClip(clipRect);
    [self drawInRect:clipRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

/// 从图片中按指定的位置大小截取图片的一部分
+ (UIImage *)screenImageWithImage:(UIImage *)image size:(CGRect)rect
{
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    return newImage;
}

/**
 *  全屏截图
 *
 *  @return 截图后 image 对象
 */
+ (UIImage *)mainScreenImage
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIImage *image = [self screenImageWithView:window];
    return image;
}

/// 屏幕截图（指定视图）
+ (UIImage *)screenImageWithView:(UIView *)view
{
//    UIGraphicsBeginImageContext(view.bounds.size);
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}

/// 从视图中按指定的位置大小截取图片的一部分
+ (UIImage *)screenImageWithView:(UIView *)view size:(CGRect)rect
{
    // 开始取图，参数：截图图片大小
    UIGraphicsBeginImageContext(rect.size);
    // 截图层放入上下文中
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    // 从上下文中获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束截图
    UIGraphicsEndImageContext();
    
    return image;
    
    
//    UIImage *image = [self screenImageWithView:view];
//    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextTranslateCTM(context, 0, rect.size.height); // 下移
//    CGContextScaleCTM(context, 1.0, -1.0); // 上翻
//    CGContextDrawImage(context, rect, imageRef);
//    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    CGImageRelease(imageRef);
//    CGContextRelease(context);
//    return result;
}

#pragma mark - 图片滤镜

/// UIImage转为灰度图 CGColorSpaceCreateDeviceGray会创建一个设备相关的灰度颜色空间的引用。
- (UIImage *)grayImage
{
    int width = self.size.width;
    int height = self.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil, width, height, 8, 0, colorSpace, kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL)
    {
        return nil;
    }
    CGContextDrawImage(context,CGRectMake(0, 0, width, height), self.CGImage);
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    return grayImage;
}


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

#pragma mark - 图片保存

/// 保存图片到指定路径，是否成功回调
- (void)saveImageWithPath:(NSString *)filePath complete:(void (^)(BOOL isSuccess))complete
{
    /*
     NSData *imageData = UIImageJPEGRepresentation(tempImage, 1.0);
     NSString *fullPathToFile  = [self cachesFolderPathWithName:imageName];
     [imageData writeToFile:path atomically:NO];
     return fullPathToFile;
     */
    
    NSData *imageData = UIImageJPEGRepresentation(self, 0.5);
    BOOL isResult = [imageData writeToFile:filePath atomically:NO];
    if (complete)
    {
        complete(isResult);
    }
}

/// 保存图片到手机相册，是否成功回调
- (void)saveImageToPhotosAlbum:(void (^)(BOOL isSuccess))complete
{
    saveToPhotosAlbumComplete = complete;
    UIImageWriteToSavedPhotosAlbum(self, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    BOOL isResult = (error == nil ? YES : NO);
    if (saveToPhotosAlbumComplete)
    {
        saveToPhotosAlbumComplete(isResult);
    }
}

#pragma mark - 获取相册图片

/// 获取n张相片（0时为全部），最近的n张图片或最早的n张图片
- (void)imagesFromAssetsLibraryWithNum:(NSInteger)count latest:(BOOL)latest start:(void(^)(void))start success:(void(^)(NSArray *images))success error:(void(^)(void))error
{
    [self removeImage];
    
    NSInteger imageCount = count;
    BOOL islatest = latest;
    
    assetsLibraryStartBlock = [start copy];
    assetsLibrarySuccessBlock = [success copy];
    assetsLibraryErrorBlock = [error copy];
    
    assetsLibrary = [[ALAssetsLibrary alloc] init];
    imageResults = [[NSMutableArray alloc] init];
    
    __weak UIImage *weakSelf = self;
    
    __block NSString *assetPropertyType = ALAssetTypePhoto;
    __block NSMutableArray *assets = [[NSMutableArray alloc] init];
    
    if (assetsLibraryStartBlock)
    {
        assetsLibraryStartBlock();
    }
    
    dispatch_queue_t dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(dispatchQueue, ^(void) {
        void (^assetGroupEnumerator)(ALAssetsGroup *, BOOL *) = ^(ALAssetsGroup *group, BOOL *stop)
        {
            if (!group)
            {
                return;
            }
            *stop = YES;
            
            __block int num = 0;
            [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop)
             {
                 if (!result)
                 {
                     return;
                 }
                 
                 __block ALAsset *assetResult = result;
                 num++;
                 NSInteger numberOf = [group numberOfAssets];
                 
                 NSString *al_assetPropertyType = [assetResult valueForProperty:ALAssetPropertyType];
                 if ([al_assetPropertyType isEqualToString:assetPropertyType])
                 {
                     [assets addObject:assetResult];
                 }
                 
                 if (num == numberOf)
                 {
                     if (0 == imageCount)
                     {
                         [weakSelf GetImageAll:assets];
                     }
                     else
                     {
                         [weakSelf GetImagelastest:islatest num:imageCount images:assets];
                     }
                 }
             }];
        };
        
        // Group Enumerator Failure Block
        void (^assetGroupEnumberatorFailure)(NSError *) = ^(NSError *error) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSLog(@"error failure");
                
                if (assetsLibraryErrorBlock)
                {
                    assetsLibraryErrorBlock();
                }
            });
        };
        
        // Enumerate Albums
        [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos
                                     usingBlock:assetGroupEnumerator
                                   failureBlock:assetGroupEnumberatorFailure];
    });
}

// 清空原有图片
- (void)removeImage
{
    if (imageResults && 0 != imageResults.count)
    {
        [imageResults removeAllObjects];
    }
}

// 获取所有相片
- (void)GetImageAll:(NSArray *)array
{
    for (ALAsset *assetResult in array)
    {
        // CGImageRef imageRef = [assetResult thumbnail]; // 缩略图
        CGImageRef imageRef = [[assetResult defaultRepresentation] fullScreenImage]; // 原图
        UIImage *image = [UIImage imageWithCGImage:imageRef];
        if (image)
        {
            // 获取到第一张图片
            [imageResults addObject:image];
        }
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (assetsLibrarySuccessBlock)
        {
            assetsLibrarySuccessBlock(imageResults);
        }
    });
}

// 获取最新的，或最早的
- (void)GetImagelastest:(BOOL)latest num:(NSInteger)count images:(NSArray *)array
{
    if (!array || 0 == array.count)
    {
        return;
    }
    
    NSMutableArray *images = [[NSMutableArray alloc] initWithArray:array];
    NSInteger realCount = images.count; // 实际图片数量
    NSInteger limitCount = (realCount < count ? realCount : count); // 实际限制图片数量
    
    if (latest)
    {
        for (int i = 0; i < limitCount; i++)
        {
            ALAsset *assetResult = [images lastObject];
            // CGImageRef imageRef = [assetResult thumbnail]; // 缩略图
            CGImageRef imageRef = [[assetResult defaultRepresentation] fullScreenImage]; // 原图
            UIImage *image = [UIImage imageWithCGImage:imageRef];
            if (image)
            {
                // 获取到第一张图片
                [imageResults addObject:image];
            }
            [images removeLastObject];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (assetsLibrarySuccessBlock)
            {
                assetsLibrarySuccessBlock(imageResults);
            }
        });
    }
    else
    {
        for (int i = 0; i < limitCount; i++)
        {
            ALAsset *assetResult = [images objectAtIndex:i];
            // CGImageRef imageRef = [assetResult thumbnail]; // 缩略图
            CGImageRef imageRef = [[assetResult defaultRepresentation] fullScreenImage]; // 原图
            UIImage *image = [UIImage imageWithCGImage:imageRef];
            if (image)
            {
                // 获取到第一张图片
                [imageResults addObject:image];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (assetsLibrarySuccessBlock)
            {
                assetsLibrarySuccessBlock(imageResults);
            }
        });
    }
}

#pragma mark - 图片转二进制流字符串

/**
 *  图片转二进制流字符串
 *
 *  @param quality 压缩精度（0.0 ~ 1.0）
 *
 *  @return 返回二进制流字符串
 */
- (NSString *)imageBytesStringWithQuality:(CGFloat)quality
{
    NSData *imageData = UIImageJPEGRepresentation(self, quality);
    NSStringEncoding imageEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingISOLatin1);
    NSString *imageBytesStr = [[NSString alloc] initWithData:imageData encoding:imageEncoding];
    
    return imageBytesStr;
}

/**
 *  二进制流字符串转图片
 *
 *  @param string 二进制流字符串
 *
 *  @return image
 */
+ (UIImage *)imageWithImageBytes:(NSString *)string
{
    NSStringEncoding imageEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingISOLatin1);
    NSData *data = [string dataUsingEncoding:imageEncoding];
    UIImage *image = [[UIImage alloc] initWithData:data];
    return image;
}

/**
 *  图片转二进制流
 *
 *  @param quality 压缩精度（0.0 ~ 1.0）
 *
 *  @return 返回二进制流
 */
- (NSData *)imageDataWithQuality:(CGFloat)quality
{
    NSData *imageData = UIImageJPEGRepresentation(self, quality);
    
    return imageData;
}

/**
 *  图片转二进制流base64字符串
 *
 *  @param quality 压缩精度（0.0 ~ 1.0）
 *
 *  @return 返回二进制流base64字符串
 */
- (NSString *)imageBase64StringWithQuality:(CGFloat)quality
{
    NSData *imageData = UIImageJPEGRepresentation(self, quality);
    NSString *imageBase64 = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    return imageBase64;
}

// base64字符串转图片
+ (UIImage *)imageWithImageBase64:(NSString *)string
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

@end
