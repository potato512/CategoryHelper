//
//  NSBundle+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2019/3/12.
//  Copyright © 2019年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (SYCategory)

/// 当前app信息
NSDictionary *appInfo();
/// 当前app版本号
NSString *appVersion();
/// 当前app build版本号
NSString *appBuildVersion();
/// 当前app标识
NSString *appBundleIdentifier();
/// 当前app名称
NSString *appName();
/// 当前app bundle名称
NSString *appBundleName();

/// 获取当前语言
NSString *appLanguage();

/// 获取当前设备平台系统版本号
NSString *appPlatformVersion();
/// 获取当前app支持的最小系统版本号
NSString *appMiniSystemVersion();

/// 设备类型-模拟器（模拟器，或真机）
BOOL isDeviceSimulator();
/// 设备类型-真机（模拟器，或真机）
BOOL isDevicePhone();

@end

NS_ASSUME_NONNULL_END
