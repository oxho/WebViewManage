//
//  WSAVOSModel.m
//  WheatStone
//
//  Created by 孟子弘 on 2019/3/12.
//  Copyright © 2019年 mzh. All rights reserved.
//

#import "WSAVOSModel.h"

@implementation WSAVOSModel
- (NSString *)description {
    
    return [self yy_modelDescription];
}

//自定义键值对
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"RELEASE":@"release"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"status":[WSAVOSStatusModel class],
             };
    
}
@end
