//
//  ZGCMediaListTableViewCell.m
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/25.
//  Copyright © 2016年 like. All rights reserved.
//

#import "ZGCMediaListTableViewCell.h"
#import "ZGCMediaListModel.h"
#import <UIImageView+WebCache.h>
#import <SDWebImageManager.h>
#import "Utils.h"

@implementation ZGCMediaListTableViewCell
@synthesize iconImgView;
@synthesize txtTitleLabel;
@synthesize createdAtLabel;
@synthesize nickNameLabel;
@synthesize downloadBtn;
@synthesize mediaListModel;

- (void)awakeFromNib {
    // Initialization code
    // Get your image somehow
    /**
     *  这种性能不好，推荐最好是是使用一张中间透明的图片覆盖
     */
    [iconImgView.layer setCornerRadius:32.5];
    [iconImgView setClipsToBounds:YES];
    [iconImgView.layer setShouldRasterize:YES];
    [iconImgView.layer setRasterizationScale:[UIScreen mainScreen].scale];
    
    txtTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    txtTitleLabel.font = sysFont(17.0);
    nickNameLabel.font = sysFont(14.0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [iconImgView sd_setImageWithURL:[NSURL URLWithString:mediaListModel.coverSmall] placeholderImage:PNGImage(@"sound_default")];
    txtTitleLabel.text = mediaListModel.title;
    nickNameLabel.text = [NSString stringWithFormat:@"by %@", mediaListModel.nickname];
    
    CGFloat rowHeight = [Utils setLabelHeightFitToFontSize:17.0
                                                contentStr:mediaListModel.title
                                                labelWidth:KScreenWidth-155];
    
    NSDictionary *metrics = @{@"height":@(_rowHeight-rowHeight-6)};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[txtTitleLabel]-height-|"
                                                                   options:0
                                                                   metrics:metrics
                                                                     views:NSDictionaryOfVariableBindings(txtTitleLabel)];
    [self.contentView addConstraints:constraints];
}


- (IBAction)download:(UIButton *)sender {
    MYLog(@"sender.state :%lu", (unsigned long)sender.state);
}
@end
