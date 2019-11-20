//
//  UIScreen+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2019/3/12.
//  Copyright © 2019年 zhangshaoyu. All rights reserved.
//

#import "UIScreen+SYCategory.h"

@implementation UIScreen (SYCategory)

/// 原始大小（如：{320, 568}）
+ (CGSize)originSize
{
    return UIScreen.mainScreen.bounds.size;
}
/// 倍数大小（如：{640, 1136}）
+ (CGSize)nativeSize
{
    return UIScreen.mainScreen.nativeBounds.size;
}

/// 全屏宽度
+ (float)screenWidth
{
    return UIScreen.mainScreen.bounds.size.width;
}

/// 全屏高度（含状态栏高度、导航栏高度）
+ (float)screenHeight
{
    return UIScreen.mainScreen.bounds.size.height;
}
/// 全屏高度（含导航栏高度，不含状态栏高度）
+ (float)screenHeightWithoutStausBar
{
    return UIScreen.mainScreen.applicationFrame.size.height;
}
/// 全屏高度（不含导航栏高度，状态栏高度）
+ (float)screenHeightWithoutStatusBarNavigation
{
    return UIScreen.screenHeightWithoutStausBar - UIScreen.navigationHeight;
}

/// tabbar切换视图控制器高度 49
+ (float)tabBarHeight
{
    UITabBarController *tab = [UITabBarController new];
    return tab.tabBar.frame.size.height;
}
/// 搜索视图高度 45
+ (float)searchBarHeight
{
    return 45.0;
}
/// 状态栏高度 20/44
+ (float)statusBarHeight
{
    return UIScreen.mainScreen.applicationFrame.origin.y;
}
/// 导航栏高度 44
+ (float)navigationHeight
{
    UINavigationController *control = [UINavigationController new];
    return control.navigationBar.frame.size.height;
}
/// 状态栏顶端安全区域高度（刘海安全区 44）
+ (float)topSafeHeight
{
    return UIScreen.statusBarHeight;
}
/// 底端安全区域高度（iPhoneX 34）
+ (float)bottomSafeHeight
{
    return 34.0;
}

@end
