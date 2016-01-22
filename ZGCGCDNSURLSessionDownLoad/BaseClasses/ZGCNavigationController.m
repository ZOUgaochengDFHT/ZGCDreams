//
//  ZGCNavigationController.m
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/22.
//  Copyright © 2016年 like. All rights reserved.
//

#import "ZGCNavigationController.h"

#import <UIKit/UIGestureRecognizerSubclass.h>

#define KEY_WINDOW  [[UIApplication sharedApplication]keyWindow]

#pragma mark - FYFNavigationBar 子类化UINavigationBar
@interface ZGC_NavigationBar : UINavigationBar
@end
@implementation ZGC_NavigationBar
//禁用导航栏的pop动画
- (UINavigationItem *)popNavigationItemAnimated:(BOOL)animated {
    return [super popNavigationItemAnimated:YES];
}
@end


@interface ZGCNavigationController () <UIGestureRecognizerDelegate>{
    
    CGPoint         startTouch;
    BOOL            isMoving;
    UIImageView     *backImageView;
    UIView          *alphaView;
    BOOL            isBegining;
}
@property (nonatomic,retain) UIView *backgroundView;
@property (nonatomic,retain) NSMutableArray *backImages;

@end

@implementation ZGCNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backImages = [[NSMutableArray alloc]initWithCapacity:2];
    self.canDragBack = YES;
    //    self.navigationBar.translucent = NO;
    
    //1.创建自定义导航栏对象
    ZGC_NavigationBar *navigationBar = [[ZGC_NavigationBar alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 44)];
    [navigationBar setBackgroundImage:PNGImage(@"header_back88") forBarMetrics:UIBarMetricsDefault];
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        navigationBar.frame = CGRectMake(0, 0, KScreenWidth, 64);
        [navigationBar setBackgroundImage:PNGImage(@"header_back128") forBarMetrics:UIBarMetricsDefault];
    }
    [self setValue:navigationBar forKey:@"navigationBar"];
    
    navigationBar.translucent = NO;
    
    //设置导航栏标题的属性 在BaseViewController里设置
    //    UIColor *textColor = [UIColor darkGrayColor];
    //    navigationBar.titleTextAttributes = @{UITextAttributeFont: boldSysFont(20.0f),
    //                                          UITextAttributeTextColor:textColor};
    
    [navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    //2.创建滑动手势,实现左右滑动视图
    _pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [_pan setEnabled:NO];
    _pan.delegate = self;
    [self.view addGestureRecognizer:_pan];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")) {
        if (self.isViewLoaded && self.view.window == nil) {
            self.view = nil;
            //            [self viewDidUnload];
        }
    }
}


//////////////////////////////抽屉式导航////////////////////////////////////////
- (void)pan:(UIPanGestureRecognizer *)pan {
    
    CGPoint moveTouch = [pan locationInView:KEY_WINDOW];
    if (moveTouch.x < 50) {
        isBegining = YES;
    }
    MYLog(@"_____________________");
    
    if (isBegining) {
        //手势开始
        if (pan.state == UIGestureRecognizerStateBegan) {
            if (self.viewControllers.count <= 1 || !self.canDragBack) {
                return;
            }
            
            isMoving = NO;
            startTouch = [pan locationInView:KEY_WINDOW];
        }
        else if(pan.state == UIGestureRecognizerStateChanged) {
            if (self.viewControllers.count <= 1 || !self.canDragBack) {
                return;
            }
            
            CGPoint moveTouch = [pan locationInView:KEY_WINDOW];
            
            if (!isMoving && moveTouch.x-startTouch.x > 10) {
                backImageView.image = [self.backImages lastObject];
                isMoving = YES;
            }
            
            [self moveViewWithX:moveTouch.x - startTouch.x];
            
        }
        else if(pan.state == UIGestureRecognizerStateEnded) {
            if (self.viewControllers.count <= 1 || !self.canDragBack) {
                return;
            }
            
            CGPoint endTouch = [pan locationInView:KEY_WINDOW];
            
            if (endTouch.x - startTouch.x > 50 ) {
                // 设置动画时间
                animationTime =.35 - (endTouch.x - startTouch.x) / KScreenWidth * .35;
                [self popViewControllerAnimated:NO];
            } else {
                [UIView animateWithDuration:0.3 animations:^{
                    [self moveViewWithX:0];
                } completion:^(BOOL finished) {
                    isMoving = NO;
                }];
                
            }
            isBegining = NO;
        }
        else if(pan.state == UIGestureRecognizerStateCancelled) {
            if (self.viewControllers.count <= 1 || !self.canDragBack) {
                return;
            }
            
            [UIView animateWithDuration:0.3 animations:^{
                [self moveViewWithX:0];
            } completion:^(BOOL finished) {
                isMoving = NO;
            }];
        }
        
    }
}

- (void)clickBackBtn {
    backImageView.image = [self.backImages lastObject];
    isMoving = YES;
    //    [self moveViewWithX:moveTouch.x - startTouch.x];
}

