//
//  ZGCMovieMediaListViewController.m
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/23.
//  Copyright © 2016年 like. All rights reserved.
//

#import "ZGCMovieMediaListViewController.h"
@interface ZGCMovieMediaListViewController ()

@end

@implementation ZGCMovieMediaListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"光影留声机【周三】";
    
//    [self setNavTitleColor:[UIColor whiteColor]];
    
    [self showLoadingStatus:@""
             requestWithUrl:[NSString stringWithFormat:@"%@%@%@", BASEURL, @"1/20?", DEVICECOMPONENT]
                 parameters:nil
          completionHandler:^(id result) {
              MYLog(@"result :%@", result);
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
