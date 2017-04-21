//
//  NSObject+SYKVO.m
//  zhangshaoyu
//
//  Created by herman on 2017/4/20.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "NSObject+SYKVO.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface NSObject ()

//@property (nonatomic, copy) void (^singleHandle)(id object);
@property (nonatomic, copy) void (^singleHandle)(id object, NSDictionary *change);

@end

@implementation NSObject (SYKVO)

//- (void)setSingleHandle:(void (^)(id))singleHandle
//{
//    objc_setAssociatedObject(self, @selector(singleHandle), singleHandle, OBJC_ASSOCIATION_COPY);
//}
//
//- (void (^)(id))singleHandle
//{
//    return objc_getAssociatedObject(self, @selector(singleHandle));
//}

//- (void)observerComplete:(void (^)(id object))handle
//{
//    // 设置回调
//    self.singleHandle = [handle copy];
//    
//    // 添加响应者
//    NSString *objectClass = NSStringFromClass([self class]);
//    const char *objectName = [objectClass UTF8String];
//    id theClass = objc_getClass(objectName);
//    
//    unsigned int outCount, i;
//    objc_property_t *properties = class_copyPropertyList(theClass, &outCount);
//    for (i = 0; i < outCount; i++)
//    {
//        objc_property_t property = properties[i];
//        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
//        NSLog(@"propertyName = %@", propertyName);
//        
//        [self addObserver:self forKeyPath:propertyName options:NSKeyValueObservingOptionNew context:nil];
//    }
//}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
//{
//    if (self.singleHandle)
//    {
//        self.singleHandle(object);
//    }
//}


- (void)setSingleHandle:(void (^)(id, NSDictionary *))singleHandle
{
    objc_setAssociatedObject(self, @selector(singleHandle), singleHandle, OBJC_ASSOCIATION_COPY);
}

- (void (^)(id, NSDictionary *))singleHandle
{
    return objc_getAssociatedObject(self, @selector(singleHandle));
}

- (void)observerForKeyPath:(NSString *)keyPath complete:(void (^)(id object, NSDictionary *change))complete
{
    self.singleHandle = [complete copy];
    [self addObserver:self forKeyPath:keyPath options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (self.singleHandle)
    {
        self.singleHandle(object, change);
    }
}

@end
