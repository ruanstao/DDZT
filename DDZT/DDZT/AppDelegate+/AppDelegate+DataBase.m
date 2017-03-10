//
//  AppDelegate+DataBase.m
//  JJSMOA
//
//  Created by Rex@JJS on 2016/10/15.
//  Copyright © 2016年 JJSHome. All rights reserved.
//

#import "AppDelegate+DataBase.h"

@implementation AppDelegate (DataBase)

#pragma mark - 打开本地数据库操作
/**
 *  Description: Initialize database
 *
 *  @return result
 *
 */
//- (void)initDataBase
//{
//    
//    NSString *fileFullName = @"JJSMOA.sqlite";
//    NSString *subDir = nil;
//    
//    // 拷贝本地数据库
//    NSString *DBPath = [PublicTools copyDataBaseWithFileFullName:fileFullName CustomerDir:subDir Override:NO];
//    NSLog(@"DBPath:%@",DBPath);
//    
//    // Copy successfully and sync data from server
//    if (DBPath) {
//        self.queue = [FMDatabaseQueue databaseQueueWithPath:DBPath];
//    
//        //数据库版本控制
//        DictionaryDao *dicDao = [[DictionaryDao alloc] init];
//        NSInteger version = [dicDao checkOutDBVersion];
//        switch (version) {
//            case 0:{
//                [dicDao creatDictionaryTable:^(BOOL finish) {
//                    if (finish) {
//                        NSLog(@"创建表成功");
//                        [dicDao updateDBVersion:1];
//                    }
//                }];
//            }
//            case 1:{
//            }
//            default:
//                break;
//        }
//    }
//}
//
///**
// *  Description: Close database
// */
//- (void)closeDatabase
//{
//    [self.queue close];
//}
//
//- (void)addCatalogsToDatabase
//{
//    
//    [[BaseListVM sharedBaseListVM] initializeBaseData:^(BOOL finish) {
//        
//        if (finish) {
//            NSLog(@"获取城市列表成功");
//        }else{
//            NSLog(@"获取城市列表失败");
//        }
//    }];
//    
//}
//
////处理一些启动数据
//- (void)initData
//{
//    if ([PublicTools judgeNewVersion]) {//是新版本
//        [USER_DEFAULT setBool:NO forKey:Guide_Reminder];
//    }
//}

@end
