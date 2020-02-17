# SYCategory
UIImage：纯色图片、图片拉升、截图、压缩、裁剪、位图处理、滤镜、相册图片、保存
 
# 效果图
![SYCategory_image.gif](./SYCategory_image.gif)

# 使用
``` javascript
/// 生成指定颜色和大小的图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/// 生成指定颜色的图片
+ (UIImage *)imageWithColor:(UIColor *)color;

/// 获取图片，根据图片url（如：url = http://.../xxx.jpg）
+ (UIImage *)imageWithUrl:(NSString *)url;

/// 读取本地图片（如：name = xxx.png）
+ (UIImage *)imageWithBundleName:(NSString *)name;

/// 读取本地图片（如：xxx.png，name = xxx，type = png）
+ (UIImage *)imageWithBundleName:(NSString *)name type:(NSString *)type;
```

``` javascript
/// 图片拉升
- (void)resizableImage;

/// 拉伸图片-指定UIEdgeInsets
- (void)resizableImage:(UIEdgeInsets)edge;

/// 拉伸图片-指定UIEdgeInsets，指定UIImageResizingMode
- (void)resizableImage:(UIEdgeInsets)edge mode:(UIImageResizingMode)mode;
```

``` javascript
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
```

``` javascript
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
```

``` javascript
/// 保存图片到指定路径，是否成功回调
- (void)saveImageWithPath:(NSString *)filePath complete:(void (^)(BOOL isSuccess))complete;

/// 保存图片到手机相册，是否成功回调
- (void)saveImageToPhotosAlbum:(void (^)(BOOL isSuccess))complete;

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
```

``` javascript
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
```

``` javascript
/**
*  获取用户设置的相册图片数组
*
*  @param count   图片数量
*  @param latest  是否最新的图片
*  @param start   开始获取相册图片回调
*  @param success 成功获取相册图片回调
*  @param error   失败回调
*/
+ (void)imagesFromAssetsLibraryWithNum:(NSInteger)count
latest:(BOOL)latest
start:(void(^)(void))start
success:(void(^)(NSArray *images))success
error:(void(^)(void))error;
```

``` javascript
/// UIImage转为灰度图 CGColorSpaceCreateDeviceGray会创建一个设备相关的灰度颜色空间的引用。
- (UIImage *)grayImage;
```

``` javascript
/**
*  图片滤镜处理（同步处理）
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

/**
*  图片滤镜处理-回调（异步处理）
*
*  @param filterName 滤镜名称
*  @param complete   图片滤镜成功后回调处理
*/
- (void)imageFilterWithFilterName:(NSString *)filterName image:(void (^)(UIImage *image))complete;

/**
*  图片模糊处理（同步处理）
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

/**
*  图片模糊处理-回调（异步处理）
*
*  @param blurName 滤镜名称
*  @param radius   滤镜半径
*  @param complete 图片滤镜成功后回调处理
*/
- (void)imageBlurWithBlurName:(NSString *)blurName radius:(NSInteger)radius image:(void (^)(UIImage *image))complete;

/**
*  图片调整（饱和度、亮度、对比度）（同步处理）
*
*  @param saturation 饱和度
*  @param brightness 亮度
*  @param contrast   对比度
*
*  @return 处理后 image 对象
*/
- (UIImage *)imageAdjustWithSaturation:(CGFloat)saturation brightness:(CGFloat)brightness contrast:(CGFloat)contrast;

/**
*  图片调整（饱和度、亮度、对比度）-回调（异步处理）
*
*  @param saturation 饱和度
*  @param brightness 亮度
*  @param contrast   对比度
*  @param complete   图片滤镜成功后回调处理
*/
- (void)imageAdjustWithSaturation:(CGFloat)saturation brightness:(CGFloat)brightness contrast:(CGFloat)contrast image:(void (^)(UIImage *image))complete;
```
