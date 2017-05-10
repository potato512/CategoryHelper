//
//  NSTimerViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/12/20.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSTimerViewController.h"

@interface NSTimerViewController ()

@property (nonatomic, strong) UILabel *label;
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

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.timer timerKill];
}

- (void)setUI
{
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, (self.view.frame.size.width - 10.0 * 2), 30.0)];
    [self.view addSubview:self.label];
    self.label.backgroundColor = [UIColor colorRandom];
    self.label.textColor = [UIColor colorRandom];
    self.label.textAlignment = NSTextAlignmentCenter;
    
    
    int rowButton = 3;
    CGFloat origin = 10.0;
    CGFloat widthButton = (self.view.width - (rowButton + 1) * origin) / rowButton;
    CGFloat heightButton = 40.0;
    
    NSArray *array = @[@"开始", @"停止"];
    for (int i = 0; i < array.count; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:button];
        button.frame = CGRectMake((i % rowButton * (widthButton + origin) + origin), (i / rowButton * (heightButton + origin) + origin + (self.label.frame.origin.y + self.label.frame.size.height)), widthButton, heightButton);
        button.backgroundColor = [UIColor colorRandom];
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        button.tag = i + 1000;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    
    // 1
//    self.timer = NSTimerInitialize(0.1, self, @selector(countDownTime:), nil, YES);
    
    // 2
//    __block NSInteger number = 0;
//    self.timer = [NSTimer timerWithTimeInterval:0.1 userInfo:nil repeats:YES handle:^(NSTimer *timer) {
//        number++;
//        self.label.text = [NSString stringWithFormat:@"%@", @(number)];
//    }];
    
    // 3
    [NSTimer timerGCDWithTimeInterval:1.0 maxTimerInterval:300 afterTime:0 handle:^(NSInteger remainTime) {
        self.label.text = [NSString stringWithFormat:@"%@", @(remainTime)];
    }];
}

- (void)buttonClick:(UIButton *)button
{
    NSString *title = button.titleLabel.text;
    if ([title isEqualToString:@"开始"])
    {
        // 1、2
        [self.timer timerStart];
    }
    else if ([title isEqualToString:@"停止"])
    {
        // 1、2
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
        self.label.text = [NSString stringWithFormat:@"%@", @(indexCount)];
    }
}

@end
