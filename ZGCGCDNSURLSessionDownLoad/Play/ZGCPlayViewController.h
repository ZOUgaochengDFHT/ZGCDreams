//
//  ZGCPlayViewController.h
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/22.
//  Copyright © 2016年 like. All rights reserved.
//

#import "ZGCBaseViewController.h"
typedef void(^ZGCPlayVCDismissNotificationBlock)();
@interface ZGCPlayViewController : ZGCBaseViewController

@property (nonatomic, copy) ZGCPlayVCDismissNotificationBlock playVCDismissNotification;
@end
