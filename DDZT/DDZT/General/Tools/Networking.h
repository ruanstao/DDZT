//
//  Networking.h
//  DDZT
//
//  Created by ruanstao on 2017/3/7.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(BOOL success,id obj);
typedef void(^failureBlock)(NSError *error);

@interface Networking : NSObject

+ (id)sharedInstance;
+ (void)startMonitoringNetwork;
+ (BOOL)isNetworkReachable;
//Network Request Method(default is POST)
@property (nonatomic , copy) NSString *httpMethod;

- (void)requestDataWithParames:(NSDictionary *)params path:(NSString*)urlPath complete:(successBlock)success fail:(failureBlock)fail;

@end
