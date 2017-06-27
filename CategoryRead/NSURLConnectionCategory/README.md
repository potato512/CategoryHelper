# SYCategory
NSURLConnection：请求block回调处理
 
# 使用
``` javascript
/// 异步请求（请求、进度、接收数据、成功、失败）
+ (NSURLConnection *)sendAsynchronousRequest:(NSURLRequest *)request
didUpdateProgress:(void (^)(NSInteger progress))progress
didReceiveData:(void (^)(NSData *data))data
didReceiveResponse:(void (^)(NSHTTPURLResponse *HTTPResponse))success
didFailWithError:(void (^)(NSError *error))fail;
```
