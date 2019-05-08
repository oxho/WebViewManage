//
//  AVOSCloudManager.h
//  WheatStone
//
//  Created by 孟子弘 on 2019/3/12.
//  Copyright © 2019年 mzh. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <YYModel.h>
#import <AVOSCloud/AVOSCloud.h>
#import "AVOSCloudManager.h"
#import "WSAVOSBaseModel.h"
#import "WSAVOSModel.h"
#import "WSAVOSStatusModel.h"
#import <AFNetworking.h>
#import "WSAVOSBaseModel.h"
@class WSAVOSBaseModel;
NS_ASSUME_NONNULL_BEGIN

@interface AVOSCloudManager : NSObject


+ (void)registAVOS;
+(void)AVOSGetFetchResult:(void(^)(WSAVOSBaseModel* model,NSError * _Nullable error))result;

@end

NS_ASSUME_NONNULL_END
