//
//  NSObject+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSObject+SYCategory.h"
#import "NSString+SYCategory.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <objc/runtime.h>

@implementation NSObject (SYCategory)

#pragma mark - 类型判断

BOOL NSObjectClass(id obj, Class class)
{
    return [obj isKindOfClass:class];
}

/// NSString类型
- (BOOL)isClassNSString
{
    return NSObjectClass(self, NSString.class);
}
/// NSNumber类型
- (BOOL)isClassNSNumber
{
    return NSObjectClass(self, NSNumber.class);
}
/// NSArray类型
- (BOOL)isClassNSArray
{
    return NSObjectClass(self, NSArray.class);
}
/// NSDictionary类型
- (BOOL)isClassNSDictionary
{
    return NSObjectClass(self, NSDictionary.class);
}
/// NSData类型
- (BOOL)isClassNSData
{
    return NSObjectClass(self, NSData.class);
}
/// UIView类型
- (BOOL)isClassUIView
{
    return NSObjectClass(self, UIView.class);
}
/// UIViewController类型
- (BOOL)isClassUIViewController
{
    return NSObjectClass(self, UIViewController.class);
}


#pragma mark -

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font constrainedSize:(CGSize)size
{
    CGSize sizeTmp = CGSizeZero;
    if ([NSString isValidNSString:text] && font) {
        if (7.0 <= [UIDevice currentDevice].systemVersion.floatValue) {
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
            NSDictionary *dict = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
            
            sizeTmp = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
        }
    }
    return sizeTmp;
}

/// 计算字符高度（根据字符，字体，及指定宽度）
- (CGFloat)heightWithText:(NSString *)string font:(UIFont *)font constrainedToWidth:(CGFloat)width
{
    CGSize size = [self sizeWithText:string font:font constrainedSize:CGSizeMake(width, CGFLOAT_MAX)];
    return size.height;
}

/// 单行文字宽度
- (CGFloat)widthWithText:(NSString *)string font:(UIFont *)font
{
    CGSize size = [self sizeWithText:string font:font constrainedSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    return size.width;
}

/// 结束编辑
- (void)editingDone
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

/**
 *  判断图片类型（图片名称，或图片url地址，或图片image）
 *
 *  @return 图片类型
 */
- (SYImageType)imageTypeWithImage
{
    SYImageType type = SYImageTypeName;
    
    if ([self isKindOfClass:[NSString class]])
    {
        id object = (NSString *)self;
        if ([object hasPrefix:@"http://"] || [object hasPrefix:@"https://"])
        {
            // 图片网络地址，即http://，或https://
            type = SYImageTypeUrl;
        }
        else
        {
            // 图片名称，即NSString类型
            type = SYImageTypeName;
        }
    }
    else if ([self isKindOfClass:[UIImage class]])
    {
        // 图片，即UIImage类型
        type = SYImageTypeImage;
    }
    
    return type;
}

/// 实体模型属性打印
- (NSString *)descriptionShow
{
    NSString *message = @"\n";
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i < outCount; i ++)
    {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if (propName)
        {
            NSString *key = [NSString stringWithCString:propName encoding:[NSString defaultCStringEncoding]];
            id value = [self valueForKey:key];
            message = [message stringByAppendingFormat:@"%@ : %@;\n", key, value];
        }
    }
    free(properties);
    return message;
}

@end
