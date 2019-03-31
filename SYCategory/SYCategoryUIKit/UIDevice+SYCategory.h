//
//  UIDevice+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2019/3/12.
//  Copyright © 2019年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (SYCategory)

/// 打开浏览器
void OpenUrlWithExplorer(NSString *urlStr);

/// 拨打电话（拨打完成后是否返回应用）
void PhoneCallWithNumber(NSString *number, BOOL isCanBack);

/// 设备序列号
+ (NSString *)deviceUUID;

/// 设备别名：用户定义的名称（如：My iPhone）
+ (NSString *)deviceName;

/// 设备名称（如：iOS）
+ (NSString *)deviceSystemName;

/// 设备系统版本（如：4.0）
+ (NSString *)deviceSystemVersion;
/// iOS6及以上的系统
+ (BOOL)iOS6;
/// iOS7及以上的系统
+ (BOOL)iOS7;
/// iOS8及以上的系统
+ (BOOL)iOS8;
/// iOS9及以上的系统
+ (BOOL)iOS9;
/// iOS10及以上的系统
+ (BOOL)iOS10;
/// iOS11及以上的系统
+ (BOOL)iOS11;
/// iOS12及以上的系统
+ (BOOL)iOS12;


/// 设备型号（如：iPhone, iPod touch）
+ (NSString *)deviceMode;

/// 设备地方型号（国际化区域名称）
+ (NSString *)deviceLocalizedModel;

/// 设备电池电量
+ (float)batteryLevel;

/// 设备电池状态
+ (UIDeviceBatteryState)batteryState;

/// 设备旋转方向
+ (UIDeviceOrientation)deviceOrientation;

/// 设备类型（如：iPhone, iPad）
+ (UIUserInterfaceIdiom)deviceUserInterfaceIdiom;
/// iPhone设备
+ (BOOL)iPhone;
/// iPad设备
+ (BOOL)iPad;
/// 刘海设备（如：iPhoneX/iPhoneXR/iPhoneXS/iPhoneXSMax）
+ (BOOL)iPhoneWithSaveArea;

#pragma mark - 设备隐私权限

/// 摄像头是否可用
+ (BOOL)isValidCamera;

/// 相册是否可用
+ (BOOL)isValidPhoto;

/// 定位是否可用
+ (BOOL)isValidLocation;

/// 录音是否可用
+ (BOOL)isValidRecorder;

@end

NS_ASSUME_NONNULL_END
