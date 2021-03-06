//
//  CommonVM.m
//  DDZT
//
//  Created by ruanstao on 2017/3/10.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import "CommonVM.h"
#import "LoginViewController.h"
#import "MainTabBarViewController.h"

@implementation CommonVM
+ (void)getCommonInfoCompletion:(void(^)(BOOL finish, id obj))completion
{
    [[Networking sharedInstance] requestDataWithParames:@{@"text":@"1"} path:CommonApi  complete:^(id obj) {
//        picDomain 图片服务器地址
        BaseModel *model = [BaseModel mj_objectWithKeyValues:obj];
        if (model.success) {
            return completion(YES,model);
        }else{
            return completion(NO,model);
        }
        
    } fail:^(NSString *error) {
        NSLog(@"%@",error);
    }];
}

+ (void)loginSuccess
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    transitionFromViewController
    window.rootViewController = [MainTabBarViewController createByNibFile];
}

+ (void)logout
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [LoginViewController createByNibFile];
}

@end
