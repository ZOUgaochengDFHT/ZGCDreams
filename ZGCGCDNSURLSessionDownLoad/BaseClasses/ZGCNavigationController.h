//
//  ZGCNavigationController.h
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/22.
//  Copyright © 2016年 like. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZGCNavigationController : UINavigationController
{
    
    //    UIPanGestureRecognizer *_pan;
    //动画时间
    double animationTime;
}

@property (nonatomic, retain) UIPanGestureRecognizer *pan;
@property (nonatomic,assign) BOOL canDragBack;  //是否开启拽回上一个控制器
@property (nonatomic, retain) UIWindow *titleWindow;
@end
