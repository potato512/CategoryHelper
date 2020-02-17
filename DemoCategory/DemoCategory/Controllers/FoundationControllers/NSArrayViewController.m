//
//  NSArrayViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/12/20.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSArrayViewController.h"

@interface NSArrayViewController ()

@end

@implementation NSArrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"NSArray";
    
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
    NSMutableArray *array = [NSMutableArray array];
    NSLog(@"array = %@", array);
    array.addObject(@1).addArray(@[@"hello", @"world"]).addArray(@[@"job", @"company"]);
    NSLog(@"array = %@", array);
    array.addArray(@[@"vst", @"ecs"]);
    NSLog(@"array = %@", array);
    array.setOjbectAtIndex(@"set object", 3);
    NSLog(@"array = %@", array);
    array.replaceObjectAtIndex(@"replace object", 3);
    NSLog(@"array = %@", array);
    array.removeTheFirstObject();
    NSLog(@"array = %@", array);
    array.removeTheLastOjbect();
    NSLog(@"array = %@", array);
    array.removeObjectAtIndex(2);
    NSLog(@"array = %@", array);
    array.removeObject(@"vst");
    NSLog(@"array = %@", array);
    array.removeAllObject();
    NSLog(@"array = %@", array);    
}

@end
