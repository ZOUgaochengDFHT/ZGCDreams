//
//  Utils.h
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/25.
//  Copyright © 2016年 like. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

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
                            labelWidth:(CGFloat)labelWidt;
@end
