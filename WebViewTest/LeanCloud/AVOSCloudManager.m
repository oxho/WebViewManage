//
//  AVOSCloudManager.m
//  WheatStone
//
//  Created by 孟子弘 on 2019/3/12.
//  Copyright © 2019年 mzh. All rights reserved.
//

//LeanCloudAppkey
#define AVOSCloud_AppKey @"AHTxBOgRBcUslf72A8eDSeuy"

//LeanCloudAppId
#define AVOSCloud_AppId @"WJerhe4jCxibGfqoAfHrEh4W-gzGzoHsz"

//LeanCloudObject_Id
#define AVOSCloud_Object_Id @"5ccfe11dba39c80070edce28"

//LeanCloudClassName
#define AVOSCloud_ClassName @"ios_test"



#import "AVOSCloudManager.h"
#import "WSAVOSModel.h"

@interface AVOSCloudManager()

//@property (nonatomic,assign) BOOL isTest;
//@property (nonatomic,copy) WSAVOSBaseModel* model;


@end

@implementation AVOSCloudManager
static NSString *baseUrl;
static BOOL isSwitch;
static BOOL isTest;
static WSAVOSBaseModel *model;
static AVObject * _Nullable objectt;
//step1 注册Cloud
+(void)registAVOS{
     [AVOSCloud setApplicationId:AVOSCloud_AppId clientKey:AVOSCloud_AppKey];
}




//- (instancetype)init{
//
//    self switchWithIs:<#(BOOL)#>
//}
/*step2
 通过表名（ClassName） 对应ID，获取数据，
 **/
+(void)AVOSGetFetchResult:(void(^)(WSAVOSBaseModel* model,NSError * _Nullable error))result{
    AVObject *objc = [AVObject objectWithClassName:AVOSCloud_ClassName objectId:AVOSCloud_Object_Id];
    
    [objc fetchInBackgroundWithBlock:^(AVObject * _Nullable object, NSError * _Nullable error) {
        if (result) {
            //如果开关打开
            model = [[WSAVOSBaseModel alloc]init];
            NSNumber * isTestNum = object[@"isTest"];
            NSNumber * isSwitchNum = object[@"isSwitch"];
            NSNumber * isSuspendBtnNum = object[@"suspendBtn"];
            model.isTest = [isTestNum boolValue];;
            model.baseUrl = object[@"base"];
            model.isSwitch =  [isSwitchNum boolValue];
             WSAVOSModel* osModel = [NSArray yy_modelArrayWithClass:[WSAVOSModel class] json:[object objectForKey:@"config"]].firstObject;
            model.suspendBtn =  [isSuspendBtnNum boolValue];
            if (model.isTest && model.isSwitch) {
                
//                 NSNumber * isSwitchNum = object[@"isSwitch"];
//                model.isSwitch = osModel.RELEASE
                //内部开关
                if (osModel.RELEASE) {
                    model.isSwitch = osModel.RELEASE;
                    model.baseUrl = osModel.status.lastObject.base;
                    model.keyA = osModel.status.lastObject.keyA;
                    model.keyB = osModel.status.lastObject.keyB;
                    model.keyC = osModel.status.lastObject.keyC;
                    model.keyD = osModel.status.lastObject.keyD;
                    model.keyE = osModel.status.lastObject.keyE;
                    NSLog(@"~");
                }else{
                    model.isSwitch = osModel.RELEASE;
                    NSLog(@"~");
                }
                 result(model,error);
            }else if (model.isTest && !model.isSwitch){
                    model.isTest = [isTestNum boolValue];
                    model.keyA = osModel.status.lastObject.keyA;
                    model.keyB = osModel.status.lastObject.keyB;
                    model.keyC = osModel.status.lastObject.keyC;
                    model.keyD = osModel.status.lastObject.keyD;
                    model.keyE = osModel.status.lastObject.keyE;
                    result(model,error);
            }else{
                    model.keyA = osModel.status.lastObject.keyA;
                    model.keyB = osModel.status.lastObject.keyB;
                    model.keyC = osModel.status.lastObject.keyC;
                    model.keyD = osModel.status.lastObject.keyD;
                    model.keyE = osModel.status.lastObject.keyE;
                
                
                result(model,error);
            }
           
        }
#pragma mark - //调用备用服务器
        if(error){
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/html",@"text/json",@"application/json",@"text/javascript", nil];
            manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
             [manager.requestSerializer setValue:@"application/x-www-form-urlencoded;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//            NSDictionary *mdic = [NSDictionary dictionaryWithObject:@"" forKey:@""];
            NSMutableDictionary *mdic = [NSMutableDictionary dictionary];
            [mdic setObject:AVOSCloud_Object_Id forKey:@"objectId"];
            [mdic setObject:@"1" forKey:@"type"];
            [manager GET:@"http://35.229.186.28:3000/config" parameters:mdic progress:^(NSProgress * _Nonnull downloadProgress) {

            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if ([responseObject[@"code"] isEqualToString:@"200"] ) {
                    
                    WSAVOSModel* osModel = [NSArray yy_modelArrayWithClass:[WSAVOSModel class] json:[responseObject objectForKey:@"config"]].firstObject;
                    //内部开关
                    if (osModel.RELEASE) {
                        model.isSwitch = osModel.RELEASE;
                        model.baseUrl = osModel.status.lastObject.base;
                        model.keyA = osModel.status.lastObject.keyA;
                        model.keyB = osModel.status.lastObject.keyB;
                        model.keyC = osModel.status.lastObject.keyC;
                        model.keyD = osModel.status.lastObject.keyD;
                        model.keyE = osModel.status.lastObject.keyE;

                        NSLog(@"~");
                         result(model,error);
                    }else{
                        model.isSwitch = osModel.RELEASE;
                        NSLog(@"~");
                         result(model,error);
                    }
                   
                    
                    
                }else{
                    model.isSwitch = NO;
                    result(model,error);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                 model.isSwitch = NO;
                result(model,error);
            }];
            
        }
    }];
//        dispatch_group_leave(group);
//    }];
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
//    dispatch_group_notify(group, globalQueue, ^{

}

//判断等级A
//判断开关是否打开
//- (WSAVOSBaseModel *)switchWithIs:(BOOL)isSwitch{
//
//    self.model = [[WSAVOSBaseModel alloc]init];
//    self.model.isSwitch = isSwitch;
//    return self.model;
//}
@end
