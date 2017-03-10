//
//  AppDelegate+Supplement.m
//  JJSMOA
//
//  Created by Rex@JJS on 2016/10/15.
//  Copyright © 2016年 JJSHome. All rights reserved.
//


#import "AppDelegate+Supplement.h"
#import "AppDelegate+JPush.h"
#import "RSAEncryptor.h"


@implementation AppDelegate (Supplement)

- (void)loadRSAKey
{

}
//- (void)launchTabBarController {
//    NSString *workNo = [[NSUserDefaults standardUserDefaults] objectForKey:MOA_Uset_WorkerNo];
//    if ([MOAConfig sharedInstance].isLogined && [PublicTools judgeStringNotEmpty:workNo]) {
//        [self setupViewControllers];
//        
//        //获取所有省市区县的数据
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            [[ApproveVM alloc]getAllCityAreaData:^(BOOL finish, id obj) {
//                if (finish) {
//                    if ([obj isKindOfClass:[NSDictionary class]]) {
//                        NSArray *arr = [obj objectForKey:@"data"];
//                        if (arr) {
//                            [[NSUserDefaults standardUserDefaults]setObject:arr forKey:@"CityArray"];
//                        }
//                    }
//                }
//            }];
//        });
//        
//    } else {
//        LoginVC *loginVC = [[LoginVC alloc] init];
////        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
//        self.window.rootViewController = loginVC;
//    }
//    
//}
//
//#pragma mark - Tab Bar Methods
//- (void)setupViewControllers {
//
//    NTESSessionListViewController *chatViewController = [[NTESSessionListViewController alloc]init];
//    UINavigationController *chatNavigationController = [[UINavigationController alloc] initWithRootViewController:chatViewController];
//
//    CooprateViewController *firstViewController = [[CooprateViewController alloc] init];
//    UINavigationController *firstNavigationController = [[UINavigationController alloc]
//                                                         initWithRootViewController:firstViewController];
//    
//    QuickTabViewController *secondViewController = [[QuickTabViewController alloc] init];
//    UINavigationController *secondNavigationController = [[UINavigationController alloc]
//                                                          initWithRootViewController:secondViewController];
//    
//    ThirdTabVC *thirdViewController = [[ThirdTabVC alloc] init];
//    UINavigationController *thirdNavigationController = [[UINavigationController alloc]
//                                                         initWithRootViewController:thirdViewController];
//    
//    MailListVC *mailViewController = [[MailListVC alloc] init];
//    UINavigationController *mailNavigationController = [[UINavigationController alloc]
//                                                        initWithRootViewController:mailViewController];
//    
//    self.tabBarController = [[RDVTabBarController alloc] init];
//    [self.tabBarController setViewControllers:@[chatNavigationController,firstNavigationController, secondNavigationController,mailNavigationController,thirdNavigationController]];
//    
//    UINavigationController *navRDTController = [[UINavigationController alloc] initWithRootViewController:self.tabBarController];
//    self.window.rootViewController = navRDTController;
//    
//    [self customizeTabBarForController:self.tabBarController];
//    [self.tabBarController setSelectedIndex:1];
//    [self setupUnreadMessageCount];
//    [self setupUnreadInviteCount];
//}
//
//
//// 统计未读消息数
//- (void)setupUnreadMessageCount
//{
//    
//    NSInteger sessionUnreadCount  = [NIMSDK sharedSDK].conversationManager.allUnreadCount;
//    RDVTabBarItem *item = [self.tabBarController.tabBar.items objectAtIndex:0];
//    if (sessionUnreadCount > 0) {
//        item.badgeValue = [NSString stringWithFormat:@"%i",(int)sessionUnreadCount];
//        if (sessionUnreadCount > 99) {
//            item.badgeValue = [NSString stringWithFormat:@"99"];
//        }
//    }else{
//        item.badgeValue = nil;
//    }
//    
//    UIApplication *application = [UIApplication sharedApplication];
//    [application setApplicationIconBadgeNumber:sessionUnreadCount];
//}
//
//// 统计未读群邀请数量
//- (void)setupUnreadInviteCount
//{
//    NSInteger sessionUnreadCount  = [self notificationCount];
//    RDVTabBarItem *item = [self.tabBarController.tabBar.items objectAtIndex:3];
//    if (sessionUnreadCount > 0) {
//        item.badgeValue = [NSString stringWithFormat:@"%i",(int)sessionUnreadCount];
//        if (sessionUnreadCount > 99) {
//            item.badgeValue = [NSString stringWithFormat:@"99"];
//        }
//    }else{
//        item.badgeValue = nil;
//    }
//}
//
//-(NSInteger)notificationCount{
//    NSInteger count = 0;
//    id<NIMSystemNotificationManager> systemNotificationManager = [[NIMSDK sharedSDK] systemNotificationManager];
//    NSArray *notifications = [systemNotificationManager fetchSystemNotifications:nil
//                                                                           limit:100];
//    if(notifications.count > 0 ){
//        for (NIMSystemNotification *notificate in notifications) {
//            if(notificate.handleStatus == 0 && notificate.type == NIMSystemNotificationTypeTeamInvite){
//                count ++ ;
//            }
//        }
//        
//    }
//    return count;
//}
//
//- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
//    NSArray *tabBarItemImages = @[@"messageNew",@"Mino", @"tab_icon_M",@"list", @"Me"];
//    NSArray *tabBarItemTitle = @[@"消息",@"协作", @"",@"通讯录", @"我的"];
//    
//    int index = 0;
//    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
//        //设置tab item的title
//        [item setTitle:[tabBarItemTitle objectAtIndex:index]];
//
//        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
//                                                      [tabBarItemImages objectAtIndex:index]]];
//        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
//                                                        [tabBarItemImages objectAtIndex:index]]];
//        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
//        
//        index++;
//    }
//}
//
/////**
//// *  退出登录
//// */
////- (void)goLoginViewController
////{
////    //移除登录数据
////    [MOAConfig sharedInstance].userModel = nil;
////    //状态非登录
////    [MOAConfig sharedInstance].isLogined = NO;
////    PUBLICREMOVEOBJECTFORKEY(MOA_User_Cache);
////    // 配置JPush
////    [self configureJPushAlias];
////    [[AppDelegate shareAppDelegate].timer setFireDate:[NSDate distantFuture]];
////    
////    [[[NIMSDK sharedSDK] loginManager] logout:^(NSError *error)
////     {
////         extern NSString *NTESNotificationLogout;
////         [[NSNotificationCenter defaultCenter] postNotificationName:NTESNotificationLogout object:nil];
////     }];
//////    [[NIMSDK sharedSDK].loginManager logout:nil];
//////    LoginVC *loginVC = [[LoginVC alloc] init];
//////    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
//////    self.window.rootViewController = nav;
////}
//
//#pragma mark ---判断员工在职状态
///**
// *  应用激活的时,验证登录人员的在职状态，如果离职则需要清除用户信息并强制退出跳转到登录界面
// */
//- (void)checkWorkerSatus
//{
//    [CheckWorkerStatusVM checkWorkerCurrentStatus:^(BOOL finish, id obj) {
//        if (!finish) {
//            [self reLoginViewController];
//        }
//    }];
//}
//
//- (void)launchUmeng {
//    
//    //友盟
//#if 正式环境
//    NSString * appKey = UMeng_Key;
//#else
//    NSString * appKey = @"581160034544cb178b00148a";
//#endif
//    
//    [MobClick setAppVersion:XcodeAppVersion];
//    
//    UMAnalyticsConfig *config = [[UMAnalyticsConfig alloc] init];
//    config.appKey = appKey;
//    config.channelId = @"In House";
//    config.ePolicy = BATCH;
//    config.bCrashReportEnabled = YES;
//    
//    [MobClick startWithConfigure:config];
//    
//    // 注册友盟
////    [MobClick setAppVersion:XcodeAppVersion];
////    [MobClick startWithAppkey:UMeng_Key reportPolicy:BATCH   channelId:@"In House"];
//    [MobClick setLogEnabled:YES];
//    //所有ViewController添加友盟访问路径统计方法
//    [JJSAopManager createAllHooks];
//}
//
//- (void)IQKeyboardConfig {
//    
//    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
//}
//
//#pragma mark ----检查更新
//- (void)checkUpdate:(BOOL)show
//{
//    CheckUpdateVM *checkUpdateVM = [[CheckUpdateVM alloc] init];
//    [checkUpdateVM checkUpdateWithCurrentVersionHud:show completion:^(BOOL finish, id obj) {
//        versionModel = obj;
//        [SVProgressHUD dismiss];
//        if (finish) {
//            
//            NSString *titleText = @"发现新版本,是否立即更新";
//            if ([versionModel.data.forceUpdate integerValue] == 1) {
//                forceUpdate = YES;
//                mUpdateAlertView(titleText, versionModel.errorMsg, nil, @"去更新",0x101)
//            }else{
//                mUpdateAlertView(titleText, versionModel.errorMsg, @"立即更新", @"取消",0x102)
//            }
//            
//        } else {
//            if (show) {
//                if ([PublicTools judgeStringNotEmpty:versionModel.errorMsg]) {
//                    [Dialog simpleToast:versionModel.errorMsg];
//                } else {
//                    [Dialog simpleToast:@"暂无更新"];
//                }
//            }
//        }
//    }];
//}
//
//#pragma mark - UIAlertViewDelegate delegate methods
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if((buttonIndex != alertView.cancelButtonIndex && alertView.tag == 0x101) || (buttonIndex == alertView.cancelButtonIndex && alertView.tag == 0x102)){
//        //强制更新
//        //        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:([PublicTools judgeStringNotEmpty:versionModel.data.url.value]?versionModel.data.url.value:[NSString stringWithFormat:@"%@mm/autoLoad.html",PUBLIC_IMAGE_URL])]];
//        
//        NSString * url = [NSString stringWithFormat:@"%@/jjsapp/download.html", PUBLIC_DOMAIN_GZL];
//        
////        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-services://?action=download-manifest&url=https://testssl.jjshome.com/jjsapp/p_cloudoa_3.5.1.plist"]];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:([PublicTools judgeStringNotEmpty:versionModel.data.downloadUrl]? versionModel.data.downloadUrl: url)]];
//    }
//    if (alertView.tag == 0x222) {
//        //移除登录数据
//        [MOAConfig sharedInstance].userModel = nil;
//        //状态非登录
//        [MOAConfig sharedInstance].isLogined = NO;
//        PUBLICREMOVEOBJECTFORKEY(MOA_User_Cache);
//        // 配置JPush
//        [mAppDelegate configureJPushAlias];
//        
//        
//        [[NIMSDK sharedSDK].loginManager logout:^(NSError * _Nullable error) {
//            
//        }];
//        
//        UIApplication *application = [UIApplication sharedApplication];
//        [application setApplicationIconBadgeNumber:0];
//        
//        LoginVC *loginVC = [[LoginVC alloc] init];
//        //        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
//        self.window.rootViewController = loginVC;
//    }
//}
//
//
//- (void)checkUpdate {
//    //检测是否还存在需要强制更新的标识
//    if (forceUpdate) {
//        NSString *titleText = @"发现新版本,是否立即更新";
//        if ([versionModel.data.forceUpdate integerValue] == 1) {
//            mUpdateAlertView(titleText, versionModel.errorMsg, nil, @"去更新",0x101)
//        }else{
//            mUpdateAlertView(titleText, versionModel.errorMsg, @"立即更新", @"取消",0x102)
//        }
//        return;
//    }
//}
//
///**
// *  重新登录
// */
//- (void)reLoginViewController
//{
//    //移除登录数据
//    [MOAConfig sharedInstance].userModel = nil;
//    //状态非登录
//    [MOAConfig sharedInstance].isLogined = NO;
//    PUBLICREMOVEOBJECTFORKEY(MOA_User_Cache);
//    // 配置JPush
//    [mAppDelegate configureJPushAlias];
//
//    
//    [[NIMSDK sharedSDK].loginManager logout:nil];
//    
//    UIApplication *application = [UIApplication sharedApplication];
//    [application setApplicationIconBadgeNumber:0];
//    
//    if (IOS7) {
//        [self performSelector:@selector(pushToLoginVc) withObject:nil afterDelay:2.0];
//    }else{
//        [self pushToLoginVc];
//    }
//}
//
//- (void)pushToLoginVc
//{
//    LoginVC *loginVC = [[LoginVC alloc] init];
////    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
//    self.window.rootViewController = loginVC;
//}
//
//- (void)talkingData
//{
//#if 正式环境
//    [TalkingData sessionStarted:@"F15DFD34DF4846F1846DFC59EC3178F4" withChannelId:@"RuanSTao's Mac"];
//#else
//    [TalkingData sessionStarted:@"EF4BEB2993444E9BBA38DCA8D0A9DCB4" withChannelId:@"RuanSTao's Mac"];
//#endif
//}

@end
