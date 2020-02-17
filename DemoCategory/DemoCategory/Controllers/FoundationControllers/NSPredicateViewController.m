//
//  NSPredicateViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 2018/3/5.
//  Copyright © 2018年 zhangshaoyu. All rights reserved.
//

#import "NSPredicateViewController.h"


/************************************************/

@interface PersonModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *job;
@property (nonatomic, strong) NSNumber *age;

@end

@implementation PersonModel

@end

/************************************************/


@interface NSPredicateViewController ()

@end

@implementation NSPredicateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"show" style:UIBarButtonItemStyleDone target:self action:@selector(showMessage)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showMessage
{
    [self predicateCompare];
    
    [self predicateLogic];
    
    [self predicateCompareString];
    
    [self predicateCollection];
}

- (void)predicateCompare
{
    // =，==：判断两个表达式是否相等，
    NSNumber *testNumber = @123;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF = 123"];
    NSLog(@"%@ vs 123: %@", testNumber, ([predicate evaluateWithObject:testNumber] ? @"相等" : @"不相等"));
    
    // >=，=>：判断左边表达式的值是否大于或等于右边表达式的值
    predicate = [NSPredicate predicateWithFormat:@"SELF >= 200"];
    NSLog(@"%@ vs 200: %@", testNumber, ([predicate evaluateWithObject:testNumber] ? @"大于等于" : @"小于"));
    
    // <=，=<：判断右边表达式的值是否小于或等于右边表达式的值
    predicate = [NSPredicate predicateWithFormat:@"SELF <= 150"];
    NSLog(@"%@ vs 150: %@", testNumber, ([predicate evaluateWithObject:testNumber] ? @"小于等于" : @"大于"));
    
    // >：判断左边表达式的值是否大于右边表达式的值
    predicate = [NSPredicate predicateWithFormat:@"SELF > 123"];
    NSLog(@"%@ vs 123: %@", testNumber, ([predicate evaluateWithObject:testNumber] ? @"大于" : @"小于等于"));
    
    // <：判断左边表达式的值是否小于右边表达式的值
    predicate = [NSPredicate predicateWithFormat:@"SELF < 123"];
    NSLog(@"%@ vs 123: %@", testNumber, ([predicate evaluateWithObject:testNumber] ? @"小于" : @"大于等于"));
    
    // !=、<>：判断两个表达式是否不相等
    predicate = [NSPredicate predicateWithFormat:@"SELF != 123"];
    NSLog(@"%@ vs 123: %@", testNumber, ([predicate evaluateWithObject:testNumber] ? @"不相等" : @"相等"));
    
    // BETWEEN：BETWEEN表达式必须满足表达式 BETWEEN {下限，上限}的格式，要求该表达式必须大于或等于下限，并小于或等于上限
    predicate = [NSPredicate predicateWithFormat:@"SELF BETWEEN {100, 200}"];
    NSLog(@"%@ vs {100, 200}: %@", testNumber, ([predicate evaluateWithObject:testNumber] ? @"包含" : @"不包含"));
    
    NSLog(@"%@ vs 251: %@", testNumber, ([NSPredicate predicateNumber:testNumber filter:@"SELF == 251"] ? @"相等" : @"不相等"));
}

- (void)predicateLogic
{
    // AND、&&：逻辑与，要求两个表达式的值都为YES时，结果才为YES。
    NSArray *testArray = @[@1, @2, @3, @4, @5, @6];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF > 2 && SELF < 5"];
    NSArray *filterArray = [testArray filteredArrayUsingPredicate:predicate];
    NSLog(@"元素值大于2，且小于5的数组:%@", filterArray);
    
    // OR、||：逻辑或，要求其中一个表达式为YES时，结果就是YES
    predicate = [NSPredicate predicateWithFormat:@"SELF < 2 || SELF > 5"];
    filterArray = [testArray filteredArrayUsingPredicate:predicate];
    NSLog(@"元素值小于2，或大于5的数组:%@", filterArray);
    
    // NOT、 !：逻辑非，对原有的表达式取反
    predicate = [NSPredicate predicateWithFormat:@"NOT (SELF > 2 AND SELF < 5)"];
    filterArray = [testArray filteredArrayUsingPredicate:predicate];
    NSLog(@"元素值既不大于2也不小于5，即小于等于2，或大于等于5:%@", filterArray);
    
    
    filterArray = [NSPredicate predicateArray:testArray filter:@"SELF > 5"];
    NSLog(@"元素值大于5的数组:%@", filterArray);
}

