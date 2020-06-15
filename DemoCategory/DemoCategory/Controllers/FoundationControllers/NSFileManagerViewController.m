//
//  NSFileManagerViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/12/20.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSFileManagerViewController.h"

@interface NSFileManagerViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSString *txtFilePath;
    NSString *tmpTxtFilePath;
    NSString *imageFilePath;
    NSMutableDictionary *fileDict;
}

@property (nonatomic, strong) NSArray *array;

@end

@implementation NSFileManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"NSFileManager";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    fileDict = [NSMutableDictionary dictionary];
    
    self.array = @[@"查看home目录所有文件/文件夹 cahce所有文件、所有文件夹", @"文件是否存在", @"文件夹是否存在", @"新建文件", @"新建文件夹", @"移动文件", @"移动文件夹", @"复制文件", @"复制文件夹", @"重命名文件", @"重命名文件夹", @"删除文件", @"删除文件夹", @"查看文件大小", @"查看文件夹大小", @"查看文件大小Text", @"查看文件夹大小Text", @"查看磁盘空间/可用", @"图片保存", @"图片删除", @"文件写入NSString", @"文件读取NSString", @"文件写入NSArray", @"文件读取NSArray", @"文件写入NSDictionary", @"文件读取NSDictionary", @"文件写入NSData", @"文件读取NSData", @"写入文件删除"];
    
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
        // 查看home目录所有文件/文件夹
