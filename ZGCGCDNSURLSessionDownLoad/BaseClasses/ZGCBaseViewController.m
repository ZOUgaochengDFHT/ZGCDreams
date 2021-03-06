//
//  ZGCBaseViewController.m
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/22.
//  Copyright © 2016年 like. All rights reserved.
//

#import "ZGCBaseViewController.h"
#import "ZGCNavigationController.h"
#import <MBProgressHUD.h>
#import "ZGCDataService.h"

@interface ZGCBaseViewController ()<UIGestureRecognizerDelegate>
{
    MBProgressHUD *_hud;
}
@end

@implementation ZGCBaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma mark --- 因为使用了自定义的pop，需要关闭系统右滑返回手势
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
#pragma mark - 如果添加了这个全局手势，会造成继承ZGCBaseViewController的视图控制器上的UITableView的didSelectRowAtIndexPath的无法调用
    /**
     *@利用手势控制键盘的收起
     */
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self
//                                                                         action:@selector(dismissKeyboard)];
//    [self.view addGestureRecognizer:tap];
    /**
     *@设置controller背景颜色和创建自定义返回按钮
     */
    if (self.navigationController.viewControllers.count > 1) {
        [self initBackBtn];
    }
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
    
   

    /**];
     *    [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]]; 在不做navigationBar的背景图片操作前提下，设置颜色才能起作用
     */
    //去掉导航栏下边的分割线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    //设置状态栏的背景色和字体色
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (self.navigationController.viewControllers.count >= 3) {
        /**
         *  设置导航栏透明
         */
        
        [self setNavTitleColor:[UIColor whiteColor]];

        [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                      forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
        self.navigationController.navigationBar.translucent = YES;
    }else {
        [self setNavTitleColor:[UIColor blackColor]];

        [self.navigationController.navigationBar setBackgroundImage:PNGImage(@"navigationbar_bg_64")
                                                      forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.translucent = NO;
        
    }
}



/**
 *  设置控制器标题颜色
 *
 *  @param color 颜色
 */
- (void)setNavTitleColor:(UIColor*)color {
    [self.navigationController.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName:color}];
}

/**
 *  创建返回按钮
 */
- (void)initBackBtn
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    /**
     *@设置frame只能控制按钮的大小
     */
    NSString *imgNameStr = @"icon_back";
    if (self.navigationController.viewControllers.count == 2) {
        imgNameStr = @"icon_back_h";
    }
    
    backBtn.frame = CGRectMake(0, 0, 18, 18);
    [backBtn setImage:PNGImage(imgNameStr) forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    /**
     *@ width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整
     *@  为0；width为正数时，正好相反，相当于往左移动width数值个像素
     */
    negativeSpacer.width = -10;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, btn_right, nil];
}

/**
 *  返回
 */
- (void)backButtonClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dismissKeyboard {
    
}

/**
 * 添加Loading视图
 *
 *  @param title 提示内容
 */
- (void)showLoadingStatusHUD:(NSString *)title
{
    _hud = [[MBProgressHUD alloc] init];
    [self.view addSubview:_hud];
    _hud.tag = 444;
    _hud.labelText = title;
    _hud.labelFont = sysFont(14.0);

    //    hud.dimBackground = YES;
    //    hud.alpha = 0.5;
    _hud.mode = MBProgressHUDModeIndeterminate;
//    _hud.yOffset = -(KScreenHeight-64-44)/10;
//    hud.margin = [Utils setFontSizeWithMainScreenWidth:8.0]*3;
    
//    hud.labelFont = sysFont([Utils setFontSizeWithMainScreenWidth:14.0]);
    [_hud show:YES];
}
/**
 * 移除视图
 */
- (void)removeHud
{
    [_hud removeFromSuperview];
    _hud = nil;
}

/**
 *  提示
 *
 *  @param title 提示内容
 *  @param image 提示图片
 *  @param delay 提示时间
 */
- (void)showHUD:(NSString *)title
          image:(UIImage*)image
withHiddenDelay:(NSTimeInterval)delay
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    [self.view addSubview:hud];
    
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc]initWithImage:image];
    hud.labelFont = sysFont(14.0);
    hud.labelText = title;
    
    [hud showAnimated:YES whileExecutingBlock:^{
        sleep(delay);
    } completionBlock:^{
        [hud removeFromSuperview];
    }];
}

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
        completionHandler:(ZGCDataRequestCompletionBlock)completionHandler {
    
    /**
     *  提示加载数组中的时候不需要文字提示
     */
    [self showLoadingStatusHUD:statusText];
    
    [ZGCDataService requestWithUrl:url
                        parameters:nil
                 completionHandler:^(id result) {
                     
                     if (result != NULL) {
                         completionHandler(result);
                     }else {
                         [self showHUD:@"网络有点卡" image:nil withHiddenDelay:1.0];
                     }
                     [self removeHud];
                     
                 }];
    
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
