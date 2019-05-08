//
//  WSAVOSBaseModel.m
//  WKTest
//
//  Created by ox Ho on 2019/4/25.
//  Copyright © 2019年 oxho. All rights reserved.
//

#import "WSAVOSBaseModel.h"

@implementation WSAVOSBaseModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"TYPEE":@"__type"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"config":[WSAVOSModel class],
             };
    
}
@end
