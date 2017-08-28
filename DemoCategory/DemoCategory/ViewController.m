//
//  ViewController.m
//  DemoCategory
//
//  Created by herman on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ViewController.h"

#import "SYCategory.h"

#import "LabelViewController.h"
#import "ButtonViewController.h"
#import "ImageViewController.h"
#import "ColorViewController.h"
#import "GestureViewController.h"
#import "AlertSheetViewController.h"
#import "TextFieldViewController.h"
#import "ImagePickerViewController.h"

#import "NSStringViewController.h"
#import "NSAttributedStringVC.h"
#import "NSObjectViewController.h"
#import "NSDataViewController.h"
#import "NSFileManagerViewController.h"
#import "NSFileHandleViewController.h"
#import "NSNumberViewController.h"
#import "NSArrayViewController.h"
#import "NSDictionaryViewController.h"
#import "NSTimerViewController.h"
#import "NSURLConnectionViewController.h"
#import "NSDateViewController.h"
#import "NSNotificationViewController.h"
#import "NSUserDefaultViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSArray *mainArray;
@property (nonatomic, strong) NSArray *controllers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"category";
    [self setNavigationButton];
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

- (void)setNavigationButton
{
    kSelfWeak;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem leftBarButtonItemWithTitle:@"click" action:^(UIButton *item) {
//        [UIAlertView alertWithTitle:@"温馨提示" message:@"item弹窗" cancelButtonTitle:@"取消" otherButtonTitles:@[@"知道了", @"明白了"] controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
//            NSLog(@"点击了：%@", ([buttonTitle isEqualToString:@"明白了"] ? @"明白了" : @"知道了"));
//        } onCancel:^{
//            NSLog(@"点击了：取消");
//        }];
        

        
    }];
    
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem rightBarButtonItemWithImage:[UIImage imageNamed:@"header_boy"] action:^(UIButton *item) {
//        [UIAlertView alertWithTitle:@"温馨提示" message:@"item弹窗" cancelButtonTitle:@"取消" otherButtonTitles:@[@"知道了", @"明白了"] controller:weakSelf onDismiss:^(int buttonIndex, NSString *buttonTitle) {
//            NSLog(@"点击了：%@", ([buttonTitle isEqualToString:@"明白了"] ? @"明白了" : @"知道了"));
//        } onCancel:^{
//            NSLog(@"点击了：取消");
//        }];
//    }];
}

- (void)setUI
{
    self.mainArray = @[@[@"UILabel", @"UIButton/UISlider/UISwitch/UISegmentControl", @"UIImage", @"UIColor", @"UIGestureRecognizer", @"UIAlertView/UIActionSheet", @"UITextField/UITextView", @"UIImagePickerViewController"], @[@"NSString", @"NSAttributedStringVC", @"NSObject", @"NSData", @"NSFileManager", @"NSFileHandle", @"NSNumber", @"NSArray", @"NSDictionary", @"NSTimer", @"NSURLConnection", @"NSDate", @"NSNotificationCenter", @"NSUserDefaults"]];
    self.controllers = @[@[[LabelViewController class], [ButtonViewController class], [ImageViewController class], [ColorViewController class], [GestureViewController class], [AlertSheetViewController class], [TextFieldViewController class], [ImagePickerViewController class]], @[[NSStringViewController class], [NSAttributedStringVC class], [NSObjectViewController class], [NSDataViewController class], [NSFileManagerViewController class], [NSFileHandleViewController class], [NSNumberViewController class], [NSArrayViewController class], [NSDictionaryViewController class], [NSTimerViewController class], [NSURLConnectionViewController class], [NSDateViewController class], [NSNotificationViewController class], [NSUserDefaultViewController class]]];
    
    self.mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.mainTableView];
    self.mainTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.mainArray.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = (0 == section ? @"UIKit" : @"UIFoundation");
    return title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.mainArray[section];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
    }
    
    NSArray *array = self.mainArray[indexPath.section];
    NSString *text = array[indexPath.row];
    cell.textLabel.text = text;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSArray *array = self.controllers[indexPath.section];
    Class class = array[indexPath.row];
    UIViewController *nextVC = [[class alloc] init];    
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
