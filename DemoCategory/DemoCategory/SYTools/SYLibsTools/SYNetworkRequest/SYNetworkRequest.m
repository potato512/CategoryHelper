//
//  SYNetworkRequest.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/7/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  https://github.com/AFNetworking/AFNetworking

#import "SYNetworkRequest.h"
#import <netinet/in.h>

static NSTimeInterval const APIServiceTimeout = 30.0;
static NSString *APIServiceHost;

/// 网络请求方式 GET
static NSString *const RequestGET = @"GET";
/// 网络请求方式 POST
static NSString *const RequestPOST = @"POST";

@interface SYNetworkRequest ()

@property (nonatomic, strong) NSURL *hostUrl;
@property (nonatomic, strong) AFHTTPSessionManager *sessionManagerHttp;
@property (nonatomic, strong) AFURLSessionManager *sessionmanagerUrl;

@end

@implementation SYNetworkRequest

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        if (!self.hostUrl.host)
        {
            NSLog(@"<-----------------------没有设置host，请先调用“startWithServiceHost:”设置host----------------------->");
        }
        NSAssert(self.hostUrl.host != nil, @"self.hostUrl must be non-nil");
        NSParameterAssert(self.hostUrl.host);
        NSLog(@"<-----------------------已调用“startWithServiceHost:”设置servicehost----------------------->");
    }
    
    return self;
}

+ (SYNetworkRequest *)shareRequest
{
    static SYNetworkRequest *network = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        network = [[self alloc] init];
    });
    
    return network;
}

/**
 *  启动设置服务器
 *
 *  @param host API服务器
 */
+ (void)startWithServiceHost:(NSString *)host
{
    APIServiceHost = host;
}

- (NSURL *)hostUrl
{
    if (!_hostUrl)
    {
        _hostUrl = [NSURL URLWithString:APIServiceHost];
    }
    
    return _hostUrl;
}

/**
 *  网络监测（APP启动时设置）
 */
+ (void)networkMonitoring
{
    /// 网络
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

/**
 *  网络判断
 *
 *  @return 是否有网
 */
+ (BOOL)isReachable
{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        NSLog(@"Error: Could not recover network reachability flags");
        return NO;
    }
    
    BOOL isReachable = (flags & kSCNetworkFlagsReachable);
    BOOL needsConnection = (flags & kSCNetworkFlagsConnectionRequired);
    BOOL isValidNetwork = ((isReachable && !needsConnection) ? YES : NO);
    
    return isValidNetwork;
}

#pragma mark - AFHTTPSessionManager

#pragma mark getter

- (AFHTTPSessionManager *)sessionManagerHttp
{
    if (!_sessionManagerHttp)
    {
        NSURL *baseUrl = self.hostUrl;
        
        _sessionManagerHttp = [[AFHTTPSessionManager alloc] initWithBaseURL:baseUrl];
        if ([baseUrl.scheme isEqualToString:@"https"])
        {
            _sessionManagerHttp.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        }
    }
    
    return _sessionManagerHttp;
}

- (AFHTTPSessionManager *)httpSessionManager
{
    return self.sessionManagerHttp;
}

#pragma mark setter

- (void)setRequestType:(RequestContentType)requestType
{
    _requestType = requestType;
    
    // 请求数据样式
    if (RequestContentTypeXML == requestType)
    {
        self.sessionManagerHttp.requestSerializer = [AFPropertyListRequestSerializer serializer];
    }
    else if (RequestContentTypeJSON == requestType)
    {
        self.sessionManagerHttp.requestSerializer = [AFJSONRequestSerializer serializer];
        self.sessionManagerHttp.requestSerializer.timeoutInterval = APIServiceTimeout;
    }
    else if (RequestContentTypeOther == requestType)
    {
        self.sessionManagerHttp.requestSerializer = [AFHTTPRequestSerializer serializer];
    }
}

- (void)setResponseType:(ResponseContentType)responseType
{
    _responseType = responseType;
    
    // 响应数据格式
    if (ResponseContentTypeXML == responseType)
    {
        // 返回格式-xml
        self.sessionManagerHttp.responseSerializer = [AFXMLParserResponseSerializer serializer];
    }
    else if (ResponseContentTypeJSON == responseType)
    {
        // 返回格式-json
        self.sessionManagerHttp.responseSerializer = [AFJSONResponseSerializer serializer];
        self.sessionManagerHttp.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    }
    else if (ResponseContentTypeOther == responseType)
    {
        // 返回格式-其他
        self.sessionManagerHttp.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
}

#pragma mark methord

- (NSURLSessionDataTask *)requestWithUrl:(NSString *)url parameters:(NSDictionary *)dict httpType:(NSString *)type complete:(void (^)(NSURLResponse *response, id responseObject, NSError *error))complete
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
     
    // 网络异常判断 开始修改时，判断网络情况
//    BOOL isBadNet = GetNetworkStatusNotReachable;
    BOOL isBadNet = [manager.reachabilityManager isReachable];
    DLog(@"当前网络状态：%@", (isBadNet ? @"不可用" : @"可用"));
    if (isBadNet)
    {
        if (complete)
        {
            complete(nil, nil, nil);
        }
     
        return nil;
    }
     
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
     
    NSString *requestUrl = url;
    NSDictionary *requestDict = dict;
    NSString *requestType = type; // @"POST" : @"GET"
    DLog(@"\n request\n url=%@\n para=%@\n type=%@", requestUrl, requestDict, requestType);
     
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:requestType URLString:requestUrl parameters:nil error:nil];
    // 设置请求body（参数dict转换成字符串json）
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:requestDict options:0 error:nil];
    NSString *bodyJson = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSData *bodyData = [bodyJson dataUsingEncoding:NSUTF8StringEncoding];
    DLog(@"bodyJson = %@", bodyJson);
    request.HTTPBody = bodyData;
     
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:complete];
     
    return dataTask;
}

