# SYCategory
UISlider
 

# 使用
``` javascript
/// 回调方法
@property (nonatomic, copy) SliderClick sliderClick;

/**
*  实例化UISlider
*
*  @param frame       坐标大小
*  @param superview   父视图
*  @param value       当前进度值（默认最小值：0.0；默认最大值：1.0）
*  @param sliderClick 响应事件
*
*  @return UISlider
*/
+ (instancetype)sliderWithFrame:(CGRect)frame view:(UIView *)superview value:(float)value action:(SliderClick)sliderClick;
```
