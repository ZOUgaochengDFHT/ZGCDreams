//
//  ViewController.m
//  GCDDownProject
//
//  Created by YeYe on 15/6/11.
//  Copyright (c) 2015年 like. All rights reserved.
//

#import "ViewController.h"

//下载类
#import "LDownRequestObject.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *ImageViewBtn1;
@property (weak, nonatomic) IBOutlet UIButton *ImageViewBtn2;
@property (weak, nonatomic) IBOutlet UIButton *ImageViewBtn3;
@property (weak, nonatomic) IBOutlet UIButton *ImageViewBtn4;
@property (weak, nonatomic) IBOutlet UIButton *ImageViewBtn5;
@property (weak, nonatomic) IBOutlet UIButton *ImageViewBtn6;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //下载进度的回调
    [[LDownRequestObject shareDownRequestObject] setDownFinishBlock:^(NSString *fileUrl, double fileProgress) {
        NSLog(@"fileUrl = %@ ---- %lf",fileUrl,fileProgress);
        if ([fileUrl isEqualToString:@"http://fdfs.xmcdn.com/group15/M0A/C5/89/wKgDZVZnmJbwWHWNADw2DpyRmys673.mp3"]) {
            [self.ImageViewBtn1.titleLabel setText:[NSString stringWithFormat:@"下载进度%f",fileProgress]];
            [self.ImageViewBtn1 setTitle:[NSString stringWithFormat:@"下载进度%f",fileProgress] forState:UIControlStateNormal];
            if (fileProgress == 1) {
                [self.ImageViewBtn1 setTitle:@"下载完成" forState:UIControlStateNormal];
            }else if (fileProgress == -1) {
                [self.ImageViewBtn1 setTitle:@"下载失败" forState:UIControlStateNormal];
            }
        }else if ([fileUrl isEqualToString:@"http://fdfs.xmcdn.com/group13/M06/E6/37/wKgDXVaYkUayidq4ALAUGNTcOAc927.mp3"]) {
            [self.ImageViewBtn2.titleLabel setText:[NSString stringWithFormat:@"下载进度%f",fileProgress]];
            [self.ImageViewBtn2 setTitle:[NSString stringWithFormat:@"下载进度%f",fileProgress] forState:UIControlStateNormal];
            if (fileProgress == 1) {
                [self.ImageViewBtn2 setTitle:@"下载完成" forState:UIControlStateNormal];
            }else if (fileProgress == -1) {
                [self.ImageViewBtn2 setTitle:@"下载失败" forState:UIControlStateNormal];
            }
        }else if ([fileUrl isEqualToString:@"http://fdfs.xmcdn.com/group13/M0B/E6/25/wKgDXlaYkU2yeXDlAFgKI9IgR_E895.mp3"]) {
            [self.ImageViewBtn3.titleLabel setText:[NSString stringWithFormat:@"下载进度%f",fileProgress]];
            [self.ImageViewBtn3 setTitle:[NSString stringWithFormat:@"下载进度%f",fileProgress] forState:UIControlStateNormal];
            if (fileProgress == 1) {
                [self.ImageViewBtn3 setTitle:@"下载完成" forState:UIControlStateNormal];
            }else if (fileProgress == -1) {
                [self.ImageViewBtn3 setTitle:@"下载失败" forState:UIControlStateNormal];
            }
        }else if ([fileUrl isEqualToString:@"http://fdfs.xmcdn.com/group9/M06/E0/70/wKgDZlaPGWbSZ8DZAH9Y_fVmkO4446.mp3"]) {
            [self.ImageViewBtn4.titleLabel setText:[NSString stringWithFormat:@"下载进度%f",fileProgress]];
            [self.ImageViewBtn4 setTitle:[NSString stringWithFormat:@"下载进度%f",fileProgress] forState:UIControlStateNormal];
            if (fileProgress == 1) {
                [self.ImageViewBtn4 setTitle:@"下载完成" forState:UIControlStateNormal];
            }else if (fileProgress == -1) {
                [self.ImageViewBtn4 setTitle:@"下载失败" forState:UIControlStateNormal];
            }
        }else if ([fileUrl isEqualToString:@"http://fdfs.xmcdn.com/group15/M00/DF/02/wKgDZVaPGW6wDCPsAD-slQuadBU678.mp3"]) {
            [self.ImageViewBtn5.titleLabel setText:[NSString stringWithFormat:@"下载进度%f",fileProgress]];
            [self.ImageViewBtn5 setTitle:[NSString stringWithFormat:@"下载进度%f",fileProgress] forState:UIControlStateNormal];
            if (fileProgress == 1) {
                [self.ImageViewBtn5 setTitle:@"下载完成" forState:UIControlStateNormal];
            }else if (fileProgress == -1) {
                [self.ImageViewBtn5 setTitle:@"下载失败" forState:UIControlStateNormal];
            }
        }else if ([fileUrl isEqualToString:@"http://fdfs.xmcdn.com/group11/M09/CF/4E/wKgDa1aJ8OaB1rGwAGwKIwEDJ2U739.mp3"]) {
            [self.ImageViewBtn6.titleLabel setText:[NSString stringWithFormat:@"下载进度%f",fileProgress]];
            [self.ImageViewBtn6 setTitle:[NSString stringWithFormat:@"下载进度%f",fileProgress] forState:UIControlStateNormal];
            if (fileProgress == 1) {
                [self.ImageViewBtn6 setTitle:@"下载完成" forState:UIControlStateNormal];
            }else if (fileProgress == -1) {
                [self.ImageViewBtn6 setTitle:@"下载失败" forState:UIControlStateNormal];
            }
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//点击按钮下载图片
- (IBAction)startDownAction:(id)sender
{
    switch ([sender tag]) {
        case 100:
        {
            [[LDownRequestObject shareDownRequestObject] addNewDownUrlToDownArrayWithUrl:@"http://fdfs.xmcdn.com/group15/M0A/C5/89/wKgDZVZnmJbwWHWNADw2DpyRmys673.mp3" withFileName:@"音频1" withFileId:1];
        }
            break;
        case 101:
        {
            [[LDownRequestObject shareDownRequestObject] addNewDownUrlToDownArrayWithUrl:@"http://fdfs.xmcdn.com/group13/M06/E6/37/wKgDXVaYkUayidq4ALAUGNTcOAc927.mp3" withFileName:@"音频2" withFileId:2];
        }
            break;
        case 102:
        {
            [[LDownRequestObject shareDownRequestObject] addNewDownUrlToDownArrayWithUrl:@"http://fdfs.xmcdn.com/group13/M0B/E6/25/wKgDXlaYkU2yeXDlAFgKI9IgR_E895.mp3" withFileName:@"音频3" withFileId:3];
        }
            break;
        case 103:
        {
            [[LDownRequestObject shareDownRequestObject] addNewDownUrlToDownArrayWithUrl:@"http://fdfs.xmcdn.com/group9/M06/E0/70/wKgDZlaPGWbSZ8DZAH9Y_fVmkO4446.mp3" withFileName:@"音频4" withFileId:4];
        }
            break;
        case 104:
        {
            [[LDownRequestObject shareDownRequestObject] addNewDownUrlToDownArrayWithUrl:@"http://fdfs.xmcdn.com/group15/M00/DF/02/wKgDZVaPGW6wDCPsAD-slQuadBU678.mp3" withFileName:@"音频5" withFileId:5];
        }
            break;
        case 105:
        {
            [[LDownRequestObject shareDownRequestObject] addNewDownUrlToDownArrayWithUrl:@"http://fdfs.xmcdn.com/group11/M09/CF/4E/wKgDa1aJ8OaB1rGwAGwKIwEDJ2U739.mp3" withFileName:@"音频6" withFileId:6];
        }
            break;
            
        default:
            break;
    }
}

@end
