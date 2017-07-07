//
//  NSNotificationViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/12/20.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSNotificationViewController.h"

@interface NSNotificationViewController ()

@end

@implementation NSNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"NSNotification";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    UIButton *button = [[UIButton alloc] init];
    button.viewSuperView(self.view).viewFrame(CGRectMake(10.0, 10.0, (self.view.width - 10.0 * 2), 40.0)).viewBackgroundColor([UIColor colorRandom]);
    [button setTitle:@"发消息" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];

    UILabel *label = [UILabel new];
    label.viewSuperView(self.view).viewFrame(CGRectMake(10.0, button.bottom + 10.0, button.width, 80.0));
    label.labelNumberOfLines(0).viewColorAlpha([UIColor colorRandom], 0.3).viewTag(1000);
    
    
    // 接收消息
    NSString *name = @"personInfo";
    SEL action = @selector(notificationAction:);
//    if ((name && 0 < name.length && [name isKindOfClass:[NSString class]])) {
//        [kNotificationCenter addObserver:self selector:action name:name object:nil];
//    }
    
//    kNotificationCenterReceive(name, self, action);
    
    // 方法1
//    NSNotificationCenterReceive(name, self, action);
    
    // 方法2
    kSelfWeak;
    [[NSNotificationCenter defaultCenter] receiveNotificationWithName:name handle:^(NSNotification *notification) {
        [weakSelf notificationAction:notification];
    }];
}

- (void)buttonClick:(UIButton *)button
{
    // 发消息
    NSString *name = @"personInfo";
    NSDictionary *dict = @{@"name":@"devZhang", @"age":@"30", @"job":@"iOSDev"};
    
//        [kNotificationCenter postNotificationName:name object:nil userInfo:dict];
    
//        kNotificationCenterPost(name, dict);
    
    // 方法1
//        NSNotificationCenterPost(name, dict);
    
    // 方法2
    [[NSNotificationCenter defaultCenter] postNotificationWithName:name userInfo:dict];
}

- (void)notificationAction:(NSNotification *)notification
{
    NSString *name = notification.name;
    NSDictionary *dict = notification.userInfo;
    NSLog(@"name = %@ \n dict = %@", name, dict);
    
    NSMutableString *text = [NSMutableString string];
    for (NSString *key in dict.allKeys)
    {
        NSString *string = [NSString stringWithFormat:@"%@ - %@;", key, [dict objectForKey:key]];
        text.addString(string);
    }
    UILabel *label = (UILabel *)[self.view viewWithTag:1000];
    label.text = text;
}

@end
