//
//  ZGCMovieAlbumModel.h
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/23.
//  Copyright © 2016年 like. All rights reserved.
//

#import "ZGCBaseModel.h"

@interface ZGCMovieAlbumModel : ZGCBaseModel
/*{
 albumId = 247779;
 avatarPath = "http://fdfs.xmcdn.com/group3/M0A/45/DA/wKgDslM-bfCiXGxNAAMeuR5Dqik196_mobile_small.jpg";
 categoryId = 23;
 categoryName = "\U7535\U5f71";
 coverLarge = "http://fdfs.xmcdn.com/group3/M05/68/83/wKgDslNp4pPjJxjQAAO1So5sJMY264_mobile_large.jpg";
 coverMiddle = "http://fdfs.xmcdn.com/group3/M05/68/83/wKgDslNp4pPjJxjQAAO1So5sJMY264_mobile_meduim.jpg";
 coverOrigin = "http://fdfs.xmcdn.com/group3/M05/68/83/wKgDslNp4pPjJxjQAAO1So5sJMY264.jpg";
 coverSmall = "http://fdfs.xmcdn.com/group3/M05/68/83/wKgDslNp4pPjJxjQAAO1So5sJMY264_mobile_small.jpg";
 coverWebLarge = "http://fdfs.xmcdn.com/group3/M05/68/83/wKgDslNp4pPjJxjQAAO1So5sJMY264_web_large.jpg";
 createdAt = 1396327047000;
 hasNew = 0;
 intro = "\U4e5f\U8bb8\U4f60\U8fd8\U8bb0\U5f97\U4ee5\U524d\U7684\U67d0\U4e2a\U7ecf\U5178\U5f71\U7247\Uff0c\U4e5f\U8bb8\U4f60\U521a\U770b\U8fc7\U67d0\U4e2a\U8ba9\U4f60\U611f\U6168\U7684\U70ed\U6620\U5267\U573a\Uff0c\U4e5f\U8bb8\U4f60\U8fd8\U6ca1\U6765\U7684\U53ca\U6b23\U8d4f\Uff0c\U5149\U5f71\U7559\U58f0\U673a\Uff0c\U7528\U58f0\U97f3\U8fd8\U539f\U753b\U9762\Uff0c\U7528\U8bdd\U8bed\U8868\U8fbe\U60c5\U611f\U3002  \U627f\U5236\U7535\U53f0\Uff1a\U60a0\U7136\U5e7f\U64ad  http://www.ximalaya.com/#/1012412 \U60a0\U7136\U58f0\U97f3\Uff0c\U4f18\U96c5\U751f\U6d3b\Uff0c\U56e0\U4e3a\U52a8\U542c\U624d\U52a8\U5fc3\Uff01";
 introRich = "\U4e5f\U8bb8\U4f60\U8fd8\U8bb0\U5f97\U4ee5\U524d\U7684\U67d0\U4e2a\U7ecf\U5178\U5f71\U7247\Uff0c\U4e5f\U8bb8\U4f60\U521a\U770b\U8fc7\U67d0\U4e2a\U8ba9\U4f60\U611f\U6168\U7684\U70ed\U6620\U5267\U573a\Uff0c\U4e5f\U8bb8\U4f60\U8fd8\U6ca1\U6765\U7684\U53ca\U6b23\U8d4f\Uff0c\U5149\U5f71\U7559\U58f0\U673a\Uff0c\U7528\U58f0\U97f3\U8fd8\U539f\U753b\U9762\Uff0c\U7528\U8bdd\U8bed\U8868\U8fbe\U60c5\U611f\U3002<br>\n\U627f\U5236\U7535\U53f0<span>\Uff1a\U60a0\U7136\U5e7f\U64ad</span><br>\n<span>http://www.ximalaya.com/#/1012412 \U00a0 \U00a0 \U00a0 \U00a0 \U00a0 \U00a0<span>\U60a0\U7136\U58f0\U97f3\Uff0c\U4f18\U96c5\U751f\U6d3b\Uff0c\U56e0\U4e3a\U52a8\U542c\U624d\U52a8\U5fc3\Uff01</span></span>";
 isFavorite = 0;
 isRecordDesc = 1;
 isVerified = 1;
 nickname = "\U90fd\U5e02\U591c\U5f52\U4eba";
 playTimes = 3277160;
 playTrackId = 0;
 serialState = 0;
 serializeStatus = 0;
 shares = 0;
 status = 1;
 tags = "\U90fd\U5e02\U591c\U5f52\U4eba,\U5f71\U89c6,\U4e92\U52a8,\U5a31\U4e50,\U97f3\U4e50";
 title = "\U5149\U5f71\U7559\U58f0\U673a\U3010\U5468\U4e09\U3011";
 tracks = 93;
 uid = 7931125;
 updatedAt = 1453291202000;
 zoneId = 73;
 }*/

@property (nonatomic, copy) NSString *albumId;
@property (nonatomic, copy) NSString *avatarPath;
@property (nonatomic, copy) NSString *categoryId;
@property (nonatomic, copy) NSString *categoryName;
@property (nonatomic, copy) NSString *coverLarge;
@property (nonatomic, copy) NSString *coverMiddle;
@property (nonatomic, copy) NSString *coverOrigin;
@property (nonatomic, copy) NSString *coverSmall;
@property (nonatomic, copy) NSString *coverWebLarge;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *hasNew;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *introRich;
@property (nonatomic, copy) NSString *isFavorite;
@property (nonatomic, copy) NSString *isRecordDesc;
@property (nonatomic, copy) NSString *isVerified;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *playTimes;
@property (nonatomic, copy) NSString *playTrackId;
@property (nonatomic, copy) NSString *serialState;
@property (nonatomic, copy) NSString *serializeStatus;
@property (nonatomic, copy) NSString *shares;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *tags;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *tracks;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *updatedAt;
@property (nonatomic, copy) NSString *zoneId;

@end
