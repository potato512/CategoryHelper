# SYCategory
UISwitch
 

# 使用
``` javascript
/// 回调方法
@property (nonatomic, copy) SwitchClick switchClick;

/**
*  实例化UISwitch
*
*  @param frame       坐标大小
*  @param superview   父视图
*  @param isOff       状态开关
*  @param switchClick 响应回调
*
*  @return UISwitch
*/
+ (instancetype)switchWithFrame:(CGRect)frame view:(UIView *)superview status:(BOOL)isOff action:(SwitchClick)switchClick;
```
