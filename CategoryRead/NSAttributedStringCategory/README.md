# SYCategory
NSAttributedString：副文本字符串处理

# 使用
``` javascript
/**
*  修改NSAttributedString信息（文字大小颜色）
*
*  @param text    需要修改的text
*  @param aFont   字体大小
*  @param aColor  字体颜色
*/
- (NSAttributedString *)attributedText:(NSString *)text font:(UIFont *)aFont color:(UIColor *)aColor;

/**
*  修改NSAttributedString信息（文字大小颜色、字体背景颜色）
*
*  @param text    需要修改的text
*  @param font    字体大小
*  @param color   字体颜色
*  @param bgColor 字体背景颜色
*/
- (NSAttributedString *)attributedText:(NSString *)text font:(UIFont *)font color:(UIColor *)color bgColor:(UIColor *)bgColor;

/**
*  修改NSAttributedString信息（字符间距，行间距，文字大小颜色、字体背景颜色）
*
*  @param text           要修改的文字
*  @param textColor      要修改的文字颜色
*  @param textFont       要修改的文字大小
*  @param characterSpace 字体间距
*  @param rowSpace       行间距
*  @param bgColor        字体背景颜色
*/
- (NSAttributedString *)attributedText:(NSString *)text color:(UIColor *)textColor font:(UIFont *)textFont space:(CGFloat)characterSpace rowSpace:(CGFloat)rowSpace bgColor:(UIColor *)bgColor;

/**
*  修改NSAttributedString信息（删除线或下划线，线条大小颜色，文字大小颜色、字体背景颜色）
*
*  @param text      要修改的文字
*  @param textColor 要修改的文字颜色
*  @param textFont  要修改的文字大小
*  @param delete    是否是删除线（删除线，或下划线）
*  @param type      线条类型（如下划线单线类型：NSUnderlineStyleSingle）
*  @param width     线条大小
*  @param color     线条颜色
*/
- (NSAttributedString *)attributedText:(NSString *)text color:(UIColor *)textColor font:(UIFont *)textFont lineStyle:(BOOL)delete lineType:(NSInteger)type lineWidth:(CGFloat)width lineColor:(UIColor *)color;
```
