//
//  AppDelegate+JPush.m
//  JJSMOA
//
//  Created by Rex@JJS on 2016/10/15.
//  Copyright © 2016年 JJSHome. All rights reserved.
//

#import "AppDelegate+JPush.h"

//#import "UIViewController+GetCurrentViewController.h"
//#import "RecommendShopViewController.h"//开铺详情
//#import "MyToDoAndApplyDetailViewController.h"//拓展报告审批详情h5
//#import "MyApplyModel.h"
//
//#import "RegistrationMessageViewController.h"

@implementation AppDelegate (JPush)

// 将得到的deviceToken传给SDK
//- (void)JPush_application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
//    // Required:注册DeviceToken
//    [JPUSHService registerDeviceToken:deviceToken];
//    // 配置JPUSH别名
//    [mAppDelegate configureJPushAlias];
//}
//
//// 注册deviceToken失败，此处失败，一般是环境配置或者证书配置有误
//- (void)JPush_application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
//
//}
//
//- (void)JPush_application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
//    [JPUSHService handleRemoteNotification:userInfo];
//    [self showMessageWithUserInfo:userInfo state:ApplicationLaunchFromStateNormal];
//}
//
//- (void)JPush_application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
//    // IOS 7 Support Required
//    [JPUSHService handleRemoteNotification:userInfo];
//    [self showMessageWithUserInfo:userInfo state:ApplicationLaunchFromStateNormal];
//    completionHandler(UIBackgroundFetchResultNewData);
//}
//
//- (void)launchJPush:(NSDictionary *)launchOptions {
//    
//    BOOL isProduction = YES;   //YES  正式环境。NO：测试环境
//    
////#ifdef RELEASE
//    
////    isProduction = YES;
//
////#endif
//    
//    NSLog(@"[isProduction = %d]", isProduction);
//    
//    float version = [[UIDevice currentDevice].systemVersion floatValue];
//    // 注册JPush
//    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
//    // Required
//    if (version >= 10.0) {
//        JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
//        entity.types = UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound;
//        [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
//    }
//    
//    if (version >= 8.0 || version < 10.0) {
//        //可以添加自定义categories
//        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
//                                                          UIUserNotificationTypeSound |
//                                                          UIUserNotificationTypeAlert)
//                                              categories:nil];
//    }
//    
//    if (version < 8.0) {
//        //categories 必须为nil
//        [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
//                                                          UIRemoteNotificationTypeSound |
//                                                          UIRemoteNotificationTypeAlert)
//                                              categories:nil];
//    }
//    //Required
//    //如需兼容旧版本的方式，请依旧使用[JPUSHService setupWithOption:launchOptions]方式初始化和同时使用pushConfig.plist文件声明appKey等配置内容。
//    static NSString *jpushAppKey = @"e72b09ce53cd32e26f783cc3";//JJS帐号极光推送后台配置的随手考AppKey
//    static NSString *channel = @"iOS InHouse";
//
//    [JPUSHService setupWithOption:launchOptions appKey:jpushAppKey
//                          channel:channel
//                 apsForProduction:isProduction
//            advertisingIdentifier:advertisingId];
//    //清空角标
//    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
//}
//
///**
// * 配置JPush别名
// */
//- (void)configureJPushAlias{
//    NSString *empNumber = [MOAConfig sharedInstance].userModel.workerNo;
//    if (empNumber == nil) {
//        // 当empNumber为空表示用户没有登录，或者已经退出了登录，
//        empNumber = @"";
//    }
//    NSLog(@"--------------------------------------------------设备别名：%@",empNumber);
//    [JPUSHService setAlias:empNumber callbackSelector:@selector(tagsAliasCallback:tags:alias:) object:self];
//}
//
//- (void)tagsAliasCallback:(int)iResCode tags:(NSSet *)tags alias:(NSString *)alias {
//    NSLog(@"rescode: %d, \ntags: %@, \nalias: %@\n", iResCode, tags , alias);
//    if (iResCode != 0 ) {
//        [self performSelector:@selector(configureJPushAlias) withObject:nil afterDelay:10];
//    }
//}
//
//- (void)showMessageWithUserInfo:(NSDictionary *)userInfo state:(NSInteger)state {
//    
//    NSString* strAlert = nil;
//    NSDictionary *apsInfo = [userInfo objectForKey:@"aps"];
//    NSObject *alert = [apsInfo objectForKey:@"alert"];
//    if ([alert isKindOfClass:[NSString class]]) {
//        strAlert = (NSString*)alert;
//    } else if ([alert isKindOfClass:[NSDictionary class]]) {
//        NSDictionary *alertDict = (NSDictionary*)alert;
//        strAlert = [alertDict objectForKey:@"body"];
//    }
//    //    if ([application applicationState] == UIApplicationStateActive && strAlert != nil) {
//    //        mAlertView(@"推送通知", strAlert)
//    NSString *remoteNotificationLaunchInfo = @"通知";
//    //    if (state == ApplicationLaunchFromStateNotificationCenter) {
//    //        remoteNotificationLaunchInfo = @"推送通知－启动自通知栏";
//    //    } else if (state == ApplicationLaunchFromStateNormal) {
//    //        remoteNotificationLaunchInfo = @"推送通知－程序运行中";
//    //    }
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:remoteNotificationLaunchInfo message:strAlert delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"查看", nil];
//    [alertView show];
//    
//    // type 7开店  8 审批代办   否则在线选座
//    if ([userInfo[@"type"] isEqualToString:@"7"]) {
//        
//        RecommendShopViewController *shopVC = [[RecommendShopViewController alloc] init];
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:shopVC];
//        shopVC.id = [userInfo[@"details"] integerValue];
//        shopVC.recommandType = RecommandTypeAtail;
//        
//        [alertView bk_setHandler:^{
//            
//            [[UIViewController getCurrentViewController] presentViewController:nav animated:YES completion:nil];
//            
//        } forButtonAtIndex:1];
//        
//        
//    }else if ([userInfo[@"type"] isEqualToString:@"8"]){
//        
//        NSString *applyId = userInfo[@"applyId"];
//        NSString *detailurl = kMYToDoApplyH5(applyId);
//        MyToDoAndApplyDetailViewController *todo = [[MyToDoAndApplyDetailViewController alloc]initWithDetailUrl:detailurl];
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:todo];
//        
//        [alertView bk_setHandler:^{
//            //取appid
//            [[UIViewController getCurrentViewController] presentViewController:nav animated:YES completion:nil];
//            
//        } forButtonAtIndex:1];
//        
//    }else if ([userInfo[@"type"] isEqualToString:@"1"] || [userInfo[@"type"] isEqualToString:@"2"] || [userInfo[@"type"] isEqualToString:@"3"] || [userInfo[@"type"] isEqualToString:@"4"] || [userInfo[@"type"] isEqualToString:@"5"] || [userInfo[@"type"] isEqualToString:@"6"]){
//    
//        [alertView bk_setHandler:^{
//            
//            RegistrationMessageViewController *messageViewController = [[RegistrationMessageViewController alloc] initWithNibName:@"RegistrationMessageViewController" bundle:[NSBundle mainBundle]];
//            [messageViewController setMessageInfo:userInfo];
//            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:messageViewController];
//            [[UIViewController getCurrentViewController] presentViewController:nav animated:YES completion:nil];
//            
//        } forButtonAtIndex:1];
//    } else {
//        
//    }
//    
//    [UIApplication sharedApplication].applicationIconBadgeNumber = [[apsInfo objectForKey:@"badge"] integerValue];
//}

@end
