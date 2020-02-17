# SYCategory
UIViewController：根视图判断、导航栏标题、导航栏视图、导航栏返回按钮、导航栏右按钮
 

# 使用
``` javascript
/**
*  是否通过点击视图控制器隐藏键盘（默认NO）
*/
@property (nonatomic, assign) BOOL hiddenKeyboard;

/// 是否是根视图
- (BOOL)isRootController;

/// 返回上层视图响应
- (void)backPreviousController;

/// 设置导航栏标题视图
- (void)setNavigationTitleView:(UIView *)titleView;

/// 设置导航栏标题
- (void)setNavigationTitle:(NSString *)title;

/// 导航栏标题
@property (nonatomic, strong) NSString *navigationItemTitle;
```
