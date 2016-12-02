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
    scrollview.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    CGFloat originXY = 10.0;
    CGFloat sizeImage = 90.0;
    
    // 本地图片-模糊处理
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(originXY, originXY, sizeImage, sizeImage)];
    [scrollview addSubview:imageview];
    imageview.viewText = @"本地图片-模糊";
    imageview.viewTextColor = [UIColor redColor];
    imageview.viewTextFont = [UIFont systemFontOfSize:20.0];
    imageview.image = [UIImage imageNamed:@"image"];
    [imageview effectViewWithAlpha:0.3];
    
    
    UIView *currentView = imageview;
    
    // 本地图片
    UIImageView *imageview2 = [[UIImageView alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, currentView.width, currentView.height)];
    [scrollview addSubview:imageview2];
    imageview2.viewText = @"本地图片";
    imageview2.viewTextRect = CGRectMake(originXY, (imageview2.height - 30.0), (imageview2.width - originXY * 2), 30.0);
    imageview2.viewTextAlignment = NSTextAlignmentRight;
    imageview2.image = [UIImage imageWithBundleName:@"image.png"];
    
    currentView = imageview2;
    
    // 本地图片-灰色处理
    UIImageView *imageview3 = [[UIImageView alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, sizeImage, sizeImage)];
    [scrollview addSubview:imageview3];
    imageview3.viewText = @"本地图片";
    imageview3.image = [UIImage imageWithBundleName:@"image" type:@"png"];
    
    // 颜色图片
    UIImageView *imageview4 = [[UIImageView alloc] initWithFrame:CGRectMake(originXY, (currentView.bottom + originXY), sizeImage, sizeImage)];
    [scrollview addSubview:imageview4];
    imageview4.viewText = @"颜色图片";
    imageview4.image = [UIImage imageWithColor:[UIColor colorRandom] size:CGSizeMake(1.0, 1.0)];
    
    currentView = imageview4;
    
    // 网络图片
    UIImageView *imageview5 = [[UIImageView alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, sizeImage, sizeImage)];
    [scrollview addSubview:imageview5];
    imageview5.viewText = @"网络图片";
    UIImage *image = [UIImage imageWithUrl:@"https://gd4.alicdn.com/imgextra/i2/328015135/TB2AhDMtFXXXXcoXpXXXXXXXXXX_!!328015135.jpg_400x400.jpg"];
    imageview5.image = image;
    
    currentView = imageview5;
    
    // 拉升图片
    UIImageView *imageview6 = [[UIImageView alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, sizeImage, sizeImage)];
    [scrollview addSubview:imageview6];
    imageview6.viewText = @"拉升图片";
    UIImage *image6 = [UIImage imageNamed:@"image"];
