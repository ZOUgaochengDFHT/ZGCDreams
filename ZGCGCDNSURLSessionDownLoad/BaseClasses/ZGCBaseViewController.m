//
//  ZGCBaseViewController.m
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/22.
//  Copyright © 2016年 like. All rights reserved.
//

#import "ZGCBaseViewController.h"
#import "ZGCNavigationController.h"
@interface ZGCBaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation ZGCBaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma mark --- 因为使用了自定义的pop，需要关闭系统右滑返回手势
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    self.navigationController.navigationBar.translucent = NO;
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

    
    [self.navigationController.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName: [UIColor blackColor]}];
    
    
    //设置导航栏背景图片
    [self.navigationController.navigationBar setBackgroundImage:PNGImage(@"navigationbar_bg_64")
                                                  forBarMetrics:UIBarMetricsDefault];
    /**];
     *    [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]]; 在不做navigationBar的背景图片操作前提下，设置颜色才能起作用
     */
//    //去掉导航栏下边的分割线
//    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    //设置状态栏的背景色和字体色
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}


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

- (void)backButtonClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dismissKeyboard {
    
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
