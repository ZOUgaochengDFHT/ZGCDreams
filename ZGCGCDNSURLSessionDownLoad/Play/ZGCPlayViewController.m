//
//  ZGCPlayViewController.m
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/22.
//  Copyright © 2016年 like. All rights reserved.
//

#import "ZGCPlayViewController.h"

@interface ZGCPlayViewController ()

@end

@implementation ZGCPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBackBtn];
}

- (void)initBackBtn
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    /**
     *@设置frame只能控制按钮的大小
     */
    backBtn.frame = CGRectMake(0, 0, 18, 18);
    backBtn.transform = CGAffineTransformMakeRotation(-M_PI_2);
    [backBtn setImage:PNGImage(@"icon_back_h") forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    /**
     *@ width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整
     *@  为0；width为正数时，正好相反，相当于往左移动width数值个像素
     */
//    negativeSpacer.width = -10;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, btn_right, nil];
    
}

- (void)backButtonClicked {
    [self dismissViewControllerAnimated:YES
                             completion:^{
        BLOCK_EXEC(_playVCDismissNotification)
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
