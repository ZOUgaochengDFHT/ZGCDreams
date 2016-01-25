//
//  ZGCLiveBlurView.h
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/23.
//  Copyright © 2016年 like. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDKBlurredBackgroundDefaultLevel 0.9f
#define kDKBlurredBackgroundDefaultGlassLevel 0.2f
#define kDKBlurredBackgroundDefaultGlassColor [UIColor whiteColor]

@interface ZGCLiveBlurView : UIImageView

@property (nonatomic, strong) UIImage *originalImage;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, assign) float initialBlurLevel;
@property (nonatomic, assign) float initialGlassLevel;
@property (nonatomic, assign) BOOL isGlassEffectOn;
@property (nonatomic, strong) UIColor *glassColor;

- (void)setBlurLevel:(float)blurLevel;

- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;
@end
