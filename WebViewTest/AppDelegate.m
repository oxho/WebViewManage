//
//  AppDelegate.m
//  WKTest
//
//  Created by ox Ho on 2019/4/25.
//  Copyright © 2019年 oxho. All rights reserved.
//

#import "AppDelegate.h"

#import "LoadingVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
//    [self.storyboard instantiateViewControllerWithIdentifier:@"MyOrderViewController"]
    
     [AVOSCloudManager registAVOS];
//    __weak typeof(self) __weakSelf = self;
//    [AVOSCloudManager AVOSGetFetchResult:^(WSAVOSBaseModel * _Nonnull model) {
//        [__weakSelf switchWithModel:model];
//        NSLog(@"");
//    }];
    
    
    LoadingVC*vc = [LoadingVC new];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}
//- (void)switchWithModel:(WSAVOSBaseModel*)model{
////    CFRunLoopRun();
//    if (model.isSwitch) {
////        SFNewWebViewController* webVC = [SFNewWebViewController new];
////        webVC.urlString = model.status.firstObject.base;
////        webVC.dataModel = model;
////        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
////        self.window.rootViewController = webVC;
//        
//        WebViewController*vc = [WebViewController new];
//        vc.urlString = model.baseUrl;
//        vc.dataModel = model;
//        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        self.window.rootViewController = vc;
//        [self.window makeKeyAndVisible];
//    } else {
////        UITabBarController* tabVC = [[UITabBarController alloc] init];
////        [tabVC addChildViewController:[SFHomepageViewController new]];
////        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
////        self.window.rootViewController = tabVC;
////        [self.window makeKeyAndVisible];
////
//        ViewController*vc = [ViewController new];
//        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        self.window.rootViewController = vc;
//        [self.window makeKeyAndVisible];
//    }
//    
//}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
