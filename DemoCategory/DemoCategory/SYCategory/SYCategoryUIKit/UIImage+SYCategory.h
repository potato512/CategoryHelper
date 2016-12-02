//
//  UIImage+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SYCategory)

#pragma mark - 图片

/// 生成指定颜色和大小的图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/// 获取图片，根据图片url（如：url = http://.../xxx.jpg）
+ (UIImage *)imageWithUrl:(NSString *)url;

/// 读取本地图片（如：name = xxx.png）
+ (UIImage *)imageWithBundleName:(NSString *)name;

/// 读取本地图片（如：xxx.png，name = xxx，type = png）
+ (UIImage *)imageWithBundleName:(NSString *)name type:(NSString *)type;

#pragma mark - 图片拉升

/// 图片拉升
- (void)resizableImage;

/// 拉伸图片-指定UIEdgeInsets
- (void)resizableImage:(UIEdgeInsets)edge;

/// 拉伸图片-指定UIEdgeInsets，指定UIImageResizingMode
- (void)resizableImage:(UIEdgeInsets)edge mode:(UIImageResizingMode)mode;

#pragma mark - 图片压缩

/// 改变图片大小
- (UIImage *)scaleImageWithSize:(float)size;

/**
 *  图片调整尺寸大小
 *
 *  @param size 调整后尺寸大小
 *
 *  @return 调整后 image 对象
 */
- (UIImage *)scaleImageWithSizeDimension:(CGSize)size;

/**
 *  图片调整文件大小
 *
 *  @param fileSize 调整后文件大小
 *c
 *  @return 调整后 image 对象
 */
- (UIImage *)compressionImageWithSize:(CGFloat)fileSize;

#pragma mark - 图片裁剪

/// 生成圆角图片（默认圆角大小为8.0）
- (UIImage *)roundedImageWithRadius:(CGFloat)radius;

/// 方形图片
- (UIImage *)squareImageWithSize:(CGSize)newSize;

/// 从图片中按指定的位置大小截取图片的一部分
+ (UIImage *)screenImageWithImage:(UIImage *)image size:(CGRect)rect;

/**
 *  全屏截图
 *
 *  @return 截图后 image 对象
 */
+ (UIImage *)mainScreenImage;

/// 屏幕截图（指定视图）
+ (UIImage *)screenImageWithView:(UIView *)view;
/// 从视图中按指定的位置大小截取图片的一部分
+ (UIImage *)screenImageWithView:(UIView *)view size:(CGRect)rect;

#pragma mark - 图片滤镜

/// UIImage转为灰度图 CGColorSpaceCreateDeviceGray会创建一个设备相关的灰度颜色空间的引用。
- (UIImage *)grayImage;


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
- (UIImage *)imageFilterWithFilterName:(NSString *)filterName;
- (void)imageFilterWithFilterName:(NSString *)filterName image:(void (^)(UIImage *image))complete;

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
- (UIImage *)imageBlurWithBlurName:(NSString *)blurName radius:(NSInteger)radius;
- (void)imageBlurWithBlurName:(NSString *)blurName radius:(NSInteger)radius image:(void (^)(UIImage *image))complete;

/**
 *  图片调整（饱和度、亮度、对比度）
 *
 *  @param saturation 饱和度
 *  @param brightness 亮度
 *  @param contrast   对比度
 *
 *  @return 处理后 image 对象
 */
- (UIImage *)imageAdjustWithSaturation:(CGFloat)saturation brightness:(CGFloat)brightness contrast:(CGFloat)contrast;
- (void)imageAdjustWithSaturation:(CGFloat)saturation brightness:(CGFloat)brightness contrast:(CGFloat)contrast image:(void (^)(UIImage *image))complete;

#pragma mark - 图片保存

/// 保存图片到指定路径，是否成功回调
- (void)saveImageWithPath:(NSString *)filePath complete:(void (^)(BOOL isSuccess))complete;

/// 保存图片到手机相册，是否成功回调
- (void)saveImageToPhotosAlbum:(void (^)(BOOL isSuccess))complete;

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;

#pragma mark - 获取相册图片

/// 获取n张相片（0时为全部），最近的n张图片或最早的n张图片
+ (void)imagesFromAssetsLibraryWithNum:(NSInteger)count latest:(BOOL)latest start:(void(^)(void))start success:(void(^)(NSArray *images))success error:(void(^)(void))error;

#pragma mark - 图片转二进制流字符串

/**
 *  图片转二进制流字符串
 *
 *  @param quality 压缩精度（0.0 ~ 1.0）
 *
 *  @return 返回二进制流字符串
 */
- (NSString *)imageBytesStringWithQuality:(CGFloat)quality;

/**
 *  二进制流字符串转图片
 *
 *  @param string 二进制流字符串
 *
 *  @return image
 */
+ (UIImage *)imageWithImageBytes:(NSString *)string;

/**
 *  图片转二进制流
 *
 *  @param quality 压缩精度（0.0 ~ 1.0）
 *
 *  @return 返回二进制流
 */
- (NSData *)imageDataWithQuality:(CGFloat)quality;

/**
 *  图片转二进制流base64字符串
 *
 *  @param quality 压缩精度（0.0 ~ 1.0）
 *
 *  @return 返回二进制流base64字符串
 */
- (NSString *)imageBase64StringWithQuality:(CGFloat)quality;

// base64字符串转图片
+ (UIImage *)imageWithImageBase64:(NSString *)string;

@end
