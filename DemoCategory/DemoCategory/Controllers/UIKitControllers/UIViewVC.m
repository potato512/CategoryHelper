//
//  UIViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 2019/9/26.
//  Copyright © 2019 zhangshaoyu. All rights reserved.
//

#import "UIViewVC.h"

@interface UIViewVC ()

@end

@implementation UIViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self coinView];
    [self viewAnimation];
}

- (void)loadView
{
    [super loadView];
    
}

// 创建视图
- (void)coinView
{
//    UIImageView *firstImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"profile.png"]];
//    UIImageView *secondImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"second.jpg"]];
//
//    UIView *coinView = [[UIView alloc] init];
//    coinView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
//    // 方法1
////    [coinView reloadCornView:CGRectMake(50.0, 50.0, 120.0, 120.0) view:self.view duration:1.2 primaryView:firstImageView secondaryView:secondImageView];
//    // 方法2
//    coinView.primaryView = firstImageView;
//    coinView.secondaryView = secondImageView;
//    coinView.durationTime = 0.3;
//    [coinView reloadCornView];
}

- (void)viewAnimation
{
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:scrollView];
//
//    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
//    [scrollView addSubview:view1];
//    view1.backgroundColor = UIColor.yellowColor;
//    [view1 animationSpringStart:20 end:60 animation:YES];
//    UIView *currentView = view1;
//
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(10, currentView.bottom + 10, 60, 60)];
//    [scrollView addSubview:view2];
//    view2.backgroundColor = UIColor.greenColor;
//    [view2 animationScaleWithDuration:0.8 animation:YES];
//    currentView = view2;
//
//    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(10, currentView.bottom + 10, 60, 60)];
//    [scrollView addSubview:view3];
//    view3.backgroundColor = UIColor.orangeColor;
//    [view3 animationRotationWithDuration:1.8 animation:YES];
//    currentView = view3;
//
//    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(10, currentView.bottom + 10, 60, 60)];
//    [scrollView addSubview:view4];
//    view4.backgroundColor = UIColor.redColor;
//    [view4 animationCABasicWithDuration:1.2 rotation:CATransform3DMakeRotation(M_PI, 0.50, -0.50, 0.50) repeat:10 animation:YES];
//    currentView = view4;
//
//    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(10, currentView.bottom + 10, 60, 60)];
//    [scrollView addSubview:view5];
//    view5.backgroundColor = UIColor.blueColor;
//    [view5 animationCATransitionWithDuration:1.2 type:@"pageCurl" subType:@"90cw" funcation:kCAMediaTimingFunctionEaseIn animation:YES];
//    currentView = view5;
//
//    UIView *view6 = [[UIView alloc] initWithFrame:CGRectMake(10, currentView.bottom + 10, 60, 60)];
//    [scrollView addSubview:view6];
//    view6.backgroundColor = UIColor.brownColor;
//    [view6 animationCABasicWithDuration:1.2 path:@"transform.rotation.x" function:kCAMediaTimingFunctionDefault start:[NSValue valueWithCGPoint:CGPointMake(60, 60)] end:[NSValue valueWithCGPoint:CGPointMake(10, 10)] animation:YES];
//    currentView = view6;
//    
//    scrollView.contentSize = CGSizeMake(scrollView.width, currentView.bottom + 10);
}

@end
