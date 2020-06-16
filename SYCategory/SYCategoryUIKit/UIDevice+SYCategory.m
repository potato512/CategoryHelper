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
// 获取内存
#include <mach/mach.h>
// 获取设备运营商
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTCellularData.h>
// CPU 类型获取
#import <sys/sysctl.h>
#import <sys/utsname.h>
// 获取ip
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <net/if.h>
//
#import <AdSupport/AdSupport.h>
#import <CoreLocation/CoreLocation.h>
//
#import <SystemConfiguration/SystemConfiguration.h>
#import <SystemConfiguration/CaptiveNetwork.h>
//
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>

@implementation UIDevice (SYCategory)

#pragma mark - 设备操作

/// 打开浏览器
void OpenUrlWithExplorer(NSString *urlStr)
{
    if (urlStr == nil) {
        return;
    }
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

#pragma mark -

/// 设备内部编号
+ (NSString *)deviceMachineNumber
{
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
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

/// 设备CPU个数
+ (NSInteger)deviceCPUNumber
{
    unsigned int ncpu;
    size_t len = sizeof(ncpu);
    sysctlbyname("hw.ncpu", &ncpu, &len, NULL, 0);
    NSInteger cpuNum = ncpu;
    return cpuNum;
}

#pragma mark - 设备系统信息

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

#pragma mark - 设备类型信息

/// 设备型号（如：iPhone, iPod touch）
+ (NSString *)deviceMode
{
    return UIDevice.currentDevice.model;
}

/// 设备机型（如：iPhone4S,iPhoneX等）
+ (NSString *)deviceType
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"])   return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,4"])   return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"])   return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"])   return @"iPhone X";
    if ([platform isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
    if ([platform isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
    if ([platform isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
    if ([platform isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
    if ([platform isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
    if ([platform isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
    if ([platform isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
    
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPod7,1"])      return @"iPod Touch 6G";
    if ([platform isEqualToString:@"iPod9,1"])      return @"iPod Touch 7G";
    
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad 1G";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"])      return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([platform isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([platform isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([platform isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([platform isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    if ([platform isEqualToString:@"iPad6,11"])     return @"iPad 5 (WiFi)";
    if ([platform isEqualToString:@"iPad6,12"])     return @"iPad 5 (Cellular)";
    if ([platform isEqualToString:@"iPad7,1"])      return @"iPad Pro 12.9 inch 2nd gen (WiFi)";
    if ([platform isEqualToString:@"iPad7,2"])      return @"iPad Pro 12.9 inch 2nd gen (Cellular)";
    if ([platform isEqualToString:@"iPad7,3"])      return @"iPad Pro 10.5 inch (WiFi)";
    if ([platform isEqualToString:@"iPad7,4"])      return @"iPad Pro 10.5 inch (Cellular)";
    if ([platform isEqualToString:@"iPad7,5"])      return @"iPad 6th Gen (WiFi)";
    if ([platform isEqualToString:@"iPad7,6"])      return @"iPad 6th Gen (WiFi+Cellular)";
    if ([platform isEqualToString:@"iPad8,1"])      return @"iPad Pro 3rd Gen (11 inch, WiFi)";
    if ([platform isEqualToString:@"iPad8,2"])      return @"iPad Pro 3rd Gen (11 inch, 1TB, WiFi)";
    if ([platform isEqualToString:@"iPad8,3"])      return @"iPad Pro 3rd Gen (11 inch, WiFi+Cellular)";
    if ([platform isEqualToString:@"iPad8,4"])      return @"iPad Pro 3rd Gen (11 inch, 1TB, WiFi+Cellular)";
    if ([platform isEqualToString:@"iPad8,5"])      return @"iPad Pro 3rd Gen (12.9 inch, WiFi)";
    if ([platform isEqualToString:@"iPad8,6"])      return @"iPad Pro 3rd Gen (12.9 inch, 1TB, WiFi)";
    if ([platform isEqualToString:@"iPad8,7"])      return @"iPad Pro 3rd Gen (12.9 inch, WiFi+Cellular)";
    if ([platform isEqualToString:@"iPad8,8"])      return @"iPad Pro 3rd Gen (12.9 inch, 1TB, WiFi+Cellular)";
    if ([platform isEqualToString:@"iPad11,1"])     return @"iPad mini 5th Gen (WiFi)";
    if ([platform isEqualToString:@"iPad11,2"])     return @"iPad mini 5th Gen";
    if ([platform isEqualToString:@"iPad11,3"])     return @"iPad Air 3rd Gen (WiFi)";
    if ([platform isEqualToString:@"iPad11,4"])     return @"iPad Air 3rd Gen";
    
    if ([platform isEqualToString:@"AppleTV2,1"])   return @"Apple TV 2";
    if ([platform isEqualToString:@"AppleTV3,1"])   return @"Apple TV 3";
    if ([platform isEqualToString:@"AppleTV3,2"])   return @"Apple TV 3";
    if ([platform isEqualToString:@"AppleTV5,3"])   return @"Apple TV 4";
    
    if ([platform isEqualToString:@"i386"])         return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"iPhone Simulator";
    // 如果全部匹配不上，则返回原始类型
    return platform;
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

/// 设备地方型号（国际化区域名称）
+ (NSString *)deviceLocalizedModel
{
    return UIDevice.currentDevice.localizedModel;
}

#pragma mark - 电池

/// 设备电池电量
+ (float)batteryLevel
{
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    return UIDevice.currentDevice.batteryLevel;
}

/// 设备电池状态
+ (UIDeviceBatteryState)batteryState
{
    return UIDevice.currentDevice.batteryState;
}

#pragma mark - 内存

/// 设备内存（单位：MB）
+ (CGFloat)deviceTotalMemory
{
    return ceil([NSProcessInfo processInfo].physicalMemory / (1024.0 * 1024.0) * 10) / 10;
}

/// 磁盘内存（单位：MB）
+ (CGFloat)deviceTotalDisk
{
    NSError *error = nil;
    NSDictionary *attrs = [NSFileManager.defaultManager attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) return 0;
    int64_t space =  [[attrs objectForKey:NSFileSystemSize] longLongValue];
    if (space < 0) space = 0;
    return ceil(space / (1024.0 * 1024.0) * 10) / 10;
}

/// 磁盘剩余内存（单位：MB）
+ (CGFloat)deviceFreeDisk
{
    NSError *error = nil;
    NSDictionary *attrs = [NSFileManager.defaultManager attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) return 0;
    int64_t space = [[attrs objectForKey:NSFileSystemFreeSize] longLongValue];
    if (space < 0) space = 0;
    return ceil(space / (1024.0 * 1024.0) * 10) / 10;
}

#pragma mark - 广告

/// IDFA
+ (NSString *)deviceIDFA
{
    return ASIdentifierManager.sharedManager.advertisingIdentifier.UUIDString;
}

#pragma mark - 网络

/// SIM卡的个数
- (int)deviceSIMNumber
{
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    if (@available(iOS 12.0, *)) {
        NSDictionary *ctDict = networkInfo.serviceSubscriberCellularProviders;
        if ([ctDict allKeys].count > 1) {
            NSArray*keys = [ctDict allKeys];
            CTCarrier*carrier1 = [ctDict objectForKey:keys[0]];
            CTCarrier*carrier2 = [ctDict objectForKey:keys[1]];
            if (carrier1.mobileCountryCode.length && carrier2.mobileCountryCode.length) {
                return 2;
            } else if (!carrier1.mobileCountryCode.length && !carrier2.mobileCountryCode.length) {
                return 0;
            } else {
                return 1;
            }
        } else if ([ctDict allKeys].count == 1) {
            NSArray *keys = [ctDict allKeys];
            CTCarrier *carrier1 = [ctDict objectForKey:keys[0]];
            if (carrier1.mobileCountryCode.length) {
                return 1;
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    } else {
        CTCarrier*carrier = [networkInfo subscriberCellularProvider];
        NSString *name = carrier.mobileCountryCode;
        if (name.length) {
            return 1;
        } else {
            return 0;
        }
    }
}

/// SIM卡信息
- (NSDictionary *)deviceSIMInfo
{
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    NSMutableDictionary *simInfo = [NSMutableDictionary dictionary];
    if (@available(iOS 12.0, *)) {
        NSDictionary *ctDict = networkInfo.serviceSubscriberCellularProviders;
        if ([ctDict allKeys].count > 1) {
            NSArray *keys = [ctDict allKeys];
            CTCarrier *carrier1 = [ctDict objectForKey:keys[0]];
            CTCarrier *carrier2 = [ctDict objectForKey:keys[1]];
            if (carrier1.mobileCountryCode.length && carrier2.mobileCountryCode.length) {
                [simInfo setValue:carrier1.mj_keyValues forKey:@"sim1"];
                [simInfo setValue:carrier2.mj_keyValues forKey:@"sim2"];
            } else if(carrier1.mobileCountryCode.length && !carrier2.mobileCountryCode.length) {
                [simInfo setValue:carrier1.mj_keyValues forKey:@"sim1"];
            } else if(!carrier1.mobileCountryCode.length && carrier2.mobileCountryCode.length) {
                [simInfo setValue:carrier2.mj_keyValues forKey:@"sim2"];
            } else {
                [simInfo setDictionary:@{}];
            }
        } else if ([ctDict allKeys].count == 1) {
            NSArray *keys = [ctDict allKeys];
            CTCarrier *carrier1 = [ctDict objectForKey:keys[0]];
            if (carrier1.mobileCountryCode.length) {
                [simInfo setValue:carrier1.mj_keyValues forKey:@"sim1"];
            } else {
                [simInfo setDictionary:@{}];
            }
        } else {
            [simInfo setDictionary:@{}];
        }
    } else {
        CTCarrier *carrier = [networkInfo subscriberCellularProvider];
        NSString *name = carrier.mobileCountryCode;
        if (name.length) {
            [simInfo setValue:carrier.mj_keyValues forKey:@"sim1"];
        } else {
            [simInfo setDictionary:@{}];
        }
    }
    return [simInfo copy];
    
//    #import <CoreTelephony/CTTelephonyNetworkInfo.h>
//    #import <CoreTelephony/CTCarrier.h>
//    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
//    CTCarrier *carrier = [info subscriberCellularProvider];
//        //运营商可用
//    BOOL use = carrier.allowsVOIP;
//        //运营商名字
//    NSString *name = carrier.carrierName;
//        //ISO国家代码
//    NSString *code = carrier.isoCountryCode;
//        //移动国家代码
//    NSString *mcc = [carrier mobileCountryCode];
//        //移动网络代码
//    NSString *mnc = [carrier mobileNetworkCode];
//    NSLog(@"================SIM卡信息================\n运营商可用:%d\n运营商名字:%@\nISO国家代码:%@\n移动国家代码:%@\n移动网络代码:%@\n",use,name,code,mcc,mnc);
}

/// 是否开启WiFi
+ (BOOL)deviceWiFiEnabled
{
    NSCountedSet * cset = [NSCountedSet new];
    struct ifaddrs *interfaces;
    if (!getifaddrs(&interfaces) ) {
        for (struct ifaddrs *interface = interfaces; interface; interface = interface -> ifa_next) {
            if ((interface -> ifa_flags & IFF_UP) == IFF_UP) {
                [cset addObject:[NSString stringWithUTF8String:interface -> ifa_name]];
            }
        }
    }
    return [cset countForObject:@"awdl0"] > 1 ? YES : NO;
}

/// 蜂窝移动网络（-1未知，0关闭，1开启）
+ (void)deviceCellularData:(void (^)(NSInteger status))complete
{
    CTCellularData *cellularData = [[CTCellularData alloc] init];
    // 状态发生变化时调用
    cellularData.cellularDataRestrictionDidUpdateNotifier = ^(CTCellularDataRestrictedState restrictedState) {
        switch (restrictedState) {
            case kCTCellularDataRestrictedStateUnknown: {
                if (complete) {
                    complete(-1);
                }
            } break;
            case kCTCellularDataRestricted: {
                if (complete) {
                    complete(0);
                }
            } break;
            case kCTCellularDataNotRestricted: {
                if (complete) {
                    complete(1);
                }
            } break;
            default: {
                if (complete) {
                    complete(-1);
                }
            } break;
        }
    };
}
/// 是否使用代理
+ (BOOL)deviceIsUseProxy
{
    CFDictionaryRef proxySettings = CFNetworkCopySystemProxySettings();
    NSDictionary *dictProxy = (__bridge  id)proxySettings;
    BOOL isUseProxy = [[dictProxy objectForKey:@"HTTPEnable"] boolValue];
    CFRelease(proxySettings);
    return isUseProxy;
}

/// 获取IP地址
- (NSString *)deviceIPAddress
{
    NSString *adress = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;

    success = getifaddrs(&interfaces);
    if (success == 0) {
        // 将结构体复制给副本temp_addr
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if (temp_addr -> ifa_addr -> sa_family == AF_INET) {
                // check if interface is en0 which is the wifi conection on the iphone
                if ([[NSString stringWithUTF8String:temp_addr -> ifa_name] isEqualToString:@"en0"]) {
                    adress = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr -> ifa_addr) -> sin_addr)];
                }
            }
            temp_addr = temp_addr -> ifa_next;
        }
    }
    freeifaddrs(interfaces);
    return (adress);
}

#pragma mark - 权限

/// 是否有权限访问相册
+ (BOOL)devicePhontEnable
{
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == kCLAuthorizationStatusRestricted || author == kCLAuthorizationStatusDenied) {
        // 无权限
        return NO;
    }
    return YES;
    
 


}

/// 是否支持相机


/// 是否有权限访问相机
+ (BOOL)deviceCameraEnable
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        // 无权限
        return NO;
    }
    return YES;
}

/// 是否支持闪光灯
+ (BOOL)deviceFlashlightEnable
{
    return NO;
}

/// 是否开启定位权限
+ (BOOL)deviceLocation
{
    if([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {

    NSLog(@"没打开");

    }
}

/// 是否有权限使用定位
+ (BOOL)deviceLocationEnable
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (kCLAuthorizationStatusDenied == status || kCLAuthorizationStatusRestricted == status) {
        return NO;
    }
    return YES;
}

/// 网络
+ (BOOL)deviceNetworkEnable
{
    return NO;
}

/// 是否有权限使用推送
+ (BOOL)devicePushEnable
{
    if (UIDevice.iOS8) {
        // iOS8以上包含iOS8
        if (UIApplication.sharedApplication.currentUserNotificationSettings.types == UIUserNotificationTypeNone) {
            return NO;
        }
    } else {
        // ios7 一下
        if (UIApplication.sharedApplication.enabledRemoteNotificationTypes == UIRemoteNotificationTypeNone) {
            return NO;
        }
    }
    return YES;
}

/// 麦克风
+ (BOOL)deviceRecordEnable
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        // 无权限
        return NO;
    }
    return YES;
}

/// 蓝牙
+ (BOOL)deviceBLEEnable
{
    return NO;
}

@end
