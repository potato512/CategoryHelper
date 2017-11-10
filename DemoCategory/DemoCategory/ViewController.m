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
        
        [weakSelf numberMethord];
        
//        [weakSelf timeCountDown];
    }];
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

#pragma mark - 

- (void)numberMethord
{
    NSLog(@"<--------三角函数-------->");
    // 三角函数
    // 反余弦函数: y = acosf(x)
    NSLog(@"反余弦函数: y = arccos(x) = %f", acosf(189.32));
    // 反正弦函数：y = asinf(x)
    NSLog(@"反正弦函数: y = asinf(x) = %f", asinf(189.32));
    // 反正切函数： y = atanf(x)
    NSLog(@"反正切函数： y = atanf(x) = %f", atanf(189.32));
    // 2个参数的反正切函数：z = atan2f(y, x)
    NSLog(@"2个参数的反正切函数：z = atan2f(y, x) = %f", atan2f(189.32, 56.33));
    // 余弦函数: y = cosf(x)
    NSLog(@"余弦函数: y = cosf(x) = %f", cosf(189.32));
    // 正弦函数：y = sinf(x)
    NSLog(@"正弦函数：y = sinf(x) = %f", sinf(189.32));
    // 正切函数：y = tanf(x)
    NSLog(@"正切函数：y = tanf(x) = %f", tanf(189.32));
    
    
    NSLog(@"<--------双曲函数-------->");
    // 双曲函数
    // 反双曲余弦函数：y = acoshf(x)
    NSLog(@"反双曲余弦函数：y = acoshf(x) = %f", acoshf(189.32));
    // 反双曲正弦函数：y = asinhf(x)
    NSLog(@"反双曲正弦函数：y = asinhf(x) = %f", asinhf(189.32));
    // 反双曲正切函数：y = atanhf(x)
    NSLog(@"反双曲正切函数：y = atanhf(x) = %f", atanhf(189.32));
    // 双曲余弦函数：y = coshf(x)
    NSLog(@"双曲余弦函数：y = coshf(x) = %f", coshf(189.32));
    // 双曲正弦函数：y = sinhf(x)
    NSLog(@"双曲正弦函数：y = sinhf(x) = %f", sinhf(189.32));
    // 双曲正切函数： y = tanhf(x)
    NSLog(@"双曲正切函数： y = tanhf(x) = %f", tanhf(189.32));
    
    
    NSLog(@"<--------指数函数-------->");
    // 指数函数
    // 自然常数e为基数的指数函数：y = e^x
    NSLog(@"自然常数e为基数的指数函数：y = e^x = %f", expf(189.32));
    // 自然常数e为基数的指数减1：y = e^x - 1
    NSLog(@"自然常数e为基数的指数减1：y = e^x - 1 = %f", expm1f(189.32));
    // 2为基数的指数函数：y = 2^x
    NSLog(@"2为基数的指数函数：y = 2^x = %f", exp2f(189.32));
    // 浮点数构造函数： y = x * 2^n
    NSLog(@"浮点数构造函数： y = x * 2^n = %f", ldexpf(189.32, 4));
    // 以FLT_RADIX基数的浮点数构造函数：y = x * FLT_RADIX^n
    NSLog(@"以FLT_RADIX基数的浮点数构造函数：y = x * FLT_RADIX^n = %f", scalbnf(189.32, 4));
    
    
    NSLog(@"<--------对数函数-------->");
    // 对数函数
    // 自然常数e为基数的对数函数：y = ln(x)
    NSLog(@"自然常数e为基数的对数函数：y = ln(x) = %f", logf(189.32));
    // 自然常数e为基数的对数函数： y = ln(x + 1)
    NSLog(@"自然常数e为基数的对数函数： y = ln(x + 1) = %f", log1pf(189.32));
    // 10为基数的对数函数：y = log10(x)
    NSLog(@"10为基数的对数函数：y = log10(x) = %f", log10f(189.32));
    // 2为基数的对数函数1：y = log2(x)
    NSLog(@"2为基数的对数函数1：y = log2(x) = %f", log2f(189.32));
    // FLT_RADIX为基数的对数函数并取整：y = floor(log2(x))
    NSLog(@"FLT_RADIX为基数的对数函数并取整：y = floor(log2(x)) = %f", logbf(189.32));
    // FLT_RADIX为基数的对数函数并取整：y = floor(log2(x))
    NSLog(@"FLT_RADIX为基数的对数函数并取整：y = floor(log2(x)) = %d", ilogbf(189.32));
    
    
    NSLog(@"<--------绝对值函数-------->");
    // 绝对值函数
    // 取绝对值函数：y = |x|
    NSLog(@"取绝对值函数：y = |x| = %f", fabsf(-189.32));
    
    
    NSLog(@"<--------幂函数-------->");
    // 幂函数
    // 平方根函数：y = √x
    NSLog(@"平方根函数：y = √x = %f", sqrtf(153.76));
    // 立方根函数： y = ?x
    NSLog(@"立方根函数： y = ?x = %f", cbrtf(189.32));
    // 幂函数：z = x ^ y
    NSLog(@"幂函数：z = x ^ y = %f", powf(10, 4));
    // 欧几里得距离函数： d =√x^2+y^2
    NSLog(@"欧几里得距离函数： d =√x^2+y^2 = %f", hypotf(189.32, 100));
    
    
    NSLog(@"<--------误差函数-------->");
    // 误差函数
    // 误差函数
    NSLog(@"误差函数 = %f", erff(103.21));
    // 互补误差函数
    NSLog(@"互补误差函数 = %f", erfcf(103.21));
    
    
    NSLog(@"<--------伽玛函数-------->");
    // 伽玛函数
    // 伽玛函数 ：y = ????(x)
    NSLog(@"伽玛函数 ：y = ????(x) = %f", lgammaf(103.21));
    // 阶乘函数：y = (x-1)!
    NSLog(@"阶乘函数：y = (x-1)! = %f", tgammaf(103.21));


    NSLog(@"<--------取整函数-------->");
    // 取整函数
    // 返回一个大于等于x的最小整数 double y = ceil(x * 0.5) / 0.5
    NSLog(@"返回一个大于等于x的最小整数 double y = ceil(x * 0.5) / 0.5 = %f", ceilf(103.21596));
    // 返回一个小于等于x的最大整数 double y = floor(x * 0.5) / 0.5
    NSLog(@"返回一个小于等于x的最大整数 double y = floor(x * 0.5) / 0.5 = %f", floorf(103.21596));
    // 返回一个最接近x的整数
    NSLog(@"返回一个最接近x的整数 = %f", nearbyintf(103.21596));
    // 对x进行四舍五入取整
    NSLog(@"对x进行四舍五入取整 = %f", roundf(103.21596));

    
    NSLog(@"<--------数字拆分-------->");
    // 数字拆分
    // 返回浮点数x的整数部分
    NSLog(@"返回浮点数x的整数部分 = %f", truncf(103.21596));
    // 如果我们要实现保留N位小数的截取时。我们可以用如下的方法实现： double y = trunc(x * pow(10, N)) / pow(10, N)
    NSLog(@"保留N位小数的截取 double y = trunc(x * pow(10, N)) / pow(10, N) = %f", (truncf(103.21596 * pow(10, 2)) / pow(10, 2)));
    // 返回x/y的余数1： z = mod(x, y)
    NSLog(@"返回x/y的余数1： z = mod(x, y) = %f", fmodf(100, 30));
    // 返回x/y的余数2： z = mod(x, y)
    NSLog(@"返回x/y的余数2： z = mod(x, y) = %f", remainderf(100, 30));
    // 返回x/y的余数和整数商
    int quo;
    NSLog(@"返回x/y的余数和整数商 = %f, %d", remquof(100, 30, &quo), quo);
    // 分解出x的整数和小数部分
    float pModff;
    NSLog(@"分解出x的整数和小数部分 = %f, %f", modff(103.21596, &pModff), pModff);
    // 分解出x的指数和尾数部分
    int pFrexpf;
    NSLog(@"分解出x的指数和尾数部分 = %f, %d", frexpf(103.21596, &pFrexpf), pFrexpf);

    
    
    NSLog(@"<--------符号改变-------->");
    // 符号改变
    // 将y的符号赋值给x并返回具有和y相同符号的x值
    NSLog(@"将y的符号赋值给x并返回具有和y相同符号的x值 = %f", copysignf(103.21596, 11.22));
    
    
    
    NSLog(@"<--------符号改变-------->");
    // 无效数字定义
    // 生成一个quient NAN浮点数
    char *tagp = "103.545";
    NSLog(@"生成一个quient NAN浮点数 = %f", nanf(tagp));
    
    
    
    NSLog(@"<--------递增函数-------->");
    // 递增函数
    // 返回x在y方向上的下一个可表示的浮点数。
    NSLog(@"返回x在y方向上的下一个可表示的浮点数。 = %f", nextafterf(11.22, 22.33));
    NSLog(@"返回x在y方向上的下一个可表示的浮点数。 = %f", nextafter(11.22, 22.33));
    NSLog(@"返回x在y方向上的下一个可表示的浮点数。 = %Lf", nextafterl(11.22, 22.33));
    NSLog(@"返回x在y方向上的下一个可表示的浮点数。 = %f", nexttoward(11.22, 22.33));
    NSLog(@"返回x在y方向上的下一个可表示的浮点数。 = %f", nexttowardf(11.22, 22.33));
    NSLog(@"返回x在y方向上的下一个可表示的浮点数。 = %Lf", nexttowardl(11.22, 22.33));
    
    
    
    NSLog(@"<--------比较函数-------->");
    // 比较函数
    // 返回x减去y的差如果x>y，否则返回0
    NSLog(@"返回x减去y的差如果x>y，否则返回0 = %f", fdimf(11.22, 22.33));
    NSLog(@"返回x减去y的差如果x>y，否则返回0 = %f", fdim(11.22, 22.33));
    NSLog(@"返回x减去y的差如果x>y，否则返回0 = %Lf", fdiml(11.22, 22.33));
    
    // 返回x和y中大的数字： z = max(x,y)
    NSLog(@"返回x和y中大的数字： z = max(x,y) = %f", fmaxf(11.22, 22.33));
    NSLog(@"返回x和y中大的数字： z = max(x,y) = %f", fmax(11.22, 22.33));
    NSLog(@"返回x和y中大的数字： z = max(x,y) = %Lf", fmaxl(11.22, 22.33));

    // 返回x和y中小的数字： z = min(x,y)
    NSLog(@"返回x和y中小的数字： z = min(x,y) = %f", fminf(11.22, 22.33));
    NSLog(@"返回x和y中小的数字： z = min(x,y) = %f", fmin(11.22, 22.33));
    NSLog(@"返回x和y中小的数字： z = min(x,y) = %Lf", fminl(11.22, 22.33));
    
    
    
    NSLog(@"<--------浮点乘加运算-------->");
    // 浮点乘加运算
    // 浮点乘加运算：w = x*y + z
    NSLog(@"浮点乘加运算：w = x*y + z = %f", fmaf(11.22, 22.33, 2.5));
    NSLog(@"浮点乘加运算：w = x*y + z = %f", fma(11.22, 22.33, 2.5));
    NSLog(@"浮点乘加运算：w = x*y + z = %Lf", fmal(11.22, 22.33, 2.5));
}


- (void)timeCountDown
{
    // 得到当前时间
    NSDate *nowData = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *endData = [dateFormatter dateFromString:@"2017-11-30 00:00:00"];

    NSCalendar *chineseClendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    NSUInteger unitFlags = (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);
    NSDateComponents *components = [chineseClendar components:unitFlags fromDate:nowData toDate: endData options:0];
    NSInteger Hour = [components hour];
    NSInteger Min = [components minute];
    NSInteger Sec = [components second];
    NSInteger Day = [components day];
    NSInteger Mon = [components month];
    NSInteger Year = [components year];
    NSLog( @" From Now to %@, diff: Years: %d Months: %d, Days; %d, Hours: %d, Mins:%d, sec:%d",
          [nowData description], Year, Mon, Day, Hour, Min, Sec);
    NSString *countdown = [NSString stringWithFormat:@"还剩: %zi天 %zi小时 %zi分钟 %zi秒 ", Day,Hour, Min, Sec];
    if (Sec < 0)
    {
        countdown=[NSString stringWithFormat:@"活动结束/开始抢购"];
    }
    NSLog(@"countdown = %@", countdown);
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
