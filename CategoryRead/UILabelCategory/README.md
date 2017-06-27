# SYCategory
UILabel：自适应宽高、修改内容（指定文字颜色，大小，间距）

# 效果图

![SYCategory_label.gif](./SYCategory_label.gif)

# 使用示例
``` javascript
// 圆角边框属性设置
[label layerWithRadius:10.0 borderColor:[UIColor redColor] borderWidth:5.0];
```

``` javascript
// 根据字符串，自适应宽高设置
[label labelAutoSize:SYLabelAutoSizeTypeAll];
``` 

``` javascript
// 可变字符属性设置
[label labelAttributedText:@"标签栏" color:[UIColor yellowColor] font:[UIFont systemFontOfSize:12.0]];

[label labelAttributedText:@"信息" color:[UIColor brownColor] font:label3.font space:5.0 rowSpace:3.0];
``` 

``` javascript
// 毛玻璃效果
[label effectViewWithAlpha:0.4];
``` 
 