//
//  UIView+Status.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2017/11/20.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Status)

/// 添加状态视图方法及回调 UIActivityIndicatorView
- (void)addStatusActivityViewWithConfigurationHandler:(void (^)(UIActivityIndicatorView *activityView))configurationHandler;

/// 添加状态视图方法及回调 UIImageView UILabel UIButton
- (void)addStatusViewWithConfigurationHandler:(void (^)(UIImageView *imageView, UILabel *label, UIButton *button))configurationHandler click:(void (^)(void))clickHandle;

/// 移动状态视图
- (void)removeStatusView;

@end

/**
使用示例

// 加载指示符
__weak UIViewController *weakSelf = self;
[self.view addStatusActivityViewWithConfigurationHandler:^(UIActivityIndicatorView *activityView) {
    activityView.center = weakSelf.view.center;
    activityView.color = kColorBlue;
    [activityView startAnimating];
}];

// 移动
[self.view removeStatusView];

// 显示状态子视图
__weak UIViewController *weakSelf = self;
[self.view addStatusViewWithConfigurationHandler:^(UIImageView *imageView, UILabel *label, UIButton *button) {
    // imageView属性设置
    imageView.frame = CGRectMake((weakSelf.view.frame.size.width - 150) / 2, (weakSelf.view.frame.size.height - 150 - 30) / 2, 150, 150);
    imageView.image = [UIImage imageNamed:@"loading_no_data"];

    // label属性设置
    label.frame = CGRectMake(20, (imageView.frame.origin.y + imageView.frame.size.height), weakSelf.view.frame.size.width, 30);
    label.textColor = UIColor.blackColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontSize:14];
    label.text = @"请求失败";

    // button属性设置
    button.frame = CGRectMake(20, label.bottom, (label.frame.origin.y + label.frame.size.height), 30);
    [button setTitle:@"重新加载" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
} click:^{
    [weakSelf.view removeStatusView];
    [weakSelf loadData];
}];

*/
