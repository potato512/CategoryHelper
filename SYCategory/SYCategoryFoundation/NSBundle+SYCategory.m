//
//  NSBundle+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2019/3/12.
//  Copyright © 2019年 zhangshaoyu. All rights reserved.
//

#import "NSBundle+SYCategory.h"

@implementation NSBundle (SYCategory)

/// 当前app信息
NSDictionary *appInfo()
{
    return NSBundle.mainBundle.infoDictionary;
}
/// 当前app版本号
NSString *appVersion()
{
    return [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}
/// 当前app build版本号
NSString *appBuildVersion()
{
    return [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleVersion"];
}
/// 当前app标识
NSString *appBundleIdentifier()
{
    return [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}
/// 当前app名称
NSString *appName()
{
    return [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}
/// 当前app bundle名称
NSString *appBundleName()
{
    return [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleName"];
}

/// 获取当前语言
NSString *appLanguage()
{
    return NSLocale.preferredLanguages.firstObject;
}

/// 获取当前设备平台系统版本号
NSString *appPlatformVersion()
{
    return [NSBundle.mainBundle objectForInfoDictionaryKey:@"DTPlatformVersion"];
}
/// 获取当前app支持的最小系统版本号
NSString *appMiniSystemVersion()
{
    return [NSBundle.mainBundle objectForInfoDictionaryKey:@"MinimumOSVersion"];
}

/// 设备类型-模拟器（模拟器，或真机）
BOOL isDeviceSimulator()
{
    return [[NSBundle.mainBundle objectForInfoDictionaryKey:@"DTPlatformName"] isEqualToString:@"iphonesimulator"];
}
/// 设备类型-真机（模拟器，或真机）
BOOL isDevicePhone()
{
    return [[NSBundle.mainBundle objectForInfoDictionaryKey:@"DTPlatformName"] isEqualToString:@"iphoneos"];
}

@end
