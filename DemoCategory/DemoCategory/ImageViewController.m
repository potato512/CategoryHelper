//
//  ImageViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/11/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItemTitle = @"UIImage";
    
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
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollview];
    
    // 本地图片-模糊处理
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 10.0, 100.0, 100.0)];
    [scrollview addSubview:imageview];
    imageview.viewText = @"本地图片-模糊";
    imageview.viewTextColor = [UIColor redColor];
    imageview.viewTextFont = [UIFont systemFontOfSize:20.0];
    imageview.image = [UIImage imageNamed:@"image"];
    [imageview effectViewWithAlpha:0.3];
    
    
    UIView *currentView = imageview;
    
    // 本地图片
    UIImageView *imageview2 = [[UIImageView alloc] initWithFrame:CGRectMake((currentView.right + 10.0), currentView.top, currentView.width, currentView.height)];
    [scrollview addSubview:imageview2];
    imageview2.viewText = @"本地图片";
    imageview2.viewTextRect = CGRectMake(10.0, (imageview2.height - 30.0), (imageview2.width - 10.0 * 2), 30.0);
    imageview2.viewTextAlignment = NSTextAlignmentRight;
    imageview2.image = [UIImage imageWithBundleName:@"image.png"];
    
    currentView = imageview2;
    
    // 本地图片-灰色处理
    UIImageView *imageview3 = [[UIImageView alloc] initWithFrame:CGRectMake((currentView.right + 10.0), currentView.top, 80.0, 80.0)];
    [scrollview addSubview:imageview3];
    imageview3.viewText = @"本地图片";
    imageview3.image = [UIImage imageWithBundleName:@"image" type:@"png"];
    
    // 颜色图片
    UIImageView *imageview4 = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), 60.0, 60.0)];
    [scrollview addSubview:imageview4];
    imageview4.viewText = @"颜色图片";
    imageview4.image = [UIImage imageWithColor:[UIColor colorRandom] size:CGSizeMake(1.0, 1.0)];
    
    currentView = imageview4;
    
    // 网络图片
    UIImageView *imageview5 = [[UIImageView alloc] initWithFrame:CGRectMake((currentView.right + 10.0), currentView.top, 80.0, 80.0)];
    [scrollview addSubview:imageview5];
    imageview5.viewText = @"网络图片";
    UIImage *image = [UIImage imageWithUrl:@"https://gd4.alicdn.com/imgextra/i2/328015135/TB2AhDMtFXXXXcoXpXXXXXXXXXX_!!328015135.jpg_400x400.jpg"];
    imageview5.image = image;
    
    currentView = imageview5;
    
    // 拉升图片
    UIImageView *imageview6 = [[UIImageView alloc] initWithFrame:CGRectMake((currentView.right + 10.0), currentView.top, 100.0, 100.0)];
    [scrollview addSubview:imageview6];
    imageview6.viewText = @"拉升图片";
    UIImage *image6 = [UIImage imageNamed:@"image"];
//    [image6 resizableImage];
//    [image resizableImage:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
    [image resizableImage:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0) mode:UIImageResizingModeTile];
    imageview6.image = image6;
    
    currentView = imageview5;
    
    // 圆角图片
    UIImageView *imageview7 = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), 100.0, 100.0)];
    [scrollview addSubview:imageview7];
    imageview7.viewText = @"圆角图片-致灰";
    imageview7.viewTextRect = CGRectMake(10.0, (imageview7.height - 20.0), (imageview7.width - 10.0 * 2), 20.0);
    UIImage *image7 = [image grayImage]; // 致灰
    image7 = [image7 roundedImageWithRadius:50.0]; // 圆角
    imageview7.image = image7;
    
    currentView = imageview7;
    
    // 方形图片
    UIImageView *imageview8 = [[UIImageView alloc] initWithFrame:CGRectMake((currentView.right + 10.0), currentView.top, 100.0, 100.0)];
    [scrollview addSubview:imageview8];
    imageview8.viewText = @"方形图片";
    imageview8.viewTextRect = CGRectMake(10.0, 10.0, (imageview8.width - 10.0 * 2), 30.0);
    imageview8.viewTextAlignment = NSTextAlignmentLeft;
    UIImage *image8 = [image squareImageWithSize:CGSizeMake(20.0, 20.0)];
    imageview8.image = image8;
    
    
    currentView = imageview8;
    
    scrollview.contentSize = CGSizeMake(scrollview.width, (currentView.bottom + 10.0));
}

@end
