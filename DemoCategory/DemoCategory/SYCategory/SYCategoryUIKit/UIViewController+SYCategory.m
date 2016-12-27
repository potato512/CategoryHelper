//
//  UIViewController+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UIViewController+SYCategory.h"
#import <objc/runtime.h>

static NSString *const keyNavigationItemTitle = @"keyNavigationItemTitle";

// 自定义左右导航栏按钮大小
static CGFloat const sizeButton = 20.0;
//static CGFloat const sizeButton = 15.0;

// 高度设置 20 44 64
//static CGFloat const heightStatusbar = 20.0;
//static CGFloat const heightNavigationbar = 44.0;
//static CGFloat const heightStatusAndNavbar = 64.0;
#define widthScreen  [UIScreen mainScreen].applicationFrame.size.width
#define heightScreen [UIScreen mainScreen].applicationFrame.size.height

@interface UIViewController ()

@property (nonatomic, copy) void (^buttonActionClick)(UIBarButtonItem *item);

@end

@implementation UIViewController (SYCategory)

#pragma mark - setter/getter

- (void)setButtonActionClick:(void (^)(UIBarButtonItem *))buttonActionClick
{
    objc_setAssociatedObject(self, @selector(buttonActionClick), buttonActionClick, OBJC_ASSOCIATION_COPY);
}

- (void (^)(UIBarButtonItem *))buttonActionClick
{
    return objc_getAssociatedObject(self, @selector(buttonActionClick));
}

#pragma mark --

/// 是否是根视图
- (BOOL)isRootController
{
    if ([self.navigationController.viewControllers.firstObject isEqual:self])
    {
        return YES;
    }
    
    return NO;
}

#pragma mark - 导航栏设置

#pragma mark 返回上层视图响应

/// 返回上层视图响应
- (void)backPreviousController
{
    if ([self isRootController])
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        if (self.presentedViewController)
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

#pragma mark 导航栏标题

/// 设置导航栏标题视图
- (void)setNavigationTitleView:(UIView *)titleView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, titleView.frame.size.width, titleView.frame.size.height)];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    titleView.autoresizesSubviews = YES;
    self.navigationItem.titleView = view;
    
    titleView.center = view.center;
    [view addSubview:titleView];
}

/// 设置导航栏标题
- (void)setNavigationTitle:(NSString *)title
{
    if (!title || 0 >= title.length)
    {
        title = @"未设置标题";
    }
    // self.navigationItem.title = title;
    [self setNavigationDefaultFontTitle:title];
}

- (void)setNavigationDefaultFontTitle:(NSString *)title
{
    // 系统方法 张绍裕 20150604
    self.navigationItem.title = title;
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:18.0], NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    // 自定义方法
    // UILabel *label = InsertLabel(nil, CGRectMake(0.0, 0.0, 200.0, kNavigationHeight), NSTextAlignmentCenter, title, kFontSizeBold17, UIColorHex(0x000000), NO);
    // self.navigationItem.titleView = label;
}

#pragma mark setter/getter

- (void)setNavigationItemTitle:(NSString *)navigationItemTitle
{
    if (navigationItemTitle)
    {
        objc_setAssociatedObject(self, &keyNavigationItemTitle, navigationItemTitle, OBJC_ASSOCIATION_RETAIN);
        
        self.navigationItem.title = navigationItemTitle;
    }
}

- (NSString *)navigationItemTitle
{
    NSString *object = objc_getAssociatedObject(self, &keyNavigationItemTitle);
    return object;
}

#pragma mark - 导航栏按钮

#pragma mark UIBarButtonItem

