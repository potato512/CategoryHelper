//
//  NSFileHandleViewController.m
//  DemoCategory
//
//  Created by herman on 2017/7/1.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "NSFileHandleViewController.h"

@interface NSFileHandleViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSString *filePath;
}

@property (nonatomic, strong) NSArray *array;

@end

@implementation NSFileHandleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"NSFileHandle";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    filePath = [NSFileManager createFileWithFilePath:NSFileManager.cachePath fileName:@"devZhang.txt"];
    NSLog(@"cache path = %@", NSFileManager.cachePath);
    
    self.array = @[@"写入数据到指定位置", @"写入数据到最后的位置", @"读取指定位置的数据", @"读取全文数据", @"复制数据"];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.tableFooterView = [UIView new];
    tableView.delegate = self;
    tableView.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
    }
    
    NSString *text = self.array[indexPath.row];
    cell.textLabel.text = text;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (0 == indexPath.row)
    {
        // 写入数据到指定位置
        NSString *text = @"<--写入数据到36的位置-->";
        [NSFileHandle writeFileWithFilePath:filePath content:text position:36];
    }
    else if (1 == indexPath.row)
    {
        // 写入数据到最后的位置
        NSString *text = @"<--写入数据到最后的位置-->";
        [NSFileHandle writeFileBackWithFilePath:filePath content:text];
    }
    else if (2 == indexPath.row)
    {
        // 读取指定位置的数据
        unsigned long long index = 0;
        NSString *text = [NSFileHandle readFileWithFilePath:filePath position:index length:36];
        NSLog(@"读取到 %lu 位置的数据：%@", (unsigned long)index, text);
    }
    else if (3 == indexPath.row)
    {
        // 读取全文数据
        NSString *text = [NSFileHandle readFileWithFilePath:filePath];
        NSLog(@"读取到全文的数据：%@", text);
    }
    else if (4 == indexPath.row)
    {
        // 复制数据
        NSString *toPath = [NSFileManager createFileWithFilePath:NSFileManager.cachePath fileName:@"copy.txt"];
        [NSFileHandle copyFileWithFilePath:filePath toPath:toPath];
    }
}


@end
