//
//  NSAttributedStringVC.m
//  DemoCategory
//
//  Created by zhangshaoyu on 2017/7/7.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "NSAttributedStringVC.h"

@interface NSAttributedStringVC ()

@end

@implementation NSAttributedStringVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"字符属性";
    
    kSelfWeak;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem rightBarButtonItemWithTitle:@"clear" action:^(UIButton *item) {
        
        UITextField *textField = (UITextField *)[weakSelf.view viewWithTag:2001];
        textField.text = nil;
        
        UITextView *textView = (UITextView *)[weakSelf.view viewWithTag:2002];
        textView.text = nil;
    }];
    
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
    
    UILabel *label = [UILabel new];
    label.labelNumberOfLines(0).labelColor([UIColor brownColor]).viewSuperView(self.view).viewFrame(CGRectMake(10.0, button.bottom + 10.0, self.view.width - 10.0 * 2, 80.0)).viewTag(1000);
}

- (void)buttonClick:(UIButton *)button
{
    NSString *text = @"NSAttributedString控制字符的属性变化";
    NSAttributedString *attributed = [[NSAttributedString alloc] initWithString:text];
    attributed = [attributed attributedText:@"Attributed" color:[UIColor brownColor] font:[UIFont systemFontOfSize:10.0] Obliqueness:0.2];
    attributed = [attributed attributedText:@"String" color:[UIColor redColor] font:[UIFont systemFontOfSize:12.0] space:2.0 rowSpace:0.0 bgColor:[UIColor yellowColor]];
    attributed = [attributed attributedText:@"字符" deleteLineColor:[UIColor blueColor] deleteLineType:NSUnderlineStyleSingle];
    attributed = [attributed attributedText:@"属性变化" underLineColor:[UIColor purpleColor] underLineType:NSUnderlineStyleSingle];
    
//    NSAttributedString *attributed = [NSAttributedString]
    
    UILabel *label = (UILabel *)[self.view viewWithTag:1000];
    label.attributedText = attributed;
}

@end
