# SYCategory
UIView：原点坐标设置、显示标签（内容，字体大小/颜色，对齐方式）、手势功能、缩放、旋转、翻转
  
# 使用
``` javascript
/// 移动到指定位置（中心点位置改变）
- (void)moveToPoint:(CGPoint)point;

/// 变换大小（宽高改变）
- (void)scaleToSize:(CGFloat)scale;
```

``` javascript
// 所有UIView的子类都拥有如下属性
/// 标题（默认无）
@property (nonatomic, strong) NSString *viewText;

/// 标题字体颜色（默认黑色）
@property (nonatomic, strong) UIColor *viewTextColor;

/// 标题字体大小（默认12.0）
@property (nonatomic, strong) UIFont *viewTextFont;

/// 标题显示位置（默认居中）
@property (nonatomic, assign) CGRect viewTextRect;

/// 标题显示对齐方式（默认居中）
@property (nonatomic, assign) NSTextAlignment viewTextAlignment;
```

``` javascript
/**
*  毛玻璃效果（注意使用前必须先添加到父视图）
*
*  @param alpha 透明度
*/
- (void)effectViewWithAlpha:(CGFloat)alpha;

/// 设置UI视图的边框属性
- (void)layerWithRadius:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)width;

/// 旋转
- (void)viewTransformWithRotation:(CGFloat)rotation;

/// 缩放
- (void)viewScaleWithSize:(CGFloat)size;

/// 水平，或垂直翻转
- (void)viewFlipType:(ViewFlipType)type;
```

``` javascript
/// 单击，或双击响应
- (void)tapRecognizer:(NSInteger)tapNumber action:(void (^)(UITapGestureRecognizer *recognizer))action;

/// 长按手势（长按时间默认0.5）
- (void)longPressRecognizer:(CFTimeInterval)time action:(void (^)(UILongPressGestureRecognizer *recognizer))action;

/// 拖动手势
- (void)panRecognizer:(void (^)(UIPanGestureRecognizer *recognizer))action;

/// 拿捏手势
- (void)pinchRecognizer:(void (^)(UIPinchGestureRecognizer *recognizer))action;

/// 滑动手势
- (void)swipeRecognizer:(UISwipeGestureRecognizerDirection)direction action:(void (^)(UISwipeGestureRecognizer *recognizer))action;

/// 旋转手势
- (void)rotationRecognizer:(void (^)(UIRotationGestureRecognizer *recognizer))action;
```
