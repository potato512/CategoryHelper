//
//  NSStringViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/12/20.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSStringViewController.h"

@interface NSStringViewController ()

@end

@implementation NSStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"字符串";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10.0, 10.0, self.view.width - 10.0 * 2, 80.0)];
    [self.view addSubview:textView];
    [textView layerWithRadius:5.0 borderColor:UIColorRandom borderWidth:1.0];
    textView.textColor = kColorBlack;
    textView.tag = 2000;
    
    
    int rowButton = 3;
    CGFloat origin = 10.0;
    CGFloat widthButton = (self.view.width - (rowButton + 1) * origin) / rowButton;
    CGFloat heightButton = 40.0;
    
    NSArray *array = @[@"UUID", @"IP", @"MD532大写盐值devZhang", @"MD532小写盐值无", @"number16转string", @"首字符", @"用*号隐藏指定位", @"保留任意位小数", @"金额转换显示", @"有效字符", @"非空字符", @"过滤空格字符", @"汉字字符", @"字符长度", @""];
    for (int i = 0; i < array.count; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:button];
        button.frame = CGRectMake((i % rowButton * (widthButton + origin) + origin), (i / rowButton * (heightButton + origin) + (textView.bottom + origin)), widthButton, heightButton);
        button.backgroundColor = [UIColor colorRandom];
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        button.tag = i + 1000;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)buttonClick:(UIButton *)button
{
    UITextView *textView = (UITextView *)[self.view viewWithTag:2000];
    NSString *message = nil;
    
    NSInteger index = button.tag - 1000;
    if (0 == index)
    {
        message = [NSString UUID];
    }
    else if (1 == index)
    {
        message = [NSString IPAddress];
    }
    else if (2 == index)
    {
        if (textView.text && 0 != textView.text.length)
        {
            message = [textView.text MD5With32Bit:YES uppercase:YES salt:@"devZhang"];
        }
    }
    else if (3 == index)
    {
        if (textView.text && 0 != textView.text.length)
        {
            message = [textView.text MD5With32Bit:YES uppercase:NO salt:nil];
        }
    }
    else if (4 == index)
    {
        message = [NSString stringWithNumber:@(16)];
    }
    else if (5 == index)
    {
        message = [@"张devZhang" firstCharacter];
    }
    else if (6 == index)
    {
        message = [@"devZhang" textHiddenWithSymbol:@"+" showBegin:2 showEnd:2];
    }
    else if (7 == index)
    {
        message = [@"12345.5" textKeepDecimalPointWithNumber:10];
    }
    else if (8 == index)
    {
        message = [@"45648782.4578" textMoneySeparatorWithSymbol:@"$"];
    }
    else if (9 == index)
    {
        message = [NSString stringWithFormat:@"%@：%@", @"devZhang", ([NSString isValidNSString:@"devZhang"] ? @"有效" : @"无效")];
    }
    else if (10 == index)
    {
        message = [NSString stringWithFormat:@"%@：%@", @"dev   Zhang", ([NSString isNullNSString:@"dev   Zhang"] ? @"非空有效" : @"非空无效")];
    }
    else if (11 == index)
    {
        message = [NSString stringWithFormat:@"%@：%@", @"dev   Zhang", [@"dev   Zhang" textFilterBlankSpace]];
    }
    else if (12 == index)
    {
        message = [NSString stringWithFormat:@"%@：%@", @"devZhang", ([@"devZhang" isCNNSString] ? @"汉字字符" : @"非汉字字符")];
    }
    else if (13 == index)
    {
        message = [NSString stringWithFormat:@"%@的长度：%@", @"devZhang 张生", @([@"devZhang 张生" textLength:NO])];
    }
    
    textView.text = message;
}


@end
