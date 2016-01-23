//
//  ZGCDataService.m
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/23.
//  Copyright © 2016年 like. All rights reserved.
//

#import "ZGCDataService.h"
#import <AFHTTPSessionManager.h>
@implementation ZGCDataService

+ (void)requestWithUrl:(NSString *)url
            parameters:(id)parameters
     completionHandler:(ZGCDataRequestCompletionBlock)completionHandler {
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    //        [config setHTTPAdditionalHeaders:@{ @"User-Agent" : @"TuneStore iOS 1.0"}];
    
    //设置我们的缓存大小 其中内存缓存大小设置10M  磁盘缓存5M
    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024
                                                      diskCapacity:50 * 1024 * 1024
                                                          diskPath:nil];
    
    [config setURLCache:cache];
    
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil
                                                                    sessionConfiguration:config];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [[sessionManager dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]
                       completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                           if (error) {
                               MYLog(@"error :%@", error);
                           }else {
                               completionHandler(responseObject);
                           }
                       }]resume];
}

@end
