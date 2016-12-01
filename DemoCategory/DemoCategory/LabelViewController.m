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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}

- (void)setUI
{
    CGFloat originY = 10.0;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.0, originY, 100.0, 100.0)];
    [self.view addSubview:label];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"圆角边框";
    [label layerWithRadius:10.0 borderColor:[UIColor redColor] borderWidth:5.0];
    
    
    originY += (label.height + 10.0);
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, originY, (self.view.width - 10.0 * 2), 100.0)];
    [self.view addSubview:label2];
    label2.backgroundColor = [UIColor yellowColor];
    label2.font = kFontWithSize(12.0);
    label2.text = @"多行显示：\nUILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 100.0, 100.0)];\n[self.view addSubview:label];\nlabel.backgroundColor = [UIColor greenColor];\nlabel.text = ...;\n[label2 labelAutoSize:SYLabelAutoSizeTypeAll];";
    [label2 labelAutoSize:SYLabelAutoSizeTypeAll];
    
    
    originY += (label2.height + 10.0);
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, originY, (self.view.width - 10.0 * 2), 30.0)];
    [self.view addSubview:label3];
    label3.backgroundColor = [UIColor purpleColor];
    label3.font = kFontWithSize(12.0);
    label3.text = @"修改标签栏信息：devZhang";
    [label3 labelAttributedText:@"修改标签栏信息" color:label3.textColor font:label3.font space:5.0 rowSpace:0.0];
    [label3 labelAttributedText:@"devZhang" color:[UIColor redColor] font:kFontWithSize(20.0) space:1.0 rowSpace:0.0];
    
    
    originY += (label3.height + 10.0);
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, originY, 80.0, 40.0)];
    [self.view addSubview:label4];
    label4.backgroundColor = [UIColor brownColor];
    label4.text = @"双击响应";
    [label4 tapRecognizer:2 action:^(UITapGestureRecognizer *recognizer) {
        [UIAlertView alertWithTitle:@"label双击事件" message:@"labe被双击了~" cancelButtonTitle:nil otherButtonTitles:@[@"知道了"] controller:self onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            if ([buttonTitle isEqualToString:@"知道了"])
            {
                
            }
        } onCancel:^{
            
        }];
    }];
    
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake((label4.right + 10.0), label4.top, 80.0, 40.0)];
    [self.view addSubview:label5];
    label5.backgroundColor = [UIColor brownColor];
    label5.text = @"长按响应";
    [label5 longPressRecognizer:2.0 action:^(UILongPressGestureRecognizer *recognizer) {
        [UIAlertView alertWithTitle:@"label长按事件" message:@"labe被长按了2秒~" cancelButtonTitle:nil otherButtonTitles:@[@"知道了"] controller:self onDismiss:^(int buttonIndex, NSString *buttonTitle) {
            if ([buttonTitle isEqualToString:@"知道了"])
            {
                
            }
        } onCancel:^{
            
        }];
    }];
    
    
    originY += (label5.height + 10.0);
    
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, originY, 100.0, 100.0)];
    [self.view addSubview:label6];
    label6.backgroundColor = [UIColor orangeColor];
    label6.text = @"毛玻璃效果";
    [label6 effectViewWithAlpha:0.4];

    

}

@end
