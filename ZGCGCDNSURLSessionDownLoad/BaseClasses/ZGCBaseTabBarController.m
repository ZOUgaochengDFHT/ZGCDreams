//
//  ZGCBaseTabBarController.m
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/22.
//  Copyright © 2016年 like. All rights reserved.
//

#import "ZGCBaseTabBarController.h"
#import "ZGCPlayViewController.h"
#import "ZGCNavigationController.h"
@interface ZGCBaseTabBarController ()
{
    UIButton          *_playBtn;
    UIImageView *_circleImgView;
    UIImageView   *_playImgView;
    BOOL             _animating;
    
    CADisplayLink        *_link;
}
@end

@implementation ZGCBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tabBar.shadowImage = [UIImage new];
    self.tabBar.backgroundImage = PNGImage(@"tabbar_bg");

    [self initTabbarPlayBtn];
}

- (void)initTabbarPlayBtn {
    
    UIImage *npNormalImage = PNGImage(@"tabbar_np_normal");

    UIImageView *bgImgView = [[UIImageView alloc]initWithFrame:(CGRect){(KScreenWidth-npNormalImage.size.width)/2, KScreenHeight-npNormalImage.size.height, npNormalImage.size.width, npNormalImage.size.height}];
    bgImgView.image = npNormalImage;
    bgImgView.userInteractionEnabled = YES;
    [self.view addSubview:bgImgView];
    
    UIImage *npLoopImage = PNGImage(@"tabbar_np_loop");
    _circleImgView = [[UIImageView alloc]initWithFrame:(CGRect){0, 0, npLoopImage.size.width, npLoopImage.size.height}];
    _circleImgView.image = npLoopImage;
    bgImgView.userInteractionEnabled = YES;
    [bgImgView addSubview:_circleImgView];
    
    
    UIImage *npPlayShadowImage = PNGImage(@"tabbar_np_playshadow");
    _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _playBtn.frame = CGRectMake((bgImgView.width - npPlayShadowImage.size.width)/2, (bgImgView.height - npPlayShadowImage.size.height)/2, npPlayShadowImage.size.width, npPlayShadowImage.size.height);
    [_playBtn setImage:npPlayShadowImage forState:UIControlStateNormal];
    [bgImgView addSubview:_playBtn];
    [_playBtn addTarget:self action:@selector(playBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *npPlayImage = PNGImage(@"tabbar_np_play");
    _playImgView = [[UIImageView alloc]init];
    _playImgView.frame = CGRectMake((bgImgView.width - npPlayImage.size.width)/2, (bgImgView.height - npPlayImage.size.height)/2, npPlayImage.size.width, npPlayImage.size.height);
    _playImgView.image = npPlayImage;
    bgImgView.userInteractionEnabled = YES;
    [bgImgView addSubview:_playImgView];
    
}

- (void)playBtnAction {
    [self startSpin];
}

/**
 *  转圈动画
 *
 */
//- (void)spinWithOptions:(UIViewAnimationOptions)options {
//    
//    [UIView animateWithDuration:3.0f delay:0.0 options:options animations:^{
//        _circleImgView.transform = CGAffineTransformRotate(_circleImgView.transform, M_PI_2);
//    } completion:^(BOOL finished) {
//        if (finished) {
//            if (_animating) {
//                [self spinWithOptions:UIViewAnimationOptionCurveLinear];
//            }else {
//                [self spinWithOptions:UIViewAnimationOptionCurveEaseOut];
//            }
//        }
//    }];
//}

/**
 *  开始
 */
- (void)startSpin {
    
#pragma mark - 不能使用NSDefaultRunLoopMode，否则会出现与UIScrollView/UITableView的动画冲突，因为UIScrollView/UITableView的runloop就使用这个默认模式。
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
//    if (!_animating) {
//        _animating = YES;
//        [self spinWithOptions:UIViewAnimationOptionCurveEaseIn];
//    }
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        ZGCPlayViewController *playVC = [[ZGCPlayViewController alloc]init];
//        ZGCNavigationController *nav = [[ZGCNavigationController alloc]initWithRootViewController:playVC];
//        [self presentViewController:nav animated:YES completion:^{}];
//        
//        playVC.playVCDismissNotification = ^{
//            [self paused];
//        };
//    });
    
}

//- (void)stopSpin {
//    _animating = NO;
//}

- (CADisplayLink *)link
{
    if (!_link) {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(up)];
    }
    return _link;
}

- (void)up
{
    // 1/60秒 * 45
    // 规定时间内转动的角度 == 时间 * 速度
//    if (_link.paused) {
//        _link.paused = NO;
//    }else {
        CGFloat ang = self.link.duration * M_PI_4/2;
        _circleImgView.transform = CGAffineTransformRotate(_circleImgView.transform, ang);
//    }
}

- (void)paused {
    _link.paused = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