/**
 *  UIBarButtonItem实例
 *
 *  @param title  按钮标题
 *  @param target 响应对象
 *  @param action 响应方法
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    return [[UIBarButtonItem alloc] initWithTitle:title
                                            style:UIBarButtonItemStyleDone
                                           target:target
                                           action:action];
}

/**
 *  UIBarButtonItem实例
 *
 *  @param title  按钮标题
 *  @param action 按钮响应方法回调
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)itemWithTitle:(NSString *)title action:(void (^)(UIBarButtonItem *item))action
{
    if (action)
    {
        self.buttonActionClick = [action copy];
    }
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:self action:@selector(buttonAction:)];
    return button;
}

- (void)buttonAction:(UIBarButtonItem *)item
{
    if (self.buttonActionClick)
    {
        self.buttonActionClick(item);
    }
}

#pragma mark 导航栏左按钮

/**
 *  UIBarButtonItem导航栏左按钮（默认图标与标题）
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)leftBarButtonDefault
{
    UIBarButtonItem *item = [self leftBarButtonWithRootControllerName:NO target:self action:@selector(backPreviousController)];
    return item;
}

/**
 *  UIBarButtonItem
 *
 *  @param isRootControllerName 按钮标题：显示根视图控制器名称，或返回
 *  @param target               响应对象
 *  @param action               响应方法
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)leftBarButtonWithRootControllerName:(BOOL)isRootControllerName
                                                  target:(id)target
                                                  action:(SEL)action
{
    NSString *name = @"返回";
    UIImage *image = [UIImage imageNamed:@"SYNavigationBackImage"];
    UIButton *button = [[self class] leftButtonWithName:name nameSel:nil color:[UIColor blackColor] colorHighlight:nil colorSel:nil image:image imageHighlight:nil imageSel:nil bgroundImageNormal:nil bgroundImageHighlight:nil bgroundImageSel:nil style:SYButtonStyleDefault];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if (isRootControllerName)
    {
        if (1 == [self.navigationController.viewControllers indexOfObject:self])
        {
            UIViewController *previousVC = [self.navigationController.viewControllers firstObject];
            name = previousVC.navigationItem.title;
        }
        [button setTitle:name forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0.0, -15.0, 0.0, 0.0);
    }
//    button.imageEdgeInsets = UIEdgeInsetsMake(0.0, (title ? -15.0 : -50.0), 0.0, 0.0);
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

/**
 *  UIBarButtonItem自定义标题、图标
 *
 *  @param title       按钮标题
 *  @param imageNormal 按钮图标
 *  @param target      响应对象
 *  @param action      响应方法
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)leftBarButtonWithTitle:(NSString *)title
                                      image:(UIImage *)imageNormal
                                     target:(id)target
                                     action:(SEL)action
{
    UIButton *button = [self leftButtonWithName:title nameSel:nil color:[UIColor blackColor] colorHighlight:nil colorSel:nil image:imageNormal imageHighlight:nil imageSel:nil bgroundImageNormal:nil bgroundImageHighlight:nil bgroundImageSel:nil style:SYButtonStyleDefault];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

// 设置导航栏左按钮，是否高亮
/**
 *  UIBarButtonItem导航栏左按钮（自定义标题及其高亮颜色，图标）
 *
 *  @param title          按钮标题
 *  @param colorHighlight 按钮标题高亮颜色
 *  @param imageNormal    按钮图标
 *  @param target         响应对象
 *  @param action         响应方法
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)leftBarButtonWithTitle:(NSString *)title
                             colorHighlight:(UIColor *)colorHighlight
                                      image:(UIImage *)imageNormal
                                     target:(id)target
                                     action:(SEL)action
{
    UIButton *button = [self leftButtonWithName:title nameSel:nil color:[UIColor blackColor] colorHighlight:colorHighlight colorSel:nil image:imageNormal imageHighlight:nil imageSel:nil bgroundImageNormal:nil bgroundImageHighlight:nil bgroundImageSel:nil style:SYButtonStyleDefault];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

- (UIButton *)leftButtonWithName:(NSString *)name nameSel:(NSString *)nameSel color:(UIColor *)colorNormal colorHighlight:(UIColor *)colorHighlight colorSel:(UIColor *)colorSel image:(UIImage *)imageNormal imageHighlight:(UIImage *)imageHighlight imageSel:(UIImage *)imageSel bgroundImageNormal:(UIImage *)bgImageNormal bgroundImageHighlight:(UIImage *)bgImageHighlight bgroundImageSel:(UIImage *)bgImageSel style:(SYButtonStyle)style
{
    CGRect buttonFrame;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.accessibilityLabel = @"back";
    // 按钮标题
    if (name && ![name isEqualToString:@""])
    {
        [button setTitle:name forState:UIControlStateNormal];
        if (nameSel && ![nameSel isEqualToString:@""])
        {
            [button setTitle:nameSel forState:UIControlStateSelected];
        }
        button.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
    }
    
    // 按钮标题颜色
    if (colorNormal)
    {
        [button setTitleColor:colorNormal forState:UIControlStateNormal];
    }
    if (colorHighlight)
    {
        [button setTitleColor:colorHighlight forState:UIControlStateHighlighted];
    }
    if (colorSel)
    {
        [button setTitleColor:colorSel forState:UIControlStateSelected];
    }

    // 按钮图标
    if (imageNormal)
    {
        [button setImage:imageNormal forState:UIControlStateNormal];
        
        if (imageHighlight)
        {
            [button setImage:imageHighlight forState:UIControlStateHighlighted];
        }
        if (imageSel)
        {
            [button setImage:imageSel forState:UIControlStateSelected];
        }
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
        {
            buttonFrame = CGRectMake(0.0, 0.0, (sizeButton * imageNormal.size.width / imageNormal.size.height), sizeButton);
//            buttonFrame = CGRectMake(0.0, 0.0, (sizeButton * 3), sizeButton);
        }
        else
        {
            buttonFrame = CGRectMake(0.0, 0.0, (sizeButton * imageNormal.size.width / imageNormal.size.height + sizeButton), sizeButton);
        }
    }
    else
    {
        buttonFrame = CGRectMake(0.0, 0.0, 50.0, sizeButton);
    }
    button.frame = buttonFrame;
    
    // 按钮背景图标
    if (bgImageNormal)
    {
        [button setBackgroundImage:bgImageNormal forState:UIControlStateNormal];
    }
    if (bgImageHighlight)
    {
        [button setBackgroundImage:bgImageHighlight forState:UIControlStateHighlighted];
    }
    if (bgImageSel)
    {
        [button setBackgroundImage:bgImageSel forState:UIControlStateSelected];
    }
    
    // 按钮类型
    [button buttonStyle:style offSet:5.0];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -13, 0, 0);
    }
    return button;
}

#pragma mark 导航栏右按钮

/**
 *  UIBarButtonItem导航栏右按钮（自定义标题-常规/选中，及背景图标）
 *
 *  @param title          按钮标题-常规
 *  @param titleSel       按钮标题-选中
 *  @param imageNormal    按钮背景图标-常规
 *  @param imageHighlight 按钮背景图标-高亮
 *  @param imageSel       按钮背景图标-选中
 *  @param target         响应对象
 *  @param action         响应方法
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)rightBarButtonWithTitle:(NSString *)title
                                    titleSel:(NSString *)titleSel
                                brgoundImage:(UIImage *)imageNormal
                       bgroundImageHighlight:(UIImage *)imageHighlight
                             bgroundImageSel:(UIImage *)imageSel
                                      target:(id)target
                                      action:(SEL)action
{
    UIBarButtonItem *item = [self rightBarButtonWithTitle:title titleSel:titleSel color:[UIColor blackColor] colorSel:nil colorHighlight:nil image:nil imageSel:nil bgroundImage:imageNormal bgroundImageHighlight:imageHighlight bgroundImageSel:imageSel style:SYButtonStyleDefault target:target action:action];
    return item;
}

/**
 *  UIBarButtonItem导航栏右按钮（自定义标题及其高亮颜色，图标）
 *
 *  @param title          按钮标题
 *  @param image          按钮图片
 *  @param colorHighlight 按钮标题高亮颜色
 *  @param target         响应对象
 *  @param action         响应方法
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)rightBarButtonWithTitle:(NSString *)title
                                       image:(UIImage *)image
                                   highlight:(UIColor *)colorHighlight
                                      target:(id)target
                                      action:(SEL)action
{
    UIBarButtonItem *item = [self rightBarButtonWithTitle:title titleSel:nil color:[UIColor blackColor] colorSel:nil colorHighlight:colorHighlight image:image imageSel:nil bgroundImage:nil bgroundImageHighlight:nil bgroundImageSel:nil style:SYButtonStyleDefault target:target action:action];
    
    return item;
}

/**
 *  UIBarButtonItem导航栏右按钮（自定义标题和图标）
 *
 *  @param title     按钮标题
 *  @param image     按钮图标
 *  @param target    响应对象
 *  @param action    响应方法
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)rightBarButtonWithTitle:(NSString *)title
                                       image:(UIImage *)image
                                      target:(id)target
                                      action:(SEL)action
{
    UIBarButtonItem *item = [self rightBarButtonWithTitle:title titleSel:nil color:[UIColor blackColor] colorSel:nil colorHighlight:nil image:image imageSel:nil bgroundImage:nil bgroundImageHighlight:nil bgroundImageSel:nil style:SYButtonStyleDefault target:target action:action];
    return item;
}

/**
 *  UIBarButtonItem导航栏右按钮（自定义多属性）
 *
 *  @param title            按钮标题-常规状态
 *  @param titleSel         按钮标题-选中状态
 *  @param colorNormal      按钮标题颜色-常规状态
 *  @param colorSel         按钮标题颜色-选中状态
 *  @param colorHighlight   按钮标题颜色-高亮状态
 *  @param colorNormal      按钮图标-常规状态
 *  @param colorSel         按钮图标-选中状态
 *  @param bgImageNormal    按钮背景图标-常规状态
 *  @param bgImageHighlight 按钮背景图标-高亮状态
 *  @param bgImageSel       按钮背景图标-选中状态
 *  @param style            按钮类型-图标与标题对齐方式
 *  @param target           响应对象
 *  @param action           响应方法
 *
 *  @return UIBarButtonItem
 */
