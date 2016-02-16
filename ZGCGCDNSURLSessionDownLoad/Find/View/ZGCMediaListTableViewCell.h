//
//  ZGCMediaListTableViewCell.h
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/25.
//  Copyright © 2016年 like. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGCMediaListModel;
@interface ZGCMediaListTableViewCell : UITableViewCell

@property (nonatomic, strong) ZGCMediaListModel *mediaListModel;

@property (nonatomic, assign) CGFloat rowHeight;

@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet UILabel *txtTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;

- (IBAction)download:(UIButton *)sender;
@end
