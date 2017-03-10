//
//  AppDelegate+JPush.h
//  JJSMOA
//
//  Created by Rex@JJS on 2016/10/15.
//  Copyright © 2016年 JJSHome. All rights reserved.
//

#import "AppDelegate.h"
//#import "JPUSHService.h"
//#import "MOAConfig.h"
//#import <AdSupport/ASIdentifierManager.h>

@interface AppDelegate (JPush)

- (void)launchJPush:(NSDictionary *)launchOptions;

//// 配置JPush
//- (void)configureJPushAlias;
//
//- (void)showMessageWithUserInfo:(NSDictionary *)userInfo state:(NSInteger)state;
//
//- (void)JPush_application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
//
//- (void)JPush_application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;
//
//- (void)JPush_application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;
//
//- (void)JPush_application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

@end