- (UIBarButtonItem *)rightBarButtonWithTitle:(NSString *)title
                                    titleSel:(NSString *)titleSel
                                       color:(UIColor *)colorNormal
                                    colorSel:(UIColor *)colorSel
                              colorHighlight:(UIColor *)colorHighlight
                                       image:(UIImage *)imageNormal
                                    imageSel:(UIImage *)imageSel
                                bgroundImage:(UIImage *)bgImageNormal
                       bgroundImageHighlight:(UIImage *)bgImageHighlight
                             bgroundImageSel:(UIImage *)bgImageSel
                                       style:(SYButtonStyle)style
                                      target:(id)target
                                      action:(SEL)action
{
    UIButton *button = [self rightButtonWithName:title nameSel:titleSel color:colorNormal colorSel:colorSel colorHighlight:colorHighlight image:imageNormal imageSel:imageSel style:style bgroundImage:bgImageNormal bgroundImageHighlight:bgImageHighlight bgroundImageSel:bgImageSel];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}


- (UIButton *)rightButtonWithName:(NSString *)nameNormal nameSel:(NSString *)nameSel color:(UIColor *)colorNormal colorSel:(UIColor *)colorSel colorHighlight:(UIColor *)colorHighlight image:(UIImage *)imageNormal imageSel:(UIImage *)imageSel style:(SYButtonStyle)style bgroundImage:(UIImage *)bgImageNormal bgroundImageHighlight:(UIImage *)bgImageHighlight bgroundImageSel:(UIImage *)bgImageSel
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 按钮标题名称
    if (nameNormal && ![nameNormal isEqualToString:@""])
    {
        [button setTitle:nameNormal forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        if (nameSel && ![nameSel isEqualToString:@""])
        {
            [button setTitle:nameSel forState:UIControlStateSelected];
        }
    }
    // 按钮标题颜色
    if (colorNormal)
    {
        [button setTitleColor:colorNormal forState:UIControlStateNormal];
    }
    if (colorSel)
    {
        [button setTitleColor:colorSel forState:UIControlStateSelected];
    }
    if (colorHighlight)
    {
        [button setTitleColor:colorHighlight forState:UIControlStateHighlighted];
    }
    
    // 按钮图标
    if (imageNormal)
    {
        // 按钮图标-常规
        [button setImage:imageNormal forState:UIControlStateNormal];
      
        if (imageSel)
        {
            // 按钮图标-选中
            [button setImage:imageSel forState:UIControlStateSelected];
        }
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
        {
            button.frame = CGRectMake(0.0, 0.0, imageNormal.size.width, imageNormal.size.height);
        }
        else
        {
            button.frame = CGRectMake(0.0, 0.0, (imageNormal.size.width + sizeButton), imageNormal.size.height);
        }
    }
    else
    {
        button.frame = CGRectMake(0.0, 0.0, 50.0, sizeButton);
    }
    
    // 按钮背景图标
    if (bgImageNormal)
    {
        [button setBackgroundImage:bgImageNormal forState:UIControlStateNormal];
    }
    if (bgImageHighlight)
    {
        [button setBackgroundImage:bgImageHighlight forState:UIControlStateHighlighted];
    }
    if (bgImageSel)
    {
        [button setBackgroundImage:bgImageSel forState:UIControlStateSelected];
    }
    
    // 按钮类型
    [button buttonStyle:style offSet:5.0];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        button.titleEdgeInsets = UIEdgeInsetsMake(0.0, 13.0, 0.0, 0.0);
    }
    
    return button;
}


@end
