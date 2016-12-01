//
//  ImagePickerViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/11/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ImagePickerViewController.h"

@interface ImagePickerViewController ()

@end

@implementation ImagePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItemTitle = @"UIImagePickerController";
    
    UIBarButtonItem *item01 = [self rightBarButtonWithTitle:@"photo" image:nil target:self action:@selector(photoClick:)];
    UIBarButtonItem *item02 = [self rightBarButtonWithTitle:@"camera" image:nil target:self action:@selector(cameraClick:)];
    self.navigationItem.rightBarButtonItems = @[item01, item02];
    
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
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 10.0, self.view.width - 10.0 * 2, self.view.height - 10.0 * 2)];
    [self.view addSubview:imageview];
    imageview.backgroundColor = [UIColor colorRandom];
    imageview.tag = 1000;
    imageview.autoresizingMask = UIViewAutoresizingFlexibleHeight;
}

- (void)cameraClick:(UIBarButtonItem *)item
{
    [UIImagePickerController pickerImageWithType:UIImagePickerControllerSourceTypeCamera target:self complete:^(UIImage *image) {
        if (image)
        {
            UIImageView *imageview = (UIImageView *)[self.view viewWithTag:1000];
            imageview.image = image;
        }
        else
        {
            NSLog(@"未成功获取到相片");
        }
    } photosAlbum:YES saveStart:^{
        NSLog(@"正在保存图片");
    } saveFinish:^(SavePhotoStatus status) {
        NSLog(@"图片保存：%@", (SavePhotoSuccess == status ? @"成功" : @"失败"));
    }];
}

- (void)photoClick:(UIBarButtonItem *)item
{
    [UIImagePickerController pickerImageWithType:UIImagePickerControllerSourceTypePhotoLibrary target:self complete:^(UIImage *image) {
        if (image)
        {
            UIImageView *imageview = (UIImageView *)[self.view viewWithTag:1000];
            imageview.image = image;
        }
        else
        {
            NSLog(@"未成功获取到相片");
        }
    } photosAlbum:YES saveStart:^{
        NSLog(@"正在保存图片");
    } saveFinish:^(SavePhotoStatus status) {
        NSLog(@"图片保存：%@", (SavePhotoSuccess == status ? @"成功" : @"失败"));
    }];
}

@end
