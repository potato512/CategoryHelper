# SYCategory
NSString：其他对象的互换、数字/金额等的处理、特殊字符的限制

# 使用
``` javascript
/**
*  获取设备 ip 地址
*
*  @return ip 地址字符串
*/
+ (NSString *)IPAddress;
```

``` javascript
- (NSString *)fileName;

- (NSString *)fileType;
```

``` javascript
/// number转字string
+ (NSString *)stringWithNumber:(NSNumber *)value;

/// int转字string
+ (NSString *)stringWithInteger:(int)value;

/// float转字string
+ (NSString *)stringWithFloat:(float)value;

/// double转字string
+ (NSString *)stringWithDouble:(double)value;
```

``` javascript
/**
*  获取字符串首字符（汉字会被转换成全拼音）
*
*  @return 字符串首字符
*/
- (NSString *)firstCharacter;

#pragma mark - 字符处理方法

/// 字符隐藏显示设置（使用诸如“*”符号代替，同时设置只显示前几位，及后几位）
- (NSString *)textHiddenWithSymbol:(NSString *)symbol showBegin:(NSInteger)begin showEnd:(NSInteger)end;

/// 数字字符串保留小数点后任意位数
- (NSString *)textKeepDecimalPointWithNumber:(NSInteger)length;

/// 金额字符串转换显示样式（每三位以空格，或,进行分割显示）
- (NSString *)textMoneySeparatorWithSymbol:(NSString *)symbol;
```

``` javascript
/// 有效字符（非空，且非空格）
+ (BOOL)isValidNSString:(NSString *)string;

/// 字符非空判断（可以是空格字符串）
+ (BOOL)isNullNSString:(NSString *)string;

/// 字符非空判断（不能是空格字符串）
+ (BOOL)isNullBlankNSString:(NSString *)string;

/// 过滤字符串中的空格符
- (NSString *)textFilterBlankSpace;

/// 判断输入的字符长度 一个汉字算2个字符，是否区分中英文
- (NSUInteger)textLength:(BOOL)isCN;
```

``` javascript
/// 字符等级强弱度识别（1弱；2中；3强）
- (NSInteger)textStrengthGrade;
```

#### json转换
``` javascript
/// dict字典转json字符串
+ (NSString *)jsonStringWithDictionary:(NSDictionary *)dict;

/// json字符串转dict字典
+ (NSDictionary *)jsonDictWithString:(NSString *)string;
```

#### 正则判断
``` javascript
/**
*  是否是正确的指定正则的格式
*
*  @param regex 正则
*
*  @return 是，或否
*/
- (BOOL)isValidText:(NSString *)regex;

/**
*  判断是否正确的移动手机号码格式
*
*  @return 是，或否
*/
- (BOOL)isValidMobileCM;

/**
*  判断是否正确的联通手机号码格式
*
*  @return 是，或否
*/
- (BOOL)isValidMobileCU;

/**
*  判断是否正确的电信手机号码格式
*
*  @return 是，或否
*/
- (BOOL)isValidMobileCT;

/**
*  判断是否正确的手机号码格式
*
*  @return 是，或否
*/
- (BOOL)isValidMobile;

/**
*  判断是否正确的电子邮箱格式
*
*  @return 是，或否
*/
- (BOOL)isValidEmail;

/// 字符是否只包含"数字、大小写字母、_、@"的用户帐号
- (BOOL)isValidAccount;

/// 字符是否只包含"数字、大小写字母"且为4~12位的有效帐户
- (BOOL)isValidLimitAccount;

/// 字符是否是有效密码（大小写字母、数字组成，8-16位）
- (BOOL)isValidPassword;

/// 字符是否指定金额（100位整数，2位小数）
- (BOOL)isValidMoney;

/// 字符是否是有效的银行卡号（12~19位数字）
- (BOOL)isValidBankCardNumber;

/// 字符是否是合法身份证账号（数字与字母组成）
- (BOOL)isValidIDCard;

/// 字符是否是有效的身份证号码
- (BOOL)isValidIdentityCard;

/// 正则判断
- (BOOL)isValidTextWithPredicate:(NSString *)regex;
```

``` javascript
/**
*  判断是否含有空格的字符串
*
*  @return 是，或否
*/
- (BOOL)isSpaceString;

/**
*  判断字符串是否是纯数字字符串
*
*  @return 是，或否
*/
- (BOOL)isNumberNSString;

/// 判断一个数字字符串是整数还是一个小数字符串
- (BOOL)isDecimalNumberNSString;

/// 字符串是否是纯汉字字符串
- (BOOL)isCNNSString;

/// 字符串是大小写英文字符串
- (BOOL)isENNString;

/// 字符串是大写英文字符串
- (BOOL)isUppercaseNSString;

/// 字符串是小写英文字符串
- (BOOL)isLowercaseNSString;

/// 字符串是特殊字符字符串
- (BOOL)isSpecialNSString;

/// 字符串中是否包含汉字字符
- (BOOL)isContantCNNSString;

/// 判断当前字符类型（NO中文字符；YES英文字符）
- (BOOL)isENCharacter;

/// 是否是指定的字符类型
- (BOOL)isContantWithText:(NSString *)text;

/// 是否包含子字符串
- (BOOL)isContantSubtext:(NSString *)text;

/// 是否包含指定的字符
- (BOOL)isContantSomeCharacters:(NSString *)characters;
```

``` javascript
/// 包含表情字符
- (BOOL)isEmojiString;
```

``` javascript
/**
*  限制不能输入指定字符回调
*
*  @param text    限制不能输入的字符串
*  @param regular 回调
*/
- (void)regularWithText:(NSString *)text limitedHandle:(void (^)(NSInteger index))regular;

/**
*  限制只能输入指定字符回调
*
*  @param text    限制只能输入的字符串
*  @param regular 回调
*/
- (void)regularWithText:(NSString *)text allowedHandle:(void (^)(NSInteger index))regular;

/**
*  限制输入指定字符回调
*
*  @param text    限制指定字符串
*  @param islimit 是限制输入，还是允许输入
*  @param regular 回调
*/
- (void)regularWithText:(NSString *)text limited:(BOOL)islimit handle:(void (^)(NSInteger index))regular;
```


