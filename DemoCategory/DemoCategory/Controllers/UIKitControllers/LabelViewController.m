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
    //
    
    //
    UILabel *labelClick = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, scrollview.width - 20, 40)];
    [scrollview addSubview:labelClick];
    labelClick.backgroundColor = UIColor.lightGrayColor;
    NSAttributedString *attributedClick = [[NSAttributedString alloc] initWithString:@"深圳市坪山新区比亚迪"];
    attributedClick = [attributedClick attributedText:@"比亚迪" font:UIFontBoldSize(20) color:UIColor.redColor];
    labelClick.attributedText = attributedClick;
//    [labelClick labelClickAddWithStrings:@[@"比亚迪"] clicked:^(UILabel * _Nonnull label, NSString * _Nonnull string, NSRange range, NSInteger index) {
//        [[[UIAlertView alloc] initWithTitle:string message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"知道了", nil] show];
//    }];
    
    UIView *currentView = labelClick;
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.0, currentView.bottom + 10, 100.0, 100.0)];
    [scrollview addSubview:label];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"圆角边框";
    [label layerWithRadius:10.0 borderColor:[UIColor redColor] borderWidth:5.0];
    label.viewDragEnable(YES);
//    [label setDrapEnable:YES];
    
    currentView = label;
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), (scrollview.width - 10.0 * 2), 100.0)];
    [scrollview addSubview:label2];
    label2.backgroundColor = [UIColor yellowColor];
    label2.font = [UIFont systemFontOfSize:12.0];
    label2.text = @"多行显示：\nUILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 100.0, 100.0)];\n[self.view addSubview:label];\nlabel.backgroundColor = [UIColor greenColor];\nlabel.text = ...;\n[label2 labelAutoSize:SYLabelAutoSizeTypeAll];";
    [label2 labelAutoSize:SYLabelAutoSizeTypeAll];
    
    
    currentView = label2;
    
    UILabel *label22 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), (scrollview.width - 10.0 * 2), 100.0)];
    [scrollview addSubview:label22];
    label22.backgroundColor = [UIColor yellowColor];
    label22.font = [UIFont systemFontOfSize:12.0];
    label22.text = @"请求失败\n网络异常";
    [label22 labelAutoSize:SYLabelAutoSizeTypeAll];
    
    
    currentView = label22;
    
    UILabel *label23 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), (scrollview.width - 10.0 * 2), 100.0)];
    [scrollview addSubview:label23];
    label23.backgroundColor = [UIColor yellowColor];
    label23.font = [UIFont systemFontOfSize:12.0];
    label23.text = @"请求失败，网络异常";
    [label23 labelAutoSize:SYLabelAutoSizeTypeHorizontal];
    
    
    currentView = label23;
    
    
    
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
    
    UILabel *labelLineSpace = [[UILabel alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), (scrollview.width - 10.0 * 2), 60)];
    [scrollview addSubview:labelLineSpace];
    labelLineSpace.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    labelLineSpace.font = [UIFont systemFontOfSize:12.0];
    labelLineSpace.numberOfLines = 0;
    NSAttributedString *attributedLineSpace = [[NSAttributedString alloc] initWithString:@"修改标签栏信息：devZhang。广东省深圳市坪山新区马峦街道办江岭路与比亚迪路红绿灯路口交汇处"];
    attributedLineSpace = [attributedLineSpace attributedText:@"devZhang" font:[UIFont systemFontOfSize:18.0] color:[UIColor redColor]];
    labelLineSpace.attributedText = attributedLineSpace;
    
    currentView = labelLineSpace;
    
    UILabel *labelLineSpace2 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), (scrollview.width - 10.0 * 2), 60)];
    [scrollview addSubview:labelLineSpace2];
    labelLineSpace2.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    labelLineSpace2.font = [UIFont systemFontOfSize:12.0];
    labelLineSpace2.numberOfLines = 0;
    NSAttributedString *attributedLineSpace2 = [[NSAttributedString alloc] initWithString:@"修改标签栏信息：devZhang。广东省深圳市坪山新区马峦街道办江岭路与比亚迪路红绿灯路口交汇处"];
    attributedLineSpace2 = [attributedLineSpace2 attributedText:@"devZhang" font:[UIFont systemFontOfSize:18.0] color:[UIColor redColor]];
    labelLineSpace2.attributedText = attributedLineSpace2;
