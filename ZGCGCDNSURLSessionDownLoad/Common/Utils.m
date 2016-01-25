//
//  Utils.m
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/25.
//  Copyright © 2016年 like. All rights reserved.
//

#import "Utils.h"

@implementation Utils

/**
 * 根据UILabel的内容和字体大小获取内容高度
 *
 *  @param fontSize   字体
 *  @param contentStr 内容
 *  @param labelWidth UILabel的宽度
 *
 *  @return 内容高度
 */
+ (CGFloat)setLabelHeightFitToFontSize:(CGFloat)fontSize
                            contentStr:(NSString*)contentStr
                            labelWidth:(CGFloat)labelWidth {
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    
    CGRect boundingRect = [contentStr boundingRectWithSize:CGSizeMake(labelWidth, 4200)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:attributes context:nil];
    return boundingRect.size.height;
}
@end
