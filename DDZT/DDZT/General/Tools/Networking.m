//
//  Networking.m
//  DDZT
//
//  Created by ruanstao on 2017/3/7.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import "Networking.h"
#import "AFNetworking.h"
#import <AFNetworkActivityIndicatorManager.h>
@interface Networking ()

@property (nonatomic,strong) AFHTTPSessionManager *httpSessionManager;
//@property (nonatomic,strong) AFURLSessionManager *urlSessionManager;
@end
@implementation Networking
- (id)init
{
    self = [super init];
    if (self) {
        self.httpMethod = @"POST";
    }
    return self;
}

+ (id)sharedInstance
{
    static Networking *sharedNetworking = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedNetworking = [[self alloc] init];
    });
    return sharedNetworking;
}

+ (void)startMonitoringNetwork
{
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSString *message = nil;
        switch (status) {
                
            case AFNetworkReachabilityStatusNotReachable:{
                
                message = [NSString stringWithFormat:@"当前网络不可用"];
                
                break;
                
            }
                
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                
                message = [NSString stringWithFormat:@"当前网络已切换为WiFi"];
                
                break;
                
            }
                
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                
                message = [NSString stringWithFormat:@"当前网络已切换为2G/3G/4G网络"];
                
                break;
                
            }
                
            default:
                
                break;
                
        }
//        [RTUtil  showHUDWithMessage:message autoHide:YES];
    }];
}

+ (BOOL)isNetworkReachable
{
    return ((AFNetworkReachabilityManager *)[AFNetworkReachabilityManager sharedManager]).reachable;
}

- (AFHTTPSessionManager *)httpSessionManager
{
    if (_httpSessionManager) {
        _httpSessionManager = [AFHTTPSessionManager manager];
    }
    return _httpSessionManager;
}
//- (AFURLSessionManager *)urlSessionManager
//{
//    if (_urlSessionManager) {
//        _urlSessionManager = [AFURLSessionManager ];
//    }
//    return _urlSessionManager;
//}

- (void)requestDataWithParames:(NSDictionary *)params path:(NSString*)urlPath complete:(successBlock)success fail:(failureBlock)fail
{

   NSURLSessionDataTask *dataTask =  [self.httpSessionManager dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlPath]] completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
       NSLog(@"response: %@",response);
       NSLog(@"responseObject: %@",responseObject);
       NSLog(@"error: %@",error);
       
    }];
    [dataTask resume];
}

@end
