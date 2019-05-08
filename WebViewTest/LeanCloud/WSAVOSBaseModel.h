//
//  WSAVOSBaseModel.h
//  WKTest
//
//  Created by ox Ho on 2019/4/25.
//  Copyright © 2019年 oxho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSAVOSModel.h"
#import <YYModel/YYModel.h>
//#import "<#header#>"

NS_ASSUME_NONNULL_BEGIN

@interface WSAVOSBaseModel : NSObject

@property (nonatomic,assign) BOOL isSwitch;//总开关

@property (nonatomic,assign) BOOL isTest;//是否是测试

@property (nonatomic,assign) NSString *keyA;//需要拦截的A
@property (nonatomic,assign) NSString *keyB;//需要拦截的B
@property (nonatomic,assign) NSString *keyC;//需要拦截的C
@property (nonatomic,assign) NSString *keyD;//需要拦截的B
@property (nonatomic,assign) NSString *keyE;//需要拦截的C

@property (nonatomic,assign) BOOL maxVersion;//最高版本号
@property (nonatomic,assign) NSString *baseUrl;

@property (nonatomic,assign) BOOL suspendBtn;
@end

NS_ASSUME_NONNULL_END
