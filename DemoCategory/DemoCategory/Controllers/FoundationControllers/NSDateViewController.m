//
//  NSDateViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/12/20.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSDateViewController.h"

@interface NSDateViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *array;

@end

@implementation NSDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"NSDate";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI
{
    self.array = @[@"时间戳转date", @"周年月日时分秒", @"当前时间", @"日期差"];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (0 == indexPath.row)
    {
        // 时间戳
        NSDate *date = [NSDate getDateWithTimeInterval:1501575885];
        NSString *time = [date getTimeStrWithFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSLog(@"time = %@", time);
        
        NSDate *dateTmp = [NSDate getDateWithFormat:@"yyyy-MM-dd HH:mm:ss" time:time];
        NSLog(@"date = %@, dateTmp = %@", date, dateTmp);
    }
    else if (1 == indexPath.row)
    {
        NSDate *date = [NSDate getDateWithTimeInterval:1501575885];
        NSString *year = [NSString stringWithFormat:@"年:%ld", [date getYearOfDate]];
        NSString *month = [NSString stringWithFormat:@"月:%ld", [date getMonthOfDate]];
        NSString *day = [NSString stringWithFormat:@"日:%ld", [date getDayOfDate]];
        NSString *hour = [NSString stringWithFormat:@"时:%ld", [date getHourOfDate]];
        NSString *minute = [NSString stringWithFormat:@"分:%ld", [date getMinuteOfDate]];
        NSString *second = [NSString stringWithFormat:@"秒:%ld", [date getSecondOfDate]];
        NSString *week = [NSString stringWithFormat:@"周:%@", [date getWeekOfDate]];
        NSLog(@"%@,%@,%@,%@,%@,%@,%@", year, month, day, hour, minute, second, week);
    }
    else if (2 == indexPath.row)
    {
        NSString *time = [NSDate getTimeOfNower];
        NSString *year = [NSString stringWithFormat:@"年:%ld", [NSDate getYearOfNower]];
        NSString *month = [NSString stringWithFormat:@"月:%ld", [NSDate getMonthOfNower]];
        NSString *day = [NSString stringWithFormat:@"日:%ld", [NSDate getDayOfNower]];
        NSString *hour = [NSString stringWithFormat:@"时:%ld", [NSDate getHourOfNower]];
        NSString *minute = [NSString stringWithFormat:@"分:%ld", [NSDate getMinuteOfNower]];
        NSString *second = [NSString stringWithFormat:@"秒:%ld", [NSDate getSecondOfNower]];
        NSString *week = [NSString stringWithFormat:@"周:%@", [NSDate getWeekOfNower]];
        NSLog(@"%@, %@,%@,%@,%@,%@,%@,%@", time, year, month, day, hour, minute, second, week);
        
        time = [NSDate getTimeOfNower:@"yyyy-MM-dd HH:mm:ss"];
        NSLog(@"format time = %@", time);
    }
    else if (3 == indexPath.row)
    {
        NSDate *date01 = [NSDate getDateWithTimeInterval:1498615520];
        NSString *format01 = @"yyyy-MM-dd HH:mm:ss";
        NSString *time01 = [date01 getTimeStrWithFormat:format01];
        NSDate *date02 = [NSDate getDateWithTimeInterval:1501586836];
        NSString *format02 = @"yyyy-MM-dd HH:mm:ss";
        NSString *time02 = [date02 getTimeStrWithFormat:format02];
        NSString *time = [NSDate getTimeStrWithBeginTime:time01 beginTimeFormat:format01 endTime:time02 endTimeFormat:format02];
        NSLog(@"1 time = %@", time);
        time = [NSDate getTimeStrWithBeginDate:date01 endDate:date02];
        NSLog(@"2 time = %@", time);
        
        NSDate *date3 = [NSDate getDateWithDate:date02 day:3 tomorrow:YES];
        NSLog(@"date3 == %@", date3);
        date3 = [NSDate getDateWithDate:date02 day:3 tomorrow:NO];
        NSLog(@"date3 == %@", date3);
        
        
        time = [NSDate getTimeStrFromNowStrWithDay:2 after:YES format:format01];
        NSLog(@"time = %@", time);
        time = [NSDate getTimeStrFromNowStrWithDay:2 after:NO format:format01];
        NSLog(@"time = %@", time);
        
        NSInteger day = [NSDate getDayBetweenDate:date01 endDate:date02];
        NSLog(@"day = %ld", day);
        
        NSTimeInterval second = [NSDate getTimeIntervalBetweenDate:date01 endDate:date02];
        NSLog(@"second = %f", second);
        
        time = [NSDate getTimeStrWithTimeInterval:1501586836];
        NSLog(@"time = %@", time);
        
        time = [NSDate getTimeStrWithTimeInterval:1501586836 mode:SYTimeShowModeDefault];
        NSLog(@"time = %@", time);
        time = [NSDate getTimeStrWithTimeInterval:1501586836 mode:SYTimeShowModeDefaultWithSecond];
        NSLog(@"time = %@", time);
        time = [NSDate getTimeStrWithTimeInterval:1501586836 mode:SYTimeShowModeDayHourMinuteSecond];
        NSLog(@"time = %@", time);
        time = [NSDate getTimeStrWithTimeInterval:1501586836 mode:SYTimeShowModeDayHourMinute];
        NSLog(@"time = %@", time);
        time = [NSDate getTimeStrWithTimeInterval:1501586836 mode:SYTimeShowModeHourMinuteSecond];
        NSLog(@"time = %@", time);
        time = [NSDate getTimeStrWithTimeInterval:1501586836 mode:SYTimeShowModeHourMinute];
        NSLog(@"time = %@", time);

        time = [NSDate getTimestrWithFormatTime:1501586836];
        NSLog(@"time = %@", time);

        
        
        NSInteger distance = [NSDate getTimeDistanceWithTimeInterval:1469860230 mode:SYDistanceModeYear];
        NSLog(@"year = %ld", distance);
        distance = [NSDate getTimeDistanceWithTimeInterval:1469860230 mode:SYDistanceModeMonth];
        NSLog(@"month = %ld", distance);
        distance = [NSDate getTimeDistanceWithTimeInterval:1469860230 mode:SYDistanceModeDay];
        NSLog(@"day = %ld", distance);
        distance = [NSDate getTimeDistanceWithTimeInterval:1469860230 mode:SYDistanceModeHour];
        NSLog(@"hour = %ld", distance);
        distance = [NSDate getTimeDistanceWithTimeInterval:1469860230 mode:SYDistanceModeMinute];
        NSLog(@"minute = %ld", distance);
        distance = [NSDate getTimeDistanceWithTimeInterval:1469860230 mode:SYDistanceModeSecond];
        NSLog(@"second = %ld", distance);
        
        // 2017/8/23 11:39:28——1503459568 2017/08/21 10:20:10——1503282010
        NSDictionary *dict = [NSDate getTimeDistanceWithTimeInterval:1503459568 endTimeInterval:1503282010];
        distance = ((NSNumber *)dict[keyYear]).integerValue;
        NSLog(@"year = %ld", distance);
        distance = ((NSNumber *)dict[keyMonth]).integerValue;
        NSLog(@"month = %ld", distance);
        distance = ((NSNumber *)dict[keyDay]).integerValue;
        NSLog(@"day = %ld", distance);
        distance = ((NSNumber *)dict[keyHour]).integerValue;
        NSLog(@"hour = %ld", distance);
        distance = ((NSNumber *)dict[keyMinute]).integerValue;
        NSLog(@"minute = %ld", distance);
        distance = ((NSNumber *)dict[keySecond]).integerValue;
        NSLog(@"second = %ld", distance);
        
        date01 = [NSDate getDateWithTimeInterval:(1503459568 - 1503282010)];
        distance = date01.getYearOfDate;
        NSLog(@"year = %ld", distance);
        distance = date01.getMonthOfDate;
        NSLog(@"month = %ld", distance);
        distance = date01.getDayOfDate;
        NSLog(@"day = %ld", distance);
        distance = date01.getHourOfDate;
        NSLog(@"hour = %ld", distance);
        distance = date01.getMinuteOfDate;
        NSLog(@"minute = %ld", distance);
        distance = date01.getSecondOfDate;
        NSLog(@"second = %ld", distance);
    }
}

@end
