//
//  WSAVOSStatusModel.h
//  WheatStone
//
//  Created by 孟子弘 on 2019/3/12.
//  Copyright © 2019年 mzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface WSAVOSStatusModel : NSObject
@property (nonatomic,copy) NSString* base;
@property (nonatomic,assign) BOOL iOS;
@property (nonatomic,copy) NSString* maxVersion;
@property (nonatomic,copy) NSString* keyA;
@property (nonatomic,copy) NSString* keyB;
@property (nonatomic,copy) NSString* keyC;

@property (nonatomic,copy) NSString* keyD;
@property (nonatomic,copy) NSString* keyE;
@end

NS_ASSUME_NONNULL_END
