//
//  AppDelegate.m
//  HXYStudyDemo
//
//  Created by tzsoft on 2017/8/9.
//  Copyright © 2017年 TZSoft. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeTableviewController.h"
#import "CustomNavController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    HomeTableviewController*vc = [[HomeTableviewController alloc]init];
    CustomNavController *nav = [[CustomNavController alloc]initWithRootViewController:vc];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    
    [self setupUMShare];
    return YES;
}

- (void)setupUMShare{

    /* 打开调试日志 */
    [[UMSocialManager defaultManager] openLog:YES];
    
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"1d94d13a0d8ba"];
    
    [self configUSharePlatforms];
    
}

- (void)configUSharePlatforms{

    /*
     设置微信的appKey和appSecret
     [微信平台从U-Share 4/5升级说明]http://dev.umeng.com/social/ios/%E8%BF%9B%E9%98%B6%E6%96%87%E6%A1%A3#1_1
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx5388c37e1dd7fc41" appSecret:@"8d33a3a499f1e50fe5a2096bddf70ee7" redirectURL:nil];
     [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatTimeLine appKey:@"wx5388c37e1dd7fc41" appSecret:@"8d33a3a499f1e50fe5a2096bddf70ee7" redirectURL:nil];
    
     [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1106342460" appSecret:nil redirectURL:nil];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Qzone appKey:@"wx5388c37e1dd7fc41" appSecret:@"8d33a3a499f1e50fe5a2096bddf70ee7" redirectURL:nil];
    
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}



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