//        NSArray *array = [NSFileManager getSubFilesAllWithFilePath:[NSFileManager getHomeDirectoryPath]];
//        NSLog(@"array = %@", array);
//        
//        NSArray *cachesAll = [NSFileManager getSubFilesAllWithFilePath:[NSFileManager getCacheDirectoryPath]];
//        NSLog(@"cachesAll = %@", cachesAll);
//        NSArray *cachesSome = [NSFileManager getSubFilesSomeWithFilePath:[NSFileManager getCacheDirectoryPath]];
//        NSLog(@"cachesSome = %@", cachesSome);
//        NSArray *cacheFiles = [NSFileManager getSubFilesWithFilePath:[NSFileManager getCacheDirectoryPath] isDirectory:NO isAll:YES];
//        NSLog(@"cacheFiles = %@", cacheFiles);
//        NSArray *cacheDirectorys = [NSFileManager getSubFilesWithFilePath:[NSFileManager getCacheDirectoryPath] isDirectory:YES isAll:YES];
//        NSLog(@"cacheDirectorys = %@", cacheDirectorys);
        
        
        NSArray *directory = [NSFileManager getDirectorysWithFilePath:NSFileManager.homePath];
        NSLog(@"directory = %@", directory);
        
        NSArray *files = [NSFileManager getFilesWithFilePath:NSFileManager.homePath];
        NSLog(@"files = %@", files);
        
        BOOL isDirectory = [NSFileManager isDirectory:NSFileManager.homePath];
        NSLog(@"%@ -- %d", NSFileManager.homePath, isDirectory);
        isDirectory = [NSFileManager isDirectory:txtFilePath];
        NSLog(@"%@ -- %d", txtFilePath, isDirectory);
        
    }
    else if (1 == indexPath.row)
    {
        // 文件是否存在
        if (txtFilePath == nil)
        {
            txtFilePath = [NSFileManager newCacheFileNameWithType:@".txt"];
            txtFilePath = [NSFileManager.cachePath stringByAppendingPathComponent:txtFilePath];
        }
        BOOL isExist = [NSFileManager isFileExists:txtFilePath];
        NSLog(@"file exist = %d", isExist);
    }
    else if (2 == indexPath.row)
    {
        // 文件夹是否存在
        if (tmpTxtFilePath == nil)
        {
            tmpTxtFilePath = [NSFileManager newCacheFileNameWithType:@"tmpTxt"];
            tmpTxtFilePath = [NSFileManager.cachePath stringByAppendingPathComponent:tmpTxtFilePath];
        }
        BOOL isExist = [NSFileManager isFileExists:tmpTxtFilePath];
        NSLog(@"directory exist = %d", isExist);
    }
    else if (3 == indexPath.row)
    {
        // 新建文件
        if (txtFilePath == nil)
        {
            txtFilePath = [NSFileManager newCacheFileNameWithType:@".txt"];
            txtFilePath = [NSFileManager.cachePath stringByAppendingPathComponent:txtFilePath];
        }
        txtFilePath = [NSFileManager createFileWithFilePath:txtFilePath fileName:nil];
        NSLog(@"filePath = %@", txtFilePath);
    }
    else if (4 == indexPath.row)
    {
        // 新建文件夹
        if (tmpTxtFilePath == nil)
        {
            tmpTxtFilePath = [NSFileManager newCacheFileNameWithType:@"tmpTxt"];
            tmpTxtFilePath = [NSFileManager.cachePath stringByAppendingPathComponent:tmpTxtFilePath];
        }
        tmpTxtFilePath = [NSFileManager createDirectoryWithFilePath:tmpTxtFilePath fileName:nil];
        NSLog(@"filePath = %@", tmpTxtFilePath);
    }
    else if (5 == indexPath.row)
    {
        // 移动文件
        NSString *filePath = @"moveTxt";
        filePath = [NSFileManager.cachePath stringByAppendingPathComponent:filePath];
        [NSFileManager createDirectoryWithFilePath:filePath fileName:nil];
        filePath = [filePath stringByAppendingPathComponent:[NSFileManager fileNameWithFilePath:txtFilePath]];
        BOOL isMove = [NSFileManager moveFileWithFilePath:txtFilePath toPath:filePath];
        NSLog(@"file isMove = %d", isMove);
    }
    else if (6 == indexPath.row)
    {
        // 移动文件夹
        NSString *filePath = @"moveTmpTxt";
        filePath = [NSFileManager.cachePath stringByAppendingPathComponent:filePath];
        [NSFileManager createDirectoryWithFilePath:filePath fileName:nil];
        filePath = [filePath stringByAppendingPathComponent:[NSFileManager fileNameWithFilePath:tmpTxtFilePath]];
        BOOL isMove = [NSFileManager moveFileWithFilePath:tmpTxtFilePath toPath:filePath];
        NSLog(@"directory isMove = %d", isMove);
    }
    else if (7 == indexPath.row)
    {
        // 复制文件
        NSString *filePath = [NSFileManager newCacheFileNameWithType:@"copyTxt"];
        filePath = [NSFileManager.cachePath stringByAppendingPathComponent:filePath];
        BOOL isCopy = [NSFileManager copyFileWithFilePath:txtFilePath toPath:filePath];
        NSLog(@"file isCopy = %d", isCopy);
    }
    else if (8 == indexPath.row)
    {
        // 复制文件夹
        NSString *filePath = [NSFileManager newCacheFileNameWithType:@"copyTmpTxt"];
        filePath = [NSFileManager.cachePath stringByAppendingPathComponent:filePath];
        BOOL isCopy = [NSFileManager copyFileWithFilePath:tmpTxtFilePath toPath:filePath];
        NSLog(@"directory isCopy = %d", isCopy);
    }
    else if (9 == indexPath.row)
    {
        // 重命名文件
        NSString *name = [NSFileManager newCacheFileNameWithType:@"renameTxt"];
        BOOL isRename = [NSFileManager renameFileWithFilePath:txtFilePath newName:name];
        NSLog(@"file isRename = %d", isRename);
    }
    else if (10 == indexPath.row)
    {
        // 重命名文件夹
        NSString *name = [NSFileManager newCacheFileNameWithType:@"renameTmpTxt"];
        BOOL isRename = [NSFileManager renameFileWithFilePath:tmpTxtFilePath newName:name];
        NSLog(@"directory isRename = %d", isRename);
    }
    else if (11 == indexPath.row)
    {
        // 删除文件
        BOOL isDelete = [NSFileManager deleteFileWithFilePath:txtFilePath];
        NSLog(@"file isDelete = %d", isDelete);
    }
    else if (12 == indexPath.row)
    {
        // 删除文件夹
        BOOL isDelete = [NSFileManager deleteFileWithFilePath:tmpTxtFilePath];
        NSLog(@"directory isDelete = %d", isDelete);
    }
    else if (13 == indexPath.row)
    {
        // 查看文件大小
        CGFloat size = [NSFileManager fileSizeWithFilePath:txtFilePath];
        NSLog(@"file size = %f", size);
    }
    else if (14 == indexPath.row)
    {
        // 查看文件夹大小
        CGFloat size = [NSFileManager fileSizeTotalWithDirectory:tmpTxtFilePath];
        NSLog(@"directory size = %f", size);
    }
    else if (15 == indexPath.row)
    {
        // 查看文件大小Text
        NSString *size = [NSFileManager fileSizeTextWithFilePath:txtFilePath];
        NSLog(@"file size = %@", size);
    }
    else if (16 == indexPath.row)
    {
        // 查看文件夹大小Text
        NSString *size = [NSFileManager fileSizeTotalTextWithDirectory:tmpTxtFilePath];
        NSLog(@"directory size = %@", size);
    }
    else if (17 == indexPath.row)
    {
        // 查看磁盘空间/可用
        NSString *sizeDisk = [NSFileManager sizeTextDiskSpace];
        NSString *sizeFreeDist = [NSFileManager sizeFreeTextDiskSpace];
        NSLog(@"sizeDisk = %@, sizeFreeDist = %@", sizeDisk, sizeFreeDist);
    }
    else if (18 == indexPath.row)
    {
        // 图片保存
        if (imageFilePath == nil)
        {
            imageFilePath = [NSFileManager newCacheFileNameWithType:@".png"];
            imageFilePath = [NSFileManager createFileWithFilePath:NSFileManager.cachePath fileName:imageFilePath];
        }
        BOOL isWrite = [NSFileManager saveCacheFileImage:[UIImage imageNamed:@"girl"] filePath:imageFilePath];
        NSLog(@"image isWrite = %d", isWrite);
    }
    else if (19 == indexPath.row)
    {
        // 图片删除
        BOOL isDelete = [NSFileManager deleteFileWithFilePath:imageFilePath];
        NSLog(@"image isDelete = %d", isDelete);
    }
    else if (20 == indexPath.row)
    {
        // 文件写入NSString
        NSString *filePath = [NSFileManager newCacheFileNameWithType:@".stringTxt"];
        filePath = [NSFileManager createFileWithFilePath:NSFileManager.cachePath fileName:filePath];
        [fileDict setObject:filePath forKey:@"stringTxt"];
        NSString *string = @"devZhang";
        BOOL isWrite = [NSFileManager writeFileWithFilePath:filePath data:string];
        NSLog(@"NSString write = %d", isWrite);
    }
    else if (21 == indexPath.row)
    {
        // 文件读取NSString
        NSString *filePath = [fileDict objectForKey:@"stringTxt"];
        NSData *data = [NSFileManager fileDataWithFilePath:filePath];
        NSLog(@"NSString = %@", data);
    }
    else if (22 == indexPath.row)
    {
        // 文件写入NSArray
        NSString *filePath = [NSFileManager newCacheFileNameWithType:@".arrayTxt"];
        filePath = [NSFileManager createFileWithFilePath:NSFileManager.cachePath fileName:filePath];
        [fileDict setObject:filePath forKey:@"arrayTxt"];
        NSArray *array = @[@"name", @"devZhang"];
        BOOL isWrite = [NSFileManager writeFileWithFilePath:filePath data:array];
        NSLog(@"NSArray write = %d", isWrite);
    }
    else if (23 == indexPath.row)
    {
        // 文件读取NSArray
        NSString *filePath = [fileDict objectForKey:@"arrayTxt"];
        NSData *data = [NSFileManager fileDataWithFilePath:filePath];
        NSLog(@"NSArray = %@", data);
    }
    else if (24 == indexPath.row)
    {
        // 文件写入NSDictionary
        NSString *filePath = [NSFileManager newCacheFileNameWithType:@".dictTxt"];
        filePath = [NSFileManager createFileWithFilePath:NSFileManager.cachePath fileName:filePath];
        [fileDict setObject:filePath forKey:@"dictTxt"];
        NSDictionary *dict = @{@"name":@"devZhang", @"job":@"iOSDev"};
        BOOL isWrite = [NSFileManager writeFileWithFilePath:filePath data:dict];
        NSLog(@"NSDictionary write = %d", isWrite);
    }
    else if (25 == indexPath.row)
    {
        // 文件读取NSDictionary
        NSString *filePath = [fileDict objectForKey:@"dictTxt"];
        NSData *data = [NSFileManager fileDataWithFilePath:filePath];
        NSLog(@"NSDictionary = %@", data);
    }
    else if (26 == indexPath.row)
    {
        // 文件写入NSData
        NSString *filePath = [NSFileManager newCacheFileNameWithType:@".dataTxt"];
        filePath = [NSFileManager createFileWithFilePath:NSFileManager.cachePath fileName:filePath];
        [fileDict setObject:filePath forKey:@"dataTxt"];
        NSData *data = [filePath dataUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"1 NSData = %@", data);
        BOOL isWrite = [NSFileManager writeFileWithFilePath:filePath data:data];
        NSLog(@"NSData write = %d", isWrite);
    }
    else if (27 == indexPath.row)
    {
        // 文件读取NSData
        NSString *filePath = [fileDict objectForKey:@"dataTxt"];
        NSData *data = [NSFileManager fileDataWithFilePath:filePath];
        NSLog(@"2 NSData = %@", data);
    }
    else if (28 == indexPath.row)
    {
        // 写入文件删除
        NSLog(@"1 fileDict = %@", fileDict);
        [NSFileManager deleteCacheFile:fileDict];
        [fileDict removeAllObjects];
        NSLog(@"2 fileDict = %@", fileDict);
    }
}

@end
