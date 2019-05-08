//
//  WebViewController.m
//  WKTest
//
//  Created by ox Ho on 2019/4/26.
//  Copyright © 2019年 oxho. All rights reserved.
//

#import "WebViewController.h"
#import <WebViewJavascriptBridge.h>
#import <WebKit/WebKit.h>
#import <SVProgressHUD.h>
#import "ZYSpreadButton.h"
@interface WebViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) WebViewJavascriptBridge *wjb;
@property (nonatomic, strong) ZYSpreadButton *spreadButton;//objc


@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [SVProgressHUD showWithStatus:@""];
    [self setupUI];
}

- (void)setupUI{
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
    WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
    [wkUController addUserScript:wkUScript];
    configuration.userContentController = wkUController;
    CGFloat Screen_Height = CGRectGetHeight(self.view.frame);
    CGFloat Screen_Width = CGRectGetWidth(self.view.frame);
    CGFloat heightt = 20;
    CGFloat tabbarheightt = 0;
    if (Screen_Height >= 812) {
        heightt += 20;
        tabbarheightt = 40;
    }
//    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, heightt, Screen_Width, Screen_Height-tabbarheightt-heightt) configuration:configuration];
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, heightt, Screen_Width, Screen_Height - tabbarheightt -heightt)];
//    self.webView.UIDelegate = self;
    self.webView.delegate = self;
//    self.webView.navigationDelegate = self;

//    [self.view addSubview:self.webView];
    [self.view addSubview:self.webView];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.urlString]];
    [self.webView loadRequest:request];
    
    if (self.suspendBtn) {
        [self runWithObjcCode];
    }
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"index.html" withExtension:nil];;
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.urlString]];
//    [self.webView loadRequest:request];
//
//    self.wjb = [WebViewJavascriptBridge bridgeForWebView:self.webView];
//
//
//    [self.wjb setWebViewDelegate:self];
    
//    __weak __typeof__(self) weakSelf = self;
//#pragma mark - 首页
//    [self.wjb registerHandler:@"jumpToHome" handler:^(id data, WVJBResponseCallback responseCallback) {
//        [weakSelf jumpToHome];
//    }];
//#pragma mark - 返回
//    [self.wjb registerHandler:@"jumpToBack" handler:^(id data, WVJBResponseCallback responseCallback) {
//        [weakSelf jumpToBack];
//    }];
//#pragma mark - 刷新
//    [self.wjb registerHandler:@"refreshThePage" handler:^(id data, WVJBResponseCallback responseCallback) {
//        [weakSelf refreshThePage];
//    }];
//#pragma mark - 清除
//    [self.wjb registerHandler:@"clearAllUIWebViewData" handler:^(id data, WVJBResponseCallback responseCallback) {
//        [weakSelf clearAllUIWebViewData];
//    }];
//#pragma mark - 跳转
//    [self.wjb registerHandler:@"openWebPage" handler:^(id data, WVJBResponseCallback responseCallback) {
//        [weakSelf openWebPageWithUrlStr:(NSString *)data];
//    }];
//    if (self.suspendBtn) {
//        [self runWithObjcCode];
//    }
    
}


