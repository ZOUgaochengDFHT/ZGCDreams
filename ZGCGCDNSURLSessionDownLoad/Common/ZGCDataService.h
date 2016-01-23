//
//  ZGCDataService.h
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/23.
//  Copyright © 2016年 like. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ZGCDataService : NSObject

+ (void)requestWithUrl:(NSString *)url
            parameters:(id)parameters
     completionHandler:(ZGCDataRequestCompletionBlock)completionHandler;

@end
