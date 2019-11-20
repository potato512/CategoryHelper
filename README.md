# SYCategory
自定义UIKit、Foundation的类别，以适应在研发过程中常使用到的功能，提高开发效率。


* 使用介绍
  * 自动导入：使用命令`pod 'SYCategory'`导入到项目中
  * 手动导入：或下载源码后，将源码添加到项目中
  
  
# UIKit类别
  * [UILabel：自适应宽高、修改内容（指定文字颜色，大小，间距）](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UILabelCategory)
  * [UIView：原点坐标设置、显示标签（内容，字体大小/颜色，对齐方式）、手势功能、缩放、旋转、翻转](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UIViewCategory)
  * [UIButton：图标对齐方式、倒计时功能、block响应回调](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UIButtonCategory)
  * [UISlider：block响应回调](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UISliderCategory)
  * [UISwitch：block响应回调](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UISwitchCategory)
  * [UISegmentedControl：响应回调](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UISegmentedControlCategory)
  * [UIBarButtonItem：响应回调](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UIBarButtonItemCategory)
  * [UIColor：十六进制颜色、随机颜色](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UIColorCategory)
  * [UIImage：纯色图片、图片拉升、截图、压缩、裁剪、位图处理、滤镜、相册图片、保存](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UIImageCategory)
  * [UIGestureRecognizer：block响应回调](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UIGestureRecognierCategory)
  * [UIViewController：根视图判断、导航栏标题、导航栏视图、导航栏返回按钮、导航栏右按钮](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UIViewControllerCategory)
  * [UINavigationController：导航栏样式](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UINavigationControllerCategory)
  * [UITabBarController：页签样式](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UITabBarControllerCategory)
  * [UIAlertView：block响应回调](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UIAlertViewCategory)
  * [UIActionSheet：block响应回调](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UIAlertViewCategory)
  * [UITextField：输入限制](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UITextFiledCategory)
  * [UITextView：输入限制](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UITextFiledCategory)
  * [UIImagePickerController：block响应回调](https://github.com/potato512/SYCategory/tree/master/CategoryRead/UIImagePickerViewControllerCategory)

# Foundation类别
 * [NSString：其他对象的互换、数字/金额等的处理、特殊字符的限制](https://github.com/potato512/SYCategory/tree/master/CategoryRead/NSStringCategory)
 * [NSFileManager：文件操作、目录操作](https://github.com/potato512/SYCategory/tree/master/CategoryRead/NSFileManagerCategory)
 * [NSAttributedString：副文本字符串处理](https://github.com/potato512/SYCategory/tree/master/CategoryRead/NSAttributedStringCategory)
 * [NSNumber：](https://github.com/potato512/SYCategory/tree/master/CategoryRead/NSNumberCategory)
 * [NSObject：图片类型判断、文本字符宽高计算、结束编辑处理](https://github.com/potato512/SYCategory/tree/master/CategoryRead/NSObjectCategory)
 * [NSArray：异常判断、排序、元素操作](https://github.com/potato512/SYCategory/tree/master/CategoryRead/NSArrayCategory)
 * [NSDictionary：异常判断](https://github.com/potato512/SYCategory/tree/master/CategoryRead/NSDictionaryCategory)
 * [NSTimer：](https://github.com/potato512/SYCategory/tree/master/CategoryRead/NSTimerCategory)
 * [NSURLConnection：请求block回调处理](https://github.com/potato512/SYCategory/tree/master/CategoryRead/NSURLConnectionCategory)
 * [NSDate：日期处理](https://github.com/potato512/SYCategory/tree/master/CategoryRead/NSDateCategory)
 * [NSNotificationCenter：](https://github.com/potato512/SYCategory/tree/master/CategoryRead/NSNotificationCenterCategory)
 * [NSUserDefaults：](https://github.com/potato512/SYCategory/tree/master/CategoryRead/NSUserDefaultsCategory)


# 效果图

![SYCategory.gif](./images/SYCategory.gif)


#### 修改完善
* 20191120
  * 版本号：
  * 修改完善
    * 新增GCD
    
* 20190926
  * 版本号：
  * 修改完善
    * NSAttributedString新增行间距设置
    * 新增UIView动画
    * 新增UILabel点击

* 20190902
  * 版本号：1.3.4
  * 修改完善
    * UILabel+SYClick
    * UIView+SYAnimation
    * NSAttributedString新增+方法
    
* 20190409
  * 版本号：1.3.3
  * 修改完善

* 20190331
  * 版本号：1.3.2
  * 修改完善
    * 完善
      * UIDevice
      
* 20190325
  * 版本号：1.3.1
  * 修改完善
    * 新增
      * UIFont+SYCategory
    * 完善
      * UIColor
      * UIBarButtonItem

* 20190312
  * 版本号：1.2.9 1.3.0
  * 修改完善
    * label多行自适应异常
    * 新增
      * UIDevice+SYCategory
      * NSURL+SYCategory
      * UIScreen+SYCategory
      * NSBundle+SYCategory
    * 完善优化
      * UIBarButtonItem
      * UIColor
      * NSString
      * NSNumber
      * UIImage



* 20180918
  * 版本号：1.2.8
  * UIButton+SYCategory
    * 倒计时定时器优化
    
  * 版本号：1.2.7
  * NSString+SYCategory
    * 字符有效性判断异常修改
  * UIImage+SYQrcode
    * 二维码图片生成
    * 条形码图片生成
  * UIProgressView+SYCategory
    * 添加高度设置属性`heightReal`    


* 20180719
  * 版本号：1.2.6
  * UIColor+SYCategory添加属性
  
  ```
  /// 设置颜色透明度
  - (UIColor *(^)(CGFloat value))colorAlpha;
  ```
  
* 20180716
  * 版本号：1.2.5
  * UITableViewCell+SYCategory添加方法
  
```
/// UITableViewCell复用实例化
+ (UITableViewCell *)dequeueReusableCellWithTable:(UITableView *)table style:(UITableViewCellStyle)style;
```

* 20180713
  * 版本号：1.2.4
  * NSObject+SYCategory添加方法
  
```
/// 实体模型属性打印
- (NSString *)descriptionShow;
```

* 20180514
  * 版本号：1.2.3
  * UIView+SYRecognizer功能完善
  * UIGestureRecognizer+SYCategory功能完善
  
* 20180513
  * 版本号：1.2.2
  * UIView添加类别（手势触摸）
  * UIGestureRecognizer功能屏蔽（存在异常，待完善）
  
* 20180508
  * 版本号：1.2.1
  * NSDate添加方法

~~~ javascript
/// 获取当前时间（指定格式）
+ (NSString *)getTimeOfNower:(NSString *)format;
~~~

* 20180305
  * 版本号：1.2.0
  * 添加类扩展NSPredicate

* 20180207
  * 版本号：1.1.9
  * NSString添加类别
    * NSString+SYUUID
    * NSString+SYHtml
    * NSString+SYNetwork

* 20180130
  * 版本号：1.1.8
  * NSAttributedString添加方法处理html
  * 添加NSString类别，处理html

~~~ javascript
/// html源码转NSAttributedString
- (NSAttributedString *)attributedHtml:(NSString *)html;
~~~ 

~~~ javascript
/// html包含图片
- (BOOL)htmlContantImage;

/// html中图片大小自适应屏幕大小
- (NSString *)htmlStringImageAutoSize;

/// 修改html中图片大小的js代码
- (NSString *)htmlStringJSImageSizeWidth:(float)width;

/// 修改html的文字大小
- (NSString *)htmlStringFontSize:(int)fontsize;

/// 过滤html中的图片数组
- (NSArray *)htmlStringFilterImages;
~~~


* 20180108
  * 版本号：1.1.7
  * NSAttributed下划线/删除线在iOS10.3.1显示异常处理

* 20171226
  * 版本号：1.1.6
  * UIView添加类别（设置状态视图）
  * NSString添加UUID方法
  * UIImagePickerController添加设置导航栏属性、图片编辑方法
  * UITextView屏蔽dealloc方法（避免iOS8.x版本闪退）
  * UITextField屏蔽dealloc方法（避免iOS8.x版本闪退）


* 20171110
  * 版本号：1.1.5
  * view添加字符设置方法：分行、自适应字体大小
  * view添加设置背景图方法

* 20171017
  * 版本号：1.1.4
  * SYCategoryFoundation
    * NSNotificationCenter异常
    
* 20170828
  * 版本号：1.1.3
  * SYCategoryFoundation
    * NSAttributedString修改异常
    * NSMutableArray添加方法
    * NSMutableDictionary添加方法
    * NSMutableString添加方法


~~~ javascript
/// 添加元素（安全的）
- (NSMutableArray *)addObjectSafety:(id)object;

/// 添加元素到指定位置（安全的）
- (NSMutableArray *)insertObjectSafety:(id)object atIndex:(NSInteger)index;

/// 用指定的元素替换指定位置的元素（安全的）
- (NSMutableArray *)replaceObjectSafety:(id)object atIndex:(NSInteger)index;

/// 添加数组中的所有元素（安全的）
- (NSMutableArray *)addObjectsFromArraySafety:(NSArray *)array;
~~~

~~~ javascript
/// 添加指定元素object（安全的）
- (NSMutableDictionary *)setObjectSafety:(id)object forKey:(NSString *)key;

/// 添加指定元素value（安全的）
- (NSMutableDictionary *)setValueSafety:(id)object forKey:(NSString *)key;
~~~

~~~ javascript
/// 重置字符串（安全的）
- (NSMutableString *)setStringSafety:(NSString *)string;

/// 添加字符串（安全的）
- (NSMutableString *)appendStringSafety:(NSString *)string;

/// 插入字符串（安全的）
- (NSMutableString *)indsertStringSafety:(NSString *)string atIndex:(NSInteger)index;

/// 替换字符串（安全的）
- (NSMutableString *)replaceStringSafety:(NSString *)currentString withString:(NSString *)replaceString;
~~~


* 20170824
  * 版本号：1.1.2
  * SYCategoryFoundation
    * NSNumber添加数字转换方法

~~~ javascript
/// 阿拉伯数字转罗马大写（如：1为一）
- (NSString *)numberConvertedUpperRoman;

/// 阿拉伯数字转中文大写（如：1为壹）
- (NSString *)numberConvertedCNCapital;
~~~

* 20170823
  * 版本号：1.1.1
  * SYCategoryFoundation
    * NSDate添加时间差集方法

~~~ javascript
/// 获取任意时间两个时间差集（keySecond秒、keyMinute分、keyHour时、keyDay日、keyMonth月、keyYear年）
+ (NSDictionary *)getTimeDistanceWithTimeInterval:(NSTimeInterval)time endTimeInterval:(NSTimeInterval)endTime;

/// 获取任意时间两个时间差集（keySecond秒、keyMinute分、keyHour时、keyDay日、keyMonth月、keyYear年）
+ (NSDictionary *)getTimeDistanceWithTimeInterval:(NSTimeInterval)time;
~~~

* 20170822
  * 版本号：1.1.0
  * SYCategoryUIKit
    * UIView添加shapeLayer设置边框属性

~~~ javascript
/// 设置UI视图的shape边框属性（圆角、边框颜色、边框大小，是否虚线）
- (void)shapeLayerWithRadius:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)width isDotted:(BOOL)isDotted;

/// 设置视图的shape边框属性-圆角
@property (nonatomic, assign) CGFloat shapeCornerRadius;

/// 设置视图的shape边框属性-边框颜色
@property (nonatomic, strong) UIColor *shapeBorderColor;

/// 设置视图的shape边框属性-边框大小
@property (nonatomic, assign) CGFloat shapeBorderWidth;

/// 设置视图的shape边框属性-是否虚线
@property (nonatomic, assign) BOOL shapeBorderDotted;
~~~

* 20170803
  * NSAttributedString异常修改
  * 版本号：1.0.2

* 20170802
  * NSDate类别功能完善
  * UIView添加视图拖动属性

* 20170726
  * 通知方法完善

* 20170704
  * 添加链式编程属性：
  * UIView/UILabel/UITextField/UITextView/UISlider/UISwitch/UIImageView
  * UIViewController
  * NSMutableArray/NSMutableDictionary/NSAttributedString/NSFileManager/NSString/NSMutableString


* 20170702
  * 添加类别文件：UIDocument+SYCategory（待完善）、NSFileManager+iCloud（待完善）、NSStream+SYCategory（待完善）
  * 完善类型方法：NSFileManger+SYCategory

~~~ javascript
/**
*  指定文件路径的当前层级的文件夹
*
*  @param filePath 文件路径
*
*  @return NSArray
*/
+ (NSArray *)getDirectorysWithFilePath:(NSString *)filePath;

/**
*  指定文件路径的所有层级的文件，子文件
*
*  @param filePath 文件路径
*
*  @return NSArray
*/
+ (NSArray *)getFilesWithFilePath:(NSString *)filePath;
~~~

* 20170701
  * 添加类别文件：NSFileHandle+SYCategory
  * 完善类别方法：NSFileManager+SYCategory

* 20170628
  * UIImage方法修改

~~~ javascript
// 废除：获取图片，根据图片url（如：url = http://.../xxx.jpg）
+ (UIImage *)imageWithUrl:(NSString *)url;

/// 新增：获取图片，根据图片url-缓存功能（如：url = http://.../xxx.jpg）
+ (void)imageWithUrl:(NSString *)url complete:(void ((^)(UIImage *image)))complete;
~~~

* 20170627 
  * UIImage添加纯色生成图片方法

~~~ javascript
/// 生成指定颜色的图片
+ (UIImage *)imageWithColor:(UIColor *)color;
~~~

