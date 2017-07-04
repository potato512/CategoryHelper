//
//  LabelViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/11/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "LabelViewController.h"

@interface LabelViewController ()

@end

@implementation LabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItemTitle = @"UILabel";
    
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollview];
    scrollview.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 100.0, 100.0)];
    [scrollview addSubview:label];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"圆角边框";
    [label layerWithRadius:10.0 borderColor:[UIColor redColor] borderWidth:5.0];
    
    
    UIView *currentView = label;
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), (scrollview.width - 10.0 * 2), 100.0)];
    [scrollview addSubview:label2];
    label2.backgroundColor = [UIColor yellowColor];
    label2.font = [UIFont systemFontOfSize:12.0];
    label2.text = @"多行显示：\nUILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 100.0, 100.0)];\n[self.view addSubview:label];\nlabel.backgroundColor = [UIColor greenColor];\nlabel.text = ...;\n[label2 labelAutoSize:SYLabelAutoSizeTypeAll];";
    [label2 labelAutoSize:SYLabelAutoSizeTypeAll];
    
    
    currentView = label2;
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), (scrollview.width - 10.0 * 2), 30.0)];
    [scrollview addSubview:label3];
    label3.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    label3.font = [UIFont systemFontOfSize:12.0];
    // 1
//    label3.text = @"修改标签栏信息：devZhang";
//    [label3 labelAttributedText:@"标签栏" color:[UIColor yellowColor] font:[UIFont systemFontOfSize:12.0]];
//    [label3 labelAttributedText:@"信息" color:[UIColor brownColor] font:label3.font space:5.0 rowSpace:0.0];
//    [label3 labelAttributedText:@"devZhang" color:[UIColor redColor] font:[UIFont systemFontOfSize:20.0] space:1.0 rowSpace:0.0];
    // 2
//    NSString *text = @"修改标签栏信息：devZhang";
//    NSRange range = [text rangeOfString:@"devZhang"];
//    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:text];
//    if (range.location != NSNotFound)
//    {
//        // 颜色
//        [attributed addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
//        // 字体
//        [attributed addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20.0] range:range];
//    }
//    label3.attributedText = attributed;
    // 3
    NSAttributedString *attributed = [[NSAttributedString alloc] initWithString:@"修改标签栏信息：devZhang"];
    attributed = [attributed attributedText:@"devZhang" font:[UIFont systemFontOfSize:18.0] color:[UIColor redColor]];
    label3.attributedText = attributed;

    
    currentView = label3;
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), 80.0, 40.0)];
    [scrollview addSubview:label4];
    label4.backgroundColor = [UIColor brownColor];
    label4.text = @"双击响应";
    kSelfWeak;
    [label4 tapRecognizer:2 action:^(UITapGestureRecognizer *recognizer) {
        [UIAlertView alertWithTitle:@"label双击事件" message:@"labe被双击了~" cancelButtonTitle:nil otherButtonTitles:@[@"知道了"] controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            if ([buttonTitle isEqualToString:@"知道了"])
            {
                
            }
        } onCancel:^{
            
        }];
    }];
    
    currentView = label4;
    
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake((label4.right + 10.0), currentView.top, 80.0, 40.0)];
    [scrollview addSubview:label5];
    label5.backgroundColor = [UIColor brownColor];
    label5.text = @"长按响应";
    [label5 longPressRecognizer:2.0 action:^(UILongPressGestureRecognizer *recognizer) {
        [UIAlertView alertWithTitle:@"label长按事件" message:@"labe被长按了2秒~" cancelButtonTitle:nil otherButtonTitles:@[@"知道了"] controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            if ([buttonTitle isEqualToString:@"知道了"])
            {
                
            }
        } onCancel:^{
            
        }];
    }];
    
    
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), 100.0, 100.0)];
    [scrollview addSubview:label6];
    label6.backgroundColor = [UIColor orangeColor];
    label6.text = @"毛玻璃效果";
    [label6 effectViewWithAlpha:0.4];

    currentView = label6;
    
    
    // 链式编程
    [UILabel newUILabel:^(UILabel *label) {
        label.labelFont([UIFont systemFontOfSize:12.0])
        .labelColor([UIColor redColor])
        .labelSuperview(self.view)
        .labelFrame(CGRectMake(10.0, currentView.bottom + 10.0, 120.0, 30.0))
        .labelBackgroundColor([UIColor colorWithWhite:0.5 alpha:0.2])
        .labelAlignment(NSTextAlignmentCenter)
        .labelText(@"链式编程实例化");
    }];
    
    scrollview.contentSize = CGSizeMake(scrollview.width, (currentView.bottom + 10.0));
    
}

@end
