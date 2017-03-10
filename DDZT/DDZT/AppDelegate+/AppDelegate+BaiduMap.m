//
//  AppDelegate+BaiduMap.m
//  JJSMOA
//
//  Created by Rex@JJS on 2016/10/15.
//  Copyright © 2016年 JJSHome. All rights reserved.
//

#import "AppDelegate+BaiduMap.h"

@implementation AppDelegate (BaiduMap)

//- (void)launchBaiduMap {
//    
//    // 要使用百度地图，请先启动BaiduMapManager
//    self.mapManager = [[BMKMapManager alloc]init];
//    BOOL b = [self.mapManager start:BaiDu_Key generalDelegate:self];
//    if (!b) {
//        NSLog(@"连接失败");
//    }
//    
//    // update locations
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:LOCATION_UPDATE_FLAG];
//    
//    //定位
//    [BaiDuLocationManager sharedInstance];
//}
//
//- (void)onGetNetworkState:(int)iError
//{
//    if (0 == iError) {
//        NSLog(@"联网成功");
//    }
//    else{
//        NSLog(@"onGetNetworkState %d",iError);
//    }
//    
//}
//
//- (void)onGetPermissionState:(int)iError
//{
//    if (0 == iError) {
//        NSLog(@"授权成功");
//    }
//    else {
//        NSLog(@"onGetPermissionState %d",iError);
//    }
//}

@end
