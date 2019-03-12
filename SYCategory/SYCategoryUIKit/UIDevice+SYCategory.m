//
//  UIDevice+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2019/3/12.
//  Copyright © 2019年 zhangshaoyu. All rights reserved.
//

#import "UIDevice+SYCategory.h"
#import "NSURL+SYCategory.h"
#import "NSString+SYCategory.h"

@implementation UIDevice (SYCategory)

/// 打开浏览器
void OpenUrlWithExplorer(NSString *urlStr)
{
    NSURL *url = NSURLFromString(urlStr);
    [[UIApplication sharedApplication] openURL:url];
}

/// 拨打电话（拨打完成后是否返回应用）
void PhoneCallWithNumber(NSString *number, BOOL isCanBack)
{
    NSURL *mobileUrl = [NSURL URLWithString:NSStringFromFormat(@"telprompt://%@", number)];
    if (isCanBack) {
        mobileUrl = [NSURL URLWithString:NSStringFromFormat(@"tel://%@", number)];
    }
    [[UIApplication sharedApplication] openURL:mobileUrl];
}

/// 设备序列号
+ (NSString *)deviceUUID
{
    return UIDevice.currentDevice.identifierForVendor.UUIDString;
}

/// 设备别名：用户定义的名称（如：My iPhone）
+ (NSString *)deviceName
{
    return UIDevice.currentDevice.name;
}

/// 设备名称（如：iOS）
+ (NSString *)deviceSystemName
{
    return UIDevice.currentDevice.systemName;
}

/// 设备系统版本（如：4.0）
+ (NSString *)deviceSystemVersion
{
    return UIDevice.currentDevice.systemVersion;
}
/// iOS6及以上的系统
+ (BOOL)iOS6
{
    return UIDevice.deviceSystemVersion.doubleValue >= 6.0;
}
/// iOS7及以上的系统
+ (BOOL)iOS7
{
    return UIDevice.deviceSystemVersion.doubleValue >= 7.0;
}
/// iOS8及以上的系统
+ (BOOL)iOS8
{
    return UIDevice.deviceSystemVersion.doubleValue >= 8.0;
}
/// iOS9及以上的系统
+ (BOOL)iOS9
{
    return UIDevice.deviceSystemVersion.doubleValue >= 9.0;
}
/// iOS10及以上的系统
+ (BOOL)iOS10
{
    return UIDevice.deviceSystemVersion.doubleValue >= 10.0;
}
/// iOS11及以上的系统
+ (BOOL)iOS11
{
    return UIDevice.deviceSystemVersion.doubleValue >= 11.0;
}
/// iOS12及以上的系统
+ (BOOL)iOS12
{
    return UIDevice.deviceSystemVersion.doubleValue >= 12.0;
}


/// 设备型号（如：iPhone, iPod touch）
+ (NSString *)deviceMode
{
    return UIDevice.currentDevice.model;
}

/// 设备地方型号（国际化区域名称）
+ (NSString *)deviceLocalizedModel
{
    return UIDevice.currentDevice.localizedModel;
}

/// 设备电池电量
+ (float)batteryLevel
{
    return UIDevice.currentDevice.batteryLevel;
}

/// 设备电池状态
+ (UIDeviceBatteryState)batteryState
{
    return UIDevice.currentDevice.batteryState;
}

/// 设备旋转方向
+ (UIDeviceOrientation)deviceOrientation
{
    return UIDevice.currentDevice.orientation;
}

/// 设备类型（如：iPhone, iPad）
+ (UIUserInterfaceIdiom)deviceUserInterfaceIdiom
{
    return UIDevice.currentDevice.userInterfaceIdiom;
}
/// iPhone设备
+ (BOOL)iPhone
{
    return UIDevice.deviceUserInterfaceIdiom == UIUserInterfaceIdiomPhone;
}
/// iPad设备
+ (BOOL)iPad
{
    return UIDevice.deviceUserInterfaceIdiom == UIUserInterfaceIdiomPad;
}
/// 刘海设备（如：iPhoneX/iPhoneXR/iPhoneXS/iPhoneXSMax）
+ (BOOL)iPhoneWithSaveArea
{
    if (@available(iOS 11.0, *)) {
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        if (window.safeAreaInsets.bottom > 0.0) {
            // 是机型iPhoneX/iPhoneXR/iPhoneXS/iPhoneXSMax
            return YES;
        }
    }
    return NO;
}

@end