- (void)predicateCompareString
{
    // BEGINSWITH：检查某个字符串是否以指定的字符串开头（如判断字符串是否以a开头：BEGINSWITH 'a'）
    NSString *text = @"devZhang";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH 'd'"];
    NSLog(@"%@ beginWith d: %d", text, [predicate evaluateWithObject:text]);
    
    // ENDSWITH：检查某个字符串是否以指定的字符串结尾
    predicate = [NSPredicate predicateWithFormat:@"SELF ENDSWITH 'a'"];
    NSLog(@"%@ endWith a: %d", text, [predicate evaluateWithObject:text]);
    
    // CONTAINS：检查某个字符串是否包含指定的字符串
    predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS 'evZ'"];
    NSLog(@"%@ 包含 evZ: %d", text, [predicate evaluateWithObject:text]);
    
    // LIKE：检查某个字符串是否匹配指定的字符串模板。其之后可以跟?代表一个字符和*代表任意多个字符两个通配符。比如"name LIKE '*ac*'"，这表示name的值中包含ac则返回YES；"name LIKE '?ac*'"，表示name的第2、3个字符为ac时返回YES。
    predicate = [NSPredicate predicateWithFormat:@"SELF LIKE '?evZ*g'"];
    NSLog(@"%@ like ?evZ*g: %d", text, [predicate evaluateWithObject:text]);
    
    // MATCHES：匹配，即检查某个字符串是否匹配指定的正则表达式。虽然正则表达式的执行效率是最低的，但其功能是最强大的，也是我们最常用的。
    // 判断字符串是否以d字符开头，g字符结尾
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^d.+g$'"];
    NSLog(@"%@ match d开头/g结尾: %d", text, [predicate evaluateWithObject:text]);
    
    // 判断字符串是否为1~20位的字母字符串（没有位数限制时，可写成"[a-zA-Z]{1,}"，或"[a-zA-Z]+"）
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '[a-zA-Z]{1,20}'"];
    NSLog(@"%@ match 1~20位字母: %d", text, [predicate evaluateWithObject:text]);
    
    // 判断字符串是否以下划线开头包含数字和字母的6~12位
    text = @"_168devZhang";
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^_+[0-9]+[a-zA-Z]{6,12}'"];
    NSLog(@"%@ match 下划线开头+数字+字母+6~12位: %d", text, [predicate evaluateWithObject:text]);
    
    // 判断字符串长度
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '([a-zA-Z0-9._&*]{8,16})'"];
    NSLog(@"%@ match 8~16位: %d", text, [predicate evaluateWithObject:text]);
    
    // 判断数字带两位小数
    text = @"123.22";
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^[0-9]+(.[0-9]{2})'"];
    NSLog(@"%@ match 数字带两位小数: %d", text, [predicate evaluateWithObject:text]);
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    text = @"13511113244";
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^1(34[0-8]|(3[5-9]|5[017-9]|8[278]))[0-9]{8}$|^1(3[0-2]|5[256]|8[56])[0-9]{8}$|^1(33|53|8[09])[0-9]{8}|^1(349)[0-9]{7}'"];
    NSLog(@"%@ match 手机号码: %d", text, [predicate evaluateWithObject:text]);
    
    // 中国移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^1(34[0-8]|(3[5-9]|5[017-9]|8[278]))[0-9]{8}$'"];
    NSLog(@"%@ match 中国移动手机号码: %d", text, [predicate evaluateWithObject:text]);
    
    // 中国联通：130,131,132,152,155,156,185,186
    text = @"18555551155";
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^1(3[0-2]|5[256]|8[56])[0-9]{8}$'"];
    NSLog(@"%@ match 中国联通手机号码: %d", text, [predicate evaluateWithObject:text]);
    
    // 中国电信：133,1349,153,180,189
    text = @"13498161155";
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^1(33|53|8[09])[0-9]{8}|^1(349)[0-9]{7}'"];
    NSLog(@"%@ match 中国电信手机号码: %d", text, [predicate evaluateWithObject:text]);
    
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029,0755,0753,……
     * 号码：七位或八位
     */
    text = @"075522222222";
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^0(10|2[05789])[1-9]{8}|^0[0-9]{3}[0-9]{7,8}'"];
    NSLog(@"%@ match 固定电话: %d", text, [predicate evaluateWithObject:text]);
    
    // 验证email
    text = @"zhangsy@163.com";
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,5}'"];
    NSLog(@"%@ match 电子邮箱: %d", text, [predicate evaluateWithObject:text]);
    
    text = @"13723612333";
    NSLog(@"%@ match 移动手机号码: %d", text, [NSPredicate predicatePhoneNumMobile:text]);
}

- (void)predicateCollection
{
    NSArray *filterArray = @[@"ab", @"abc"];
    NSArray *array = @[@"a", @"ab", @"abc", @"abcd"];
    
    // 元素值未包含
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)", filterArray];
    NSArray *resultArray = [array filteredArrayUsingPredicate:predicate];
    NSLog(@"未包含在集合中的数组：%@", resultArray);
    
    // 判断元素值大于等于某个值
    array = @[@"2", @"3", @"4", @"5"];
    predicate = [NSPredicate predicateWithFormat:@"integerValue >= %@", @(3)];
    resultArray = [array filteredArrayUsingPredicate:predicate];
    NSLog(@"元素值大于某个值：%@", resultArray);
    
    
    // 判断元素值
    NSMutableArray *personArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++)
    {
        PersonModel *person = [[PersonModel alloc] init];
        person.name = [NSString stringWithFormat:@"name_%@", @(i)];
        person.age = @(arc4random() % 50 + 10 + i);
        
        [personArray addObject:person];
    }
    NSLog(@"personArray = %@", personArray);
    array = [NSArray arrayWithArray:personArray];
    predicate = [NSPredicate predicateWithFormat:@"age >= %@", @(30)];
    resultArray = [array filteredArrayUsingPredicate:predicate];
    NSLog(@"resultArray = %@", resultArray);
}

@end