#pragma mark - override UINavigationController方法覆写
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIImage *capture = [self capture];
    if (capture != nil) {
        [self.backImages addObject:capture];
    }
    
    if (self.viewControllers.count == 1) {
        [_pan setEnabled:YES];
    }
    
    [super pushViewController:viewController animated:NO];
    //    NSLog(@"    -------  %d    push ",_pan.enabled);
    if (self.backgroundView == nil) {
        
        //之前设置的backImageView->frame不对,图片拉伸的比例就不对
        CGRect frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
        self.backgroundView = [[UIView alloc]initWithFrame:frame];
        self.backgroundView.backgroundColor = [UIColor blackColor];
        
        backImageView = [[UIImageView alloc] initWithFrame:frame];
        [self.backgroundView addSubview:backImageView];
        MYLog(@"%@",NSStringFromCGRect(self.view.bounds) );
        alphaView = [[UIView alloc] initWithFrame:frame];
        alphaView.backgroundColor = [UIColor blackColor];
        [self.backgroundView addSubview:alphaView];
    }
    if (self.backgroundView.superview == nil) {
        [self.view.superview insertSubview:self.backgroundView belowSubview:self.view];
    }
    
    if (self.viewControllers.count == 1) {
        return;
    }
    
    backImageView.image = [self.backImages lastObject];
    alphaView.alpha = 0;
    
    [self moveViewWithX:KScreenWidth];
    [UIView animateWithDuration:.35 animations:^{
        [self moveViewWithX:0];
    }];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    // 注意写按钮返回事件的时候animated给YES / 手势返回的时候 animated给NO
    if (animated == YES) {
        animationTime = .35;
    }
    if (self.viewControllers.count == 2) {
        [_pan setEnabled:NO];
    }
    MYLog(@"----   %d     popView",_pan.enabled);
    if (self.view.frame.origin.x == 0) {
        backImageView.transform = CGAffineTransformMakeScale(0.95, 0.95);
    }
    [UIView animateWithDuration:animationTime animations:^{
        [self moveViewWithX:KScreenWidth];
    } completion:^(BOOL finished) {
        CGRect frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
        frame.origin.x = 0;
        self.view.frame = frame;
        
        // 先导航控制器，在移除图片
        [super popViewControllerAnimated:NO];
        
        [self.backImages removeLastObject];
        backImageView.image = [self.backImages lastObject];
        
        CFRunLoopStop(CFRunLoopGetCurrent());
    }];
    
    CFRunLoopRun();
    
    return nil;
}

//- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated {
//    [_pan setEnabled:YES];
//    [super popToRootViewControllerAnimated:animated];
//    NSLog(@"------- %d   popRoot",_pan.enabled);
//    return nil;
//}

#pragma mark - Utility Methods
//获取当前屏幕视图的快照图片
- (UIImage *)capture {
    
    //    BOOL isLogin = [[NSUserDefaults standardUserDefaults] boolForKey:ISLOGIN_VALUE];
    
    UIView *view = self.tabBarController.view;
    //    if (!isLogin) {
    //        //
    //        view = self.view;
    //    }
    
    if (view == nil) {
        if (self.view) {
            view = self.view;
        } else {
            view = nil;
        }
    }
    
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 1.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    MYLog(@"%f,%f",img.size.height,img.size.width);
    UIGraphicsEndImageContext();
    
    return img;
}

//移动导航控制器的根视图self.view
- (void)moveViewWithX:(float)x {
    //add 14-04-23
    self.titleWindow.alpha = 0;
    self.titleWindow = nil;
    
    x = x>KScreenWidth?KScreenWidth:x;
    x = x<0?0:x;
    
    CGRect frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
    frame.origin.x = x;
    self.view.frame = frame;
    float scale = (x/6400)+0.95;
    float alpha = 0.4 - (x/800);
    backImageView.transform = CGAffineTransformMakeScale(scale, scale);
    alphaView.alpha = alpha;
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    //    if (gestureRecognizer != self.pan) return NO;
    //    if (self.pan.state != UIGestureRecognizerStateBegan) return NO;
    //
    //    if (otherGestureRecognizer.state != UIGestureRecognizerStateBegan) {
    //
    //        return YES;
    //    }
    //
    //    CGPoint touchPoint = [self.pan beganLocationInView:self.controllerWrapperView];
    //
    //    // 点击区域判断 如果在左边 30 以内, 强制手势后退
    //    if (touchPoint.x < 30) {
    //
    //        [self cancelOtherGestureRecognizer:otherGestureRecognizer];
    //        return YES;
    //    }
    
    // 如果是scrollview 判断scrollview contentOffset 是否为0，是 cancel scrollview 的手势，否cancel自己
    if ([[otherGestureRecognizer view] isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)[otherGestureRecognizer view];
        if (scrollView.contentOffset.x <= 0) {
            [self cancelOtherGestureRecognizer:otherGestureRecognizer];
            return YES;
        }
    }
    
    return NO;
}

- (void)cancelOtherGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    //    NSSet *touchs = [self.pan.event touchesForGestureRecognizer:otherGestureRecognizer];
    //    [otherGestureRecognizer touchesCancelled:touchs withEvent:self.pan.event];
}



@end
