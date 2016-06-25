//
//  ViewController.m
//  DemoCategory
//
//  Created by herman on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *vcArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"类别";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    self.vcArray = @[[UIViewController class]];
    CGFloat originY = 10.0;
    for (int i = 0; i < self.vcArray.count; i++)
    {
        NSString *title = NSStringFromClass(self.vcArray[i]);
        CGRect rect = CGRectMake(10.0, originY, (CGRectGetWidth(self.view.bounds) - 10.0 * 2), 40.0);
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:button];
        button.frame = rect;
        button.backgroundColor = [UIColor colorWithRed:((arc4random() % 255) / 255.0) green:((arc4random() % 255) / 255.0) blue:((arc4random() % 255) / 255.0) alpha:((arc4random() % 10) / 10.0)];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setTitle:title forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        originY += (40.0 + 10.0);
    }
}

- (void)buttonClick:(UIButton *)button
{
    NSInteger index = button.tag;
    Class class = self.vcArray[index];
    UIViewController *vc = [[class alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
