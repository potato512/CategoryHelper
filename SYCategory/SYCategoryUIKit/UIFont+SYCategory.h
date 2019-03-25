//
//  UIFont+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2019/3/25.
//  Copyright © 2019年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (SYCategory)

UIFont *UIFontSize(CGFloat size);

UIFont *UIFontBoldSize(CGFloat size);

UIFont *UIFontNameSize(NSString *name, CGFloat size);

@end

NS_ASSUME_NONNULL_END
