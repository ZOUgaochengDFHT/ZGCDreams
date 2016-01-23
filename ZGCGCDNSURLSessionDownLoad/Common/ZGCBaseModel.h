//
//  ZGCBaseModel.h
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/23.
//  Copyright © 2016年 like. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGCBaseModel : NSObject

- (id)initContentWithDic:(NSDictionary *)jsonDic;
- (void)setAttributes:(NSDictionary *)jsonDic;
- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic;

@end