/**
 *  网络请求——有效
 *
 *  @param url              API接口url
 *  @param dict             API请求参数
 *  @param isHTTPBody       参数格式（httpBody，或其他）
 *  @param type             请求样式（POST/GET）
 *  @param uploadProgress   请求上传回调(NSProgress * _Nonnull uploadProgress)
 *  @param downloadProgress 请求下载回调(NSProgress * _Nonnull downloadProgress)
 *  @param complete         请求结果回调(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error)
 *
 *  @return NSURLSessionDataTask（便于后续操作处理，如取消请求）
 */
- (NSURLSessionDataTask *)requestWithUrl:(NSString *)url parameters:(NSDictionary *)dict parametersType:(BOOL)isHTTPBody httpType:(NSString *)type uploadProgress:(void (^)(NSProgress * _Nonnull uploadProgress))uploadProgress downloadProgress:(void (^)(NSProgress * _Nonnull downloadProgress))downloadProgress complete:(void (^)(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error))complete
{
    // 请求地址
    NSString *requestURL = [[NSURL URLWithString:url relativeToURL:self.sessionManagerHttp.baseURL] absoluteString];
    // 请求参数
    NSDictionary *requestDict = dict;
    // 请求样式 "POST" ，或"GET"
    NSString *requestMethord = type; // (RequestHttpTypePOST == methordType ? @"POST" : @"GET");
    // 创建请求
    NSMutableURLRequest *request = nil;
    // 设置请求body（参数dict转换成字符串json）
    if (isHTTPBody)
    {
        request = [self.sessionManagerHttp.requestSerializer requestWithMethod:requestMethord URLString:requestURL parameters:nil error:nil];
        if (requestDict && 0 != requestDict.count)
        {
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:requestDict options:0 error:nil];
            NSString *bodyJson = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            NSData *bodyData = [bodyJson dataUsingEncoding:NSUTF8StringEncoding];
            DLog(@"\nbodyJson = %@", bodyJson);
            request.HTTPBody = bodyData;
        }
    }
    else
    {
        request = [self.sessionManagerHttp.requestSerializer requestWithMethod:requestMethord URLString:requestURL parameters:requestDict error:nil];
    }
    
    NSURLSessionDataTask *dataTask = [self.sessionManagerHttp dataTaskWithRequest:request uploadProgress:uploadProgress downloadProgress:downloadProgress completionHandler:complete];
    
    return dataTask;
}


- (NSURLSessionDataTask *)requestPOSTWithUrl:(NSString *)url
                                      params:(NSDictionary *)params
                                    complete:(void (^)(id responseObject))complete
{
    
//    account=junjie.cai&password=E10ADC3949BA59ABBE56E057F20F883E
//    bodyJson = {"account":"junjie.cai","password":"E10ADC3949BA59ABBE56E057F20F883E"}
    
    NSURLSessionDataTask *dataTask = [self.sessionManagerHttp POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"responseObject = %@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

    return dataTask;
}



#pragma mark - AFURLSessionManager

#pragma mark getter

- (AFURLSessionManager *)sessionmanagerUrl
{
    if (_sessionmanagerUrl == nil)
    {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _sessionmanagerUrl = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    return _sessionmanagerUrl;
}

- (AFURLSessionManager *)urlSessionmanager
{
    return self.sessionmanagerUrl;
}

#pragma mark 信息请求

- (NSURLSessionDataTask *)requestWithType:(RequestHttpType)type url:(NSString *)url parameters:(NSDictionary *)dict completionHandle:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completion
{
    NSString *requestType = RequestPOST;
    if (RequestHttpTypeGET == type)
    {
        requestType = RequestGET;
    }
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:requestType URLString:url parameters:dict error:nil];
    NSURLSessionDataTask *dataTask = [self.sessionmanagerUrl dataTaskWithRequest:request completionHandler:completion];
    [dataTask resume];
    
    return dataTask;
}

- (NSURLSessionDataTask *)requestPostWithUrl:(NSString *)url parameters:(NSDictionary *)dict completionHandle:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completion
{
    NSURLSessionDataTask *dataTask = [self requestWithType:RequestHttpTypePOST url:url parameters:dict completionHandle:completion];
    return dataTask;
}

- (NSURLSessionDataTask *)requestGetWithUrl:(NSString *)url completionHandle:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completion
{
    NSURLSessionDataTask *dataTask = [self requestWithType:RequestHttpTypeGET url:url parameters:nil completionHandle:completion];
    return dataTask;
}

#pragma mark 文件上传

#pragma mark 文件下载

@end