- (void)runWithObjcCode{
    //    let zySpreadButton = ZYSpreadButton(backgroundImage: UIImage(named: "powerButton"), highlight: UIImage(named: "powerButton_highlight"), position: CGPoint(x: 40, y: UIScreen.main.bounds.height - 40))
//    let btn1 = ZYSpreadSubButton(backgroundImage: UIImage(named: "clock"), highlight: UIImage(named: "clock_highlight")) { (index, sender) -> Void in
//        print("第\(index+1)个按钮被按了")
//    }
    
    __weak typeof(self) __weakSelf = self;
    ZYSpreadSubButton *btn1 = [[ZYSpreadSubButton alloc]initWithBackgroundImage:[UIImage imageNamed:@"shower"] highlightImage:[UIImage imageNamed:@"shower_highlight"] clickedBlock:^(int index, UIButton *sender) {
        NSLog(@"%d,被点击了",index + 1);
        [__weakSelf jumpToHome];
    }];
    ZYSpreadSubButton *btn2 = [[ZYSpreadSubButton alloc]initWithBackgroundImage:[UIImage imageNamed:@"service"] highlightImage:[UIImage imageNamed:@"service_highlight"] clickedBlock:^(int index, UIButton *sender) {
        NSLog(@"%d,被点击了",index + 1);
        [__weakSelf jumpToBack];
    }];
    ZYSpreadSubButton *btn3 = [[ZYSpreadSubButton alloc]initWithBackgroundImage:[UIImage imageNamed:@"juice"] highlightImage:[UIImage imageNamed:@"juice_highlight"] clickedBlock:^(int index, UIButton *sender) {
        NSLog(@"%d,被点击了",index + 1);
        [__weakSelf refreshThePage];
    }];
    ZYSpreadSubButton *btn4 = [[ZYSpreadSubButton alloc]initWithBackgroundImage:[UIImage imageNamed:@"pencil"] highlightImage:[UIImage imageNamed:@"pencil_highlight"] clickedBlock:^(int index, UIButton *sender) {
        NSLog(@"%d,被点击了",index + 1);
        [self clearAllUIWebViewData];
    }];
    
    ZYSpreadButton *zySpreadButton = [[ZYSpreadButton alloc] initWithBackgroundImage:[UIImage imageNamed:@"mainBtn"] highlightImage:[UIImage imageNamed:@"mainBtn_highlight"] position:CGPointMake(40, UIScreen.mainScreen.bounds.size.height - 80)];
    //    self.zySpreadButton = zySpreadButton;
    self.spreadButton = zySpreadButton;
    zySpreadButton.subButtons = @[btn1,btn2,btn3,btn4];
    zySpreadButton.mode = SpreadModeSickleSpread;
    zySpreadButton.direction = SpreadDirectionRightUp;
    zySpreadButton.radius = 120;
    zySpreadButton.positionMode = SpreadPositionModeFixed;
    zySpreadButton.buttonWillSpreadBlock = ^(ZYSpreadButton *spreadButton) {
        
    };
    zySpreadButton.buttonDidSpreadBlock = ^(ZYSpreadButton *spreadButton) {
        
    };
    zySpreadButton.buttonWillCloseBlock = ^(ZYSpreadButton *spreadButton) {
        
    };
    zySpreadButton.buttonDidCloseBlock = ^(ZYSpreadButton *spreadButton) {
        
    };
    if (zySpreadButton != nil) {
        [self.view addSubview:zySpreadButton];
    }
    
    zySpreadButton.positionMode = SpreadPositionModeTouchBorder;
    
}
#pragma mark - WebView
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [SVProgressHUD dismiss];
}


#pragma mark - WKWebView
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
    // 禁止放大缩小
    NSString *injectionJSString = @"var script = document.createElement('meta');"
    "script.name = 'viewport';"
    "script.content=\"width=device-width, initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0, user-scalable=no\";"
    "document.getElementsByTagName('head')[0].appendChild(script);";
    [webView evaluateJavaScript:injectionJSString completionHandler:nil];
    [SVProgressHUD dismiss];
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSString*urlString = navigationAction.request.URL.absoluteString;

    
    // 必须实现decisionHandler的回调，否则就会报错
    if (navigationAction.navigationType == WKNavigationTypeLinkActivated) {
        decisionHandler(WKNavigationActionPolicyCancel);
            if ( [urlString containsString:self.keyA] || [urlString containsString:self.keyB]) {
        //         [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:NULL completionHandler:^(BOOL success) {
                }];
            }else if ( [urlString containsString:self.keyC] ){
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:NULL completionHandler:^(BOOL success) {
                }];
            }
        NSLog(@"WKNavigationActionPolicyCancel");
    } else {
            if ([urlString containsString:self.keyA] || [urlString containsString:self.keyB] ) {
        //         [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:NULL completionHandler:^(BOOL success) {
                }];
            }else if ([urlString containsString:self.keyC]  ){
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:NULL completionHandler:^(BOOL success) {
                }];
            }
        decisionHandler(WKNavigationActionPolicyAllow);
        NSLog(@"WKNavigationActionPolicyAllow");
    }

}
//首页
- (void)jumpToHome{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.urlString]];
    [self.webView loadRequest:request];
    NSLog(@"-- %@ ---",NSStringFromSelector(_cmd));
}


