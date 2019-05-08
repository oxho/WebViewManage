//
//  LoadingVC.m
//  WKTest
//
//  Created by ox Ho on 2019/4/26.
//  Copyright © 2019年 oxho. All rights reserved.
//

#import "LoadingVC.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "WebViewController.h"
@interface LoadingVC ()
@property (weak, nonatomic) IBOutlet UIButton *retryBtn;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

@end

@implementation LoadingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.retryBtn.hidden = YES;
//    self.activityView.hidden = NO;
    [self.retryBtn addTarget:self action:@selector(retryBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//
     [self requireHost];
}

- (void)requireHost{
    self.retryBtn.hidden = YES;
    self.activityView.hidden = NO;
    __weak typeof(self) __weakSelf = self;
//    [AVOSCloudManager AVOSGetFetchResult:^(WSAVOSBaseModel * _Nonnull model) {
//    [__weakSelf switchWithModel:model];
//        NSLog(@"");
//    }];
    
    [AVOSCloudManager AVOSGetFetchResult:^(WSAVOSBaseModel * _Nonnull model, NSError * _Nullable error) {
        if (error) {
            self.retryBtn.hidden = NO;
            self.activityView.hidden = YES;
        }else{
            
            [__weakSelf switchWithModel:model];
        }
        NSLog(@"");
    }];
}


- (void)switchWithModel:(WSAVOSBaseModel*)model{
    //    CFRunLoopRun();
    self.retryBtn.hidden = YES;
    self.activityView.hidden = NO;
    if (model.isSwitch) {
        //        SFNewWebViewController* webVC = [SFNewWebViewController new];
        //        webVC.urlString = model.status.firstObject.base;
        //        webVC.dataModel = model;
        //        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        //        self.window.rootViewController = webVC;
        
        WebViewController*webVC = [[WebViewController alloc]init];
        webVC.urlString = model.baseUrl;
        webVC.dataModel = model;
        webVC.keyA = model.keyA;
        webVC.keyB = model.keyB;
        webVC.keyC = model.keyC;
        webVC.keyD = model.keyD;
        webVC.keyE = model.keyE;
        webVC.suspendBtn = model.suspendBtn;
        AppDelegate * delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        delegate.window.rootViewController = webVC;
        [delegate.window makeKeyWindow];

    } else {
        //        UITabBarController* tabVC = [[UITabBarController alloc] init];
        //        [tabVC addChildViewController:[SFHomepageViewController new]];
        //        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        //        self.window.rootViewController = tabVC;
        //        [self.window makeKeyAndVisible];
        //
//        ViewController*vc = [ViewController new];
//
//        AppDelegate * delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
//        delegate.window.rootViewController = vc;
//        [delegate.window makeKeyWindow];
        self.retryBtn.hidden = NO;
        self.activityView.hidden = YES;
    }
    
}

- (void)retryBtnClick:(UIButton *)sender{
    
    [self requireHost];
}
@end
