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
@synthesize titleLabel;
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
    
    titleLabel.font = sysFont(17.0);
    nickNameLabel.font = sysFont(14.0);
    [downloadBtn setImage:PNGImage(@"cell_downloading") forState:UIControlStateHighlighted];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [iconImgView sd_setImageWithURL:[NSURL URLWithString:mediaListModel.coverSmall] placeholderImage:PNGImage(@"sound_default")];
    titleLabel.text = mediaListModel.title;
    nickNameLabel.text = [NSString stringWithFormat:@"by %@", mediaListModel.nickname];
    
    CGFloat rowHeight = [Utils setLabelHeightFitToFontSize:17.0
                                                contentStr:mediaListModel.title
                                                labelWidth:KScreenWidth-155];
    NSArray *contraintsVerticalArr = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[titleLabel]-height-|"
                                                                             options:0
                                                                             metrics:@{@"height":@(100-rowHeight-8)}
                                                                               views:NSDictionaryOfVariableBindings(titleLabel)];
    [self.contentView addConstraints:contraintsVerticalArr];
//    titleLabel.backgroundColor = [UIColor yellowColor];
}

- (IBAction)download:(UIButton *)sender {
    MYLog(@"sender.state :%lu", (unsigned long)sender.state);
}
@end
