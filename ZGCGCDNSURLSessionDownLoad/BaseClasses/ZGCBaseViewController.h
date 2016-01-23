//
//  ZGCBaseViewController.h
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/22.
//  Copyright © 2016年 like. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ZGCBaseViewController : UIViewController


/**
 *  加载数据和提示
 *
 *  @param statusText        提示内容
 *  @param url               接口
 *  @param parameters        参数
 *  @param completionHandler 回调
 */
- (void)showLoadingStatus:(NSString *)statusText
           requestWithUrl:(NSString *)url
               parameters:(id)parameters
        completionHandler:(ZGCDataRequestCompletionBlock)completionHandler;

/**
 *  设置控制器标题颜色
 *
 *  @param color 颜色
 */
- (void)setNavTitleColor:(UIColor*)color;
@end