//    [labelLineSpace2 attributedTextLineSpace:6.0];
    
    currentView = labelLineSpace2;
    
    kSelfWeak;
    
    UILabel *tapSinglelabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), (scrollview.width - 10.0 * 2), 40)];
    [scrollview addSubview:tapSinglelabel];
    tapSinglelabel.backgroundColor = [UIColor brownColor];
    tapSinglelabel.text = @"单击响应";
    [tapSinglelabel tapRecognizer:1 action:^(UITapGestureRecognizer *recognizer) {
        [UIAlertView alertWithTitle:@"label单击事件" message:@"labe被单击了~" cancelButtonTitle:nil otherButtonTitles:@[@"知道了"] controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            if ([buttonTitle isEqualToString:@"知道了"])
            {
                
            }
        } onCancel:^{
            
        }];
    }];
    currentView = tapSinglelabel;
    
    UILabel *tapDoubleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), (scrollview.width - 10.0 * 2), 40)];
    [scrollview addSubview:tapDoubleLabel];
    tapDoubleLabel.backgroundColor = [UIColor brownColor];
    tapDoubleLabel.text = @"双击响应";
    [tapDoubleLabel tapRecognizer:2 action:^(UITapGestureRecognizer *recognizer) {
        [UIAlertView alertWithTitle:@"label双击事件" message:@"labe被双击了~" cancelButtonTitle:nil otherButtonTitles:@[@"知道了"] controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            if ([buttonTitle isEqualToString:@"知道了"])
            {
                
            }
        } onCancel:^{
            
        }];
    }];
    currentView = tapDoubleLabel;
    
    UILabel *longpressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), (scrollview.width - 10.0 * 2), 40)];
    [scrollview addSubview:longpressLabel];
    longpressLabel.backgroundColor = [UIColor brownColor];
    longpressLabel.text = @"长按响应";
    [longpressLabel longPressRecognizer:2.0 action:^(UILongPressGestureRecognizer *recognizer) {
        [UIAlertView alertWithTitle:@"label长按事件" message:@"labe被长按了2秒~" cancelButtonTitle:nil otherButtonTitles:@[@"知道了"] controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            if ([buttonTitle isEqualToString:@"知道了"])
            {
                
            }
        } onCancel:^{
            
        }];
    }];
    currentView = longpressLabel;
    
    UILabel *panLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), (scrollview.width - 10.0 * 2), 40)];
    [scrollview addSubview:panLabel];
    panLabel.backgroundColor = [UIColor brownColor];
    panLabel.text = @"划动响应";
    [panLabel panRecognizer:^(UIPanGestureRecognizer *recognizer) {
        [UIAlertView alertWithTitle:@"label划动事件" message:@"labe被划动了~" cancelButtonTitle:nil otherButtonTitles:@[@"知道了"] controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            if ([buttonTitle isEqualToString:@"知道了"])
            {
                
            }
        } onCancel:^{
            
        }];
    }];
    currentView = panLabel;
    
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), 100.0, 100.0)];
    [scrollview addSubview:label6];
    label6.backgroundColor = [UIColor orangeColor];
    label6.text = @"毛玻璃效果";
    [label6 effectViewWithAlpha:0.4];
    // 边框属性 方法1
//    label6.shapeBorderColor = [UIColor blueColor];
//    label6.shapeBorderWidth = 3.0;
//    label6.shapeBorderDotted = YES;
//    label6.shapeCornerRadius = 5.0;
    // 边框属性 方法2
    [label6 shapeLayerWithRadius:10.0 borderColor:[UIColor redColor] borderWidth:2.0 isDotted:YES];

    currentView = label6;
    
    
    scrollview.contentSize = CGSizeMake(scrollview.width, (currentView.bottom + 10.0));
    
}

@end
