//
//  NSTimerViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/12/20.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSTimerViewController.h"

@interface NSTimerViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation NSTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"NSTimer";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    int rowButton = 3;
    CGFloat origin = 10.0;
    CGFloat widthButton = (self.view.width - (rowButton + 1) * origin) / rowButton;
    CGFloat heightButton = 40.0;
    
    NSArray *array = @[@"开始", @"停止"];
    for (int i = 0; i < array.count; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:button];
        button.frame = CGRectMake((i % rowButton * (widthButton + origin) + origin), (i / rowButton * (heightButton + origin) + origin), widthButton, heightButton);
        button.backgroundColor = [UIColor colorRandom];
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        button.tag = i + 1000;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.timer = NSTimerInitialize(0.1, self, @selector(countDownTime:), nil, YES);
}

- (void)buttonClick:(UIButton *)button
{
    NSString *title = button.titleLabel.text;
    if ([title isEqualToString:@"开始"])
    {
        [self.timer timerStart];
    }
    else if ([title isEqualToString:@"停止"])
    {
        [self.timer timerStop];
    }
}

NSInteger indexCount = 0;
- (void)countDownTime:(NSTimer *)timer
{
    if (indexCount >= 100)
    {
        indexCount = 0;
        [self.timer timerStop];
    }
    else
    {
        indexCount++;
        NSLog(@"index = %@", @(indexCount));
    }
}

@end