//    [image6 resizableImage];
//    [image resizableImage:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
    [image resizableImage:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0) mode:UIImageResizingModeTile];
    imageview6.image = image6;
    
    currentView = imageview5;
    
    // 圆角图片
    UIImageView *imageview7 = [[UIImageView alloc] initWithFrame:CGRectMake(originXY, (currentView.bottom + originXY), sizeImage, sizeImage)];
    [scrollview addSubview:imageview7];
    imageview7.viewText = @"圆角图片-致灰";
    imageview7.viewTextRect = CGRectMake(originXY, (imageview7.height - 20.0), (imageview7.width - originXY * 2), 20.0);
    UIImage *image7 = [image grayImage]; // 致灰
    image7 = [image7 roundedImageWithRadius:50.0]; // 圆角
    imageview7.image = image7;
    
    currentView = imageview7;
    
    // 方形图片
    UIImageView *imageview8 = [[UIImageView alloc] initWithFrame:CGRectMake((currentView.right + originXY), currentView.top, sizeImage, sizeImage)];
    [scrollview addSubview:imageview8];
    imageview8.viewText = @"方形图片";
    imageview8.viewTextRect = CGRectMake(10.0, 10.0, (imageview8.width - 10.0 * 2), 30.0);
    imageview8.viewTextAlignment = NSTextAlignmentLeft;
    UIImage *image8 = [image squareImageWithSize:CGSizeMake(20.0, 20.0)];
    imageview8.image = image8;
    
    
    currentView = imageview8;
    
    
    // 滤镜
    UIScrollView *filterScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, (currentView.bottom + originXY), scrollview.width, (sizeImage + originXY * 2))];
    [scrollview addSubview:filterScrollView];
    filterScrollView.backgroundColor = [UIColor colorRandom];
    for (int i = 0; i < 14; i++)
    {
        UIImageView *subImageview = [[UIImageView alloc] initWithFrame:CGRectMake(originXY + (i * (sizeImage + originXY)), originXY, sizeImage, sizeImage)];
        [filterScrollView addSubview:subImageview];
        [subImageview layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:1.0];
        UIImage *image = [UIImage imageNamed:@"header_girl"];
        switch (i)
        {
            case 0:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectInstant"];
                [image imageFilterWithFilterName:@"CIPhotoEffectInstant" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"怀旧";
            }
                break;
            case 1:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectNoir"];
                [image imageFilterWithFilterName:@"CIPhotoEffectNoir" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"黑白";
            }
                break;
            case 2:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectTonal"];
                [image imageFilterWithFilterName:@"CIPhotoEffectTonal" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"色调";
            }
                break;
            case 3:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectTransfer"];
                [image imageFilterWithFilterName:@"CIPhotoEffectTransfer" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"岁月";
            }
                break;
            case 4:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectMono"];
                [image imageFilterWithFilterName:@"CIPhotoEffectMono" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"单色";
            }
                break;
            case 5:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectFade"];
                [image imageFilterWithFilterName:@"CIPhotoEffectFade" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"裉色";
            }
                break;
            case 6:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectProcess"];
                [image imageFilterWithFilterName:@"CIPhotoEffectProcess" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"冲印";
            }
                break;
            case 7:
            {
//                subImageview.image = [image imageFilterWithFilterName:@"CIPhotoEffectChrome"];
                [image imageFilterWithFilterName:@"CIPhotoEffectChrome" image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"铬黄";
            }
                break;
            case 8:
            {
//                subImageview.image = [image imageBlurWithBlurName:@"CIGaussianBlur" radius:10];
                [image imageBlurWithBlurName:@"CIGaussianBlur" radius:10 image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"高期的模糊";
            }
                break;
            case 9:
            {
//                subImageview.image = [image imageBlurWithBlurName:@"CIBoxBlur" radius:10];
                [image imageBlurWithBlurName:@"CIBoxBlur" radius:10 image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"均值模糊";
            }
                break;
            case 10:
            {
//                subImageview.image = [image imageBlurWithBlurName:@"CIDiscBlur" radius:10];
                [image imageBlurWithBlurName:@"CIDiscBlur" radius:10 image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"环形卷积模糊";
            }
                break;
            case 11:
            {
//                subImageview.image = [image imageBlurWithBlurName:@"CIMedianFilter" radius:10];
                [image imageBlurWithBlurName:@"CIMedianFilter" radius:10 image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"中值模糊";
            }
                break;
            case 12:
            {
//                subImageview.image = [image imageBlurWithBlurName:@"CIMotionBlur" radius:10];
                [image imageBlurWithBlurName:@"CIMotionBlur" radius:10 image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"运动模糊";
            }
                break;
            case 13:
            {
//                subImageview.image = [image imageAdjustWithSaturation:80.0 brightness:60.0 contrast:50.0];
                [image imageAdjustWithSaturation:80.0 brightness:60.0 contrast:50.0 image:^(UIImage *image) {
                    subImageview.image = image;
                }];
                subImageview.viewText = @"饱和度、亮度、对比度";
            }
                break;
                
            default:
                break;
        }
        filterScrollView.contentSize = CGSizeMake((subImageview.right + originXY), filterScrollView.height);
    }
    
    currentView = filterScrollView;
    
    // 可调节
    
    // 相册图片
    UIScrollView *photoScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, (currentView.bottom + originXY), scrollview.width, (sizeImage + originXY * 2))];
    [scrollview addSubview:photoScrollview];
    photoScrollview.backgroundColor = [UIColor colorRandom];
    __block UIView *photoView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, photoScrollview.width, photoScrollview.height)];
    [photoScrollview addSubview:photoView];
    [UIImage imagesFromAssetsLibraryWithNum:10 latest:YES start:^{
        photoView.viewText = @"正在加载图片";
    } success:^(NSArray *images) {
        photoView.viewText = @"";
        for (int i = 0; i < images.count; i++)
        {
            UIImageView *subImageview = [[UIImageView alloc] initWithFrame:CGRectMake(originXY + (i * (sizeImage + originXY)), originXY, sizeImage, sizeImage)];
            [photoScrollview addSubview:subImageview];
            [subImageview layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:1.0];
            subImageview.image = [images objectAtIndex:i];
            
            photoScrollview.contentSize = CGSizeMake((subImageview.right + originXY), filterScrollView.height);
        }
    } error:^{
        photoView.viewText = @"加载图片失败";
    }];
    
    currentView = photoScrollview;
    
    scrollview.contentSize = CGSizeMake(scrollview.width, (currentView.bottom + originXY));
}

@end