//返回
- (void)jumpToBack{
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }
    NSLog(@"-- %@ ---",NSStringFromSelector(_cmd));
}
//刷新
- (void)refreshThePage{
    [self.webView reload];
    NSLog(@"-- %@ ---",NSStringFromSelector(_cmd));
}

//清除缓存
- (void)clearAllUIWebViewData{
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [self clearCache];
    NSLog(@"-- %@ ---",NSStringFromSelector(_cmd));
}


//跳转
- (void)openWebPageWithUrlStr:(NSString *)urlStr{
    
    /**
     ios 9 之前使用
     openURL:打开的网址
     **/
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlStr]];
    
    /**
     ios 10 以后使用  openURL: options: completionHandler:
     这个函数异步执行，但在主队列中调用 completionHandler 中的回调
     openURL:打开的网址
     options:用来校验url和applicationConfigure是否配置正确，是否可用。
     唯一可用@{UIApplicationOpenURLOptionUniversalLinksOnly:@YES}。
     不需要不能置nil，需@{}为置空。
     ompletionHandler:如不需要可置nil
     **/
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlStr] options:@{} completionHandler:^(BOOL success) {
        
    }];
    NSLog(@"-- %@ ---,urlStr = %@",NSStringFromSelector(_cmd),urlStr);
}


- (void)clearCache {
    /* 取得Library文件夹的位置*/
    NSString *libraryDir = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES)[0];
    /* 取得bundle id，用作文件拼接用*/
    NSString *bundleId  =  [[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleIdentifier"];
    /*
     * 拼接缓存地址，具体目录为App/Library/Caches/你的APPBundleID/fsCachedData
     */
    NSString *webKitFolderInCachesfs = [NSString stringWithFormat:@"%@/Caches/%@/fsCachedData",libraryDir,bundleId];
    
    NSError *error;
    /* 取得目录下所有的文件，取得文件数组*/
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //    NSArray *fileList = [[NSArray alloc] init];
    //fileList便是包含有该文件夹下所有文件的文件名及文件夹名的数组
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:webKitFolderInCachesfs error:&error];
    /* 遍历文件组成的数组*/
    for(NSString * fileName in fileList){
        /* 定位每个文件的位置*/
        NSString * path = [[NSBundle bundleWithPath:webKitFolderInCachesfs] pathForResource:fileName ofType:@""];
        /* 将文件转换为NSData类型的数据*/
        NSData * fileData = [NSData dataWithContentsOfFile:path];
        /* 如果FileData的长度大于2，说明FileData不为空*/
        if(fileData.length >2){
            /* 创建两个用于显示文件类型的变量*/
            int char1 =0;
            int char2 =0;
            
            [fileData getBytes:&char1 range:NSMakeRange(0,1)];
            [fileData getBytes:&char2 range:NSMakeRange(1,1)];
            /* 拼接两个变量*/
            NSString *numStr = [NSString stringWithFormat:@"%i%i",char1,char2];
            /* 如果该文件前四个字符是6033，说明是Html文件，删除掉本地的缓存*/
            if([numStr isEqualToString:@"6033"]){
                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/%@",webKitFolderInCachesfs,fileName]error:&error];
                continue;
            }
        }
    }
}
@end
