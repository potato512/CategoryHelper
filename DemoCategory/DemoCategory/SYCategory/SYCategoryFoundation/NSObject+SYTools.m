//
//  NSObject+SYTools.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSObject+SYTools.h"
#import <ifaddrs.h>
#import <arpa/inet.h>

@implementation NSObject (SYTools)

/**
 *  获取设备 ip 地址
 *
 *  @return ip 地址字符串
 */
+ (NSString *)getIPAddress
{
    NSString *address = nil;
    
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    success = getifaddrs(&interfaces);
    if (0 == success)
    {
        temp_addr = interfaces;
        while (temp_addr != NULL)
        {
            if (temp_addr->ifa_addr->sa_family == AF_INET)
            {
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"])
                {
//                    address = [NSString stringWithUTF8String:inet_ntop(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    freeifaddrs(interfaces);
    
    return address;
}


@end
