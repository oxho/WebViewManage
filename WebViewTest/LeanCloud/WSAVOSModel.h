//
//  WSAVOSModel.h
//  WheatStone
//
//  Created by 孟子弘 on 2019/3/12.
//  Copyright © 2019年 mzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSAVOSStatusModel.h"
#import <YYModel/YYModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface WSAVOSModel : NSObject
@property (nonatomic,copy) NSString* company;
@property (nonatomic,copy) NSString* name;
@property (nonatomic,assign) BOOL RELEASE;
@property (nonatomic,strong) NSArray<WSAVOSStatusModel*>* status;
@property (nonatomic,copy) NSString* umengKey;


@end

NS_ASSUME_NONNULL_END
