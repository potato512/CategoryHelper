//
//  NSURL+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2019/3/12.
//  Copyright © 2019年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (SYCategory)

/// 地址（本地文件，或网络文件）
NSURL *NSURLFromString(NSString *string);

@end

NS_ASSUME_NONNULL_END
