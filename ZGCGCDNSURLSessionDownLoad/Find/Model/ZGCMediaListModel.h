//
//  ZGCMediaListModel.h
//  GCDDownProject
//
//  Created by GaoCheng.Zou on 16/1/23.
//  Copyright © 2016年 like. All rights reserved.
//

#import "ZGCBaseModel.h"

@interface ZGCMediaListModel : ZGCBaseModel
/*    list =     (


 {
 albumId = 247779;
 albumImage = "http://fdfs.xmcdn.com/group3/M05/68/83/wKgDslNp4pPjJxjQAAO1So5sJMY264_mobile_small.jpg";
 albumTitle = "\U5149\U5f71\U7559\U58f0\U673a\U3010\U5468\U4e09\U3011";
 comments = 8;
 coverLarge = "http://fdfs.xmcdn.com/group9/M08/34/67/wKgDZlWT1iCTIe4sAAO1So5sJMY218_mobile_large.jpg";
 coverMiddle = "http://fdfs.xmcdn.com/group9/M08/34/67/wKgDZlWT1iCTIe4sAAO1So5sJMY218_web_large.jpg";
 coverSmall = "http://fdfs.xmcdn.com/group9/M08/34/67/wKgDZlWT1iCTIe4sAAO1So5sJMY218_web_meduim.jpg";
 createdAt = 1441800000000;
 downloadAacSize = 3225217;
 downloadAacUrl = "http://download.xmcdn.com/group10/M08/6D/20/wKgDaVXv0P7idigZADE2gZMzrqA717.m4a";
 downloadSize = 4336128;
 downloadUrl = "http://download.xmcdn.com/group10/M08/6D/20/wKgDaVXv0PqzaG8SAEIqAGEbi6M550.aac";
 duration = "1044.64";
 isPublic = 1;
 likes = 82;
 nickname = "\U90fd\U5e02\U591c\U5f52\U4eba";
 opType = 1;
 orderNum = 99999999;
 playPathAacv164 = "http://audio.xmcdn.com/group10/M08/6D/19/wKgDZ1Xv0NTBqJk8AIDrd286FQ8673.m4a";
 playPathAacv224 = "http://audio.xmcdn.com/group10/M08/6D/20/wKgDaVXv0P7idigZADE2gZMzrqA717.m4a";
 playUrl32 = "http://fdfs.xmcdn.com/group10/M08/6D/20/wKgDaVXv0QWwQMJ9AD_DGeQhaAU286.mp3";
 playUrl64 = "http://fdfs.xmcdn.com/group16/M09/6D/DE/wKgDbFXv0L_xugc5AH-F9BWK8Kw699.mp3";
 playtimes = 18404;
 processState = 2;
 shares = 0;
 smallLogo = "http://fdfs.xmcdn.com/group3/M0A/45/DA/wKgDslM-bfCiXGxNAAMeuR5Dqik196_mobile_small.jpg";
 status = 1;
 title = "\U5468\U4e09\Uff1a\U300a\U534e\U4e3d\U4e0a\U73ed\U65cf\U300b\U7684\U751f\U6d3b\U4e0e\U751f\U5b58 - \U60a0\U7136\U5e7f\U64ad\U3010\U90fd\U5e02\U591c\U5f52\U4eba\U7b2c407\U671f\U3011";
 trackId = 8681737;
 uid = 7931125;
 userSource = 1;
 }
 );
 maxPageId = 5;
 pageId = 1;
 pageSize = 20;
 totalCount = 93;
 }*/

@property (nonatomic, copy) NSString *albumId;
@property (nonatomic, copy) NSString *albumImage;
@property (nonatomic, copy) NSString *albumTitle;
@property (nonatomic, copy) NSString *comments;
@property (nonatomic, copy) NSString *coverLarge;
@property (nonatomic, copy) NSString *coverMiddle;
@property (nonatomic, copy) NSString *coverSmall;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *downloadAacSize;
@property (nonatomic, copy) NSString *downloadAacUrl;
@property (nonatomic, copy) NSString *downloadSize;
@property (nonatomic, copy) NSString *downloadUrl;
@property (nonatomic, copy) NSString *duration;
@property (nonatomic, copy) NSString *isPublic;
@property (nonatomic, copy) NSString *likes;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *opType;
@property (nonatomic, copy) NSString *orderNum;
@property (nonatomic, copy) NSString *playPathAacv164;
@property (nonatomic, copy) NSString *playPathAacv224;
@property (nonatomic, copy) NSString *playUrl32;
@property (nonatomic, copy) NSString *playUrl64;
@property (nonatomic, copy) NSString *playtimes;
@property (nonatomic, copy) NSString *processState;
@property (nonatomic, copy) NSString *shares;
@property (nonatomic, copy) NSString *smallLogo;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *trackId;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *userSource;
@end
