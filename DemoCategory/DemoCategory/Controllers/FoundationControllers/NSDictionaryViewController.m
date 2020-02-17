//
//  NSDictionaryViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/12/20.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSDictionaryViewController.h"

@interface NSDictionaryViewController ()

@end

@implementation NSDictionaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"NSDictionary";
    
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
    [button setTitle:@"test" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick:(UIButton *)button
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict.addObject(@"devZhang",@"name").addObject(@"iOS Dev", @"job");
    NSLog(@"dict = %@", dict);
    dict.removeOjbectForKey(@"job");
    NSLog(@"dict = %@", dict);
    dict.addObject(@"hello world", @"name");
    NSLog(@"dict = %@", dict);
    dict.removeAllObject();
    NSLog(@"dict = %@", dict);
}

@end
