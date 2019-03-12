//
//  UIScreen+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2019/3/12.
//  Copyright © 2019年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScreen (SYCategory)

/// 原始大小（如：{320, 568}）
+ (CGSize)originSize;
/// 倍数大小（如：{640, 1136}）
+ (CGSize)nativeSize;

/// 全屏宽度
+ (float)screenWidth;

/// 全屏高度（含状态栏高度、导航栏高度）
+ (float)screenHeight;
/// 全屏高度（含导航栏高度，不含状态栏高度）
+ (float)screenHeightWithoutStausBar;
/// 全屏高度（不含导航栏高度，状态栏高度）
+ (float)screenHeightWithoutStatusBarNavigation;

/// tabbar切换视图控制器高度
+ (float)tabBarHeight;
/// 搜索视图高度
+ (float)searchBarHeight;
/// 状态栏高度
+ (float)statusBarHeight;
/// 导航栏高度
+ (float)navigationHeight;

/// 状态栏顶端安全区域高度（刘海安全区）
+ (float)topSafeHeight;
/// 底端安全区域高度（iPhoneX）
+ (float)bottomSafeHeight;;

@end

NS_ASSUME_NONNULL_END
