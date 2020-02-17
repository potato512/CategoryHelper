# SYCategory
NSFilehandle：文件内容执行I/O操作（打开、读取、写入、更新、关闭）

# 使用
``` javascript
/**
*  写入内容到指定位置
*
*  @param filePath 文件路径（如：xxx/xx/.../xx.txt）
*  @param content  内容
*  @param position 位置
*/
+ (void)writeFileWithFilePath:(NSString *)filePath content:(NSString *)content position:(unsigned long long)position;

/**
*  写入内容到文件末尾
*
*  @param filePath 文件路径（如：xxx/xx/.../xx.txt）
*  @param content  内容
*/
+ (void)writeFileBackWithFilePath:(NSString *)filePath content:(NSString *)content;
```

``` javascript
/**
*  读取文件指定位置后指定长度的内容
*
*  @param filePath 文件路径（如：xxx/xx/.../xx.txt）
*  @param position 指定位置
*  @param length   指定长度
*
*  @return NSString
*/
+ (NSString *)readFileWithFilePath:(NSString *)filePath position:(unsigned long long)position length:(NSUInteger)length;

/**
*  读取文件内容
*
*  @param filePath 文件路径（如：xxx/xx/.../xx.txt）
*
*  @return NSString
*/
+ (NSString *)readFileWithFilePath:(NSString *)filePath;
``` 

``` javascript
/**
*  复制文件内容
*
*  @param fromPath 复制前原文件路径（如：xxx/xxx/.../xx.txt）
*  @param toPath   复制后新文件路径（如：xaxa/abxx/../aaa.txt）
*/
+ (void)copyFileWithFilePath:(NSString *)fromPath toPath:(NSString *)toPath;
``` 



