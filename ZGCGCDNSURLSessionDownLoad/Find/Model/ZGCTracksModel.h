//
//  ZGCTracksModel.h
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/23.
//  Copyright © 2016年 like. All rights reserved.
//

#import "ZGCBaseModel.h"

@interface ZGCTracksModel : ZGCBaseModel

@property (nonatomic, copy) NSString *maxPageId;
@property (nonatomic, copy) NSString *pageId;
@property (nonatomic, copy) NSString *pageSize;
@property (nonatomic, copy) NSString *totalCount;
@property (nonatomic, strong) NSArray *list;
@end
