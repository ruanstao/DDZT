//
//  LoginVM.h
//  DDZT
//
//  Created by RuanSTao on 2017/3/7.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSAKeyModel.h"
#import "UserModel.h"
#import "TokenModel.h"

typedef enum : NSUInteger {
    GetSMSForLogin = 1,//1,获取注册验证码 2,找回密码
    GetSMSForFindPwd = 2,
} GetSMSType;

@interface LoginVM : NSObject


/**
 获取rsa秘钥
 */
+ (void)getKeyPairWithPhone:(NSString *)phoneNum completion:(void(^)(BOOL finish, id obj))completion;

/**
 登录
 */
+ (void)loginWithPhone:(NSString *)phoneNum passWord:(NSString *)pwd completion:(void(^)(BOOL finish, id obj))completion;

/**
 注册
 */
+ (void)registerWithPhone:(NSString *)phoneNum captchaNumber:(NSString *)capt passWord:(NSString *)pwd completion:(void(^)(BOOL finish, id obj))completion;

/**
 获取验证码
 */
+ (void)getSMSWithPhone:(NSString *)string andType:(GetSMSType)type completion:(void(^)(BOOL finish, id obj))completion;

/**
 获取token
 */
+ (void)getTokenWithPhone:(NSString *)string andPwd:(NSString *)pwd completion:(void(^)(BOOL finish, id obj))completion;

@end
