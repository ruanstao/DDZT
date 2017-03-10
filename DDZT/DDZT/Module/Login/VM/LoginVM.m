//
//  LoginVM.m
//  DDZT
//
//  Created by RuanSTao on 2017/3/7.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import "LoginVM.h"

@implementation LoginVM

//获取秘钥
+ (void)getKeyPairWithPhone:(NSString *)phoneNum completion:(void(^)(BOOL finish, id obj))completion
{
    [[Networking sharedInstance] requestDataWithParames:@{@"mobile":phoneNum?:@"",@"test":@"1"} path:GetKeyPairApi  complete:^(id obj) {
        RSAKeyModel *model = [RSAKeyModel mj_objectWithKeyValues:obj];
        if (model.success) {
            return completion(YES,model);
        }else{
            return completion(NO,model);
        }
        
    } fail:^(NSString *error) {
        NSLog(@"%@",error);
    }];
}

//登录
+ (void)loginWithParams:(NSDictionary *)params completion:(void(^)(BOOL finish, id obj))completion
{
    [[Networking sharedInstance] requestDataWithParames:params path:GetKeyPairApi  complete:^(id obj) {
        UserModel *model = [UserModel mj_objectWithKeyValues:obj];
        if (model.success) {
            return completion(YES,model);
        }else{
            return completion(NO,model);
        }
    } fail:^(NSString *error) {
        NSLog(@"%@",error);
    }];
}

+ (void)loginWithPhone:(NSString *)phoneNum passWord:(NSString *)pwd completion:(void(^)(BOOL finish, id obj))completion
{
    [LoginVM getKeyPairWithPhone:phoneNum completion:^(BOOL finish, RSAKeyModel *model) {
        if (finish) {
            NSString *sha1 = [RTUtil sha1:pwd];
            NSString *rsa = [RTUtil encrypString:sha1 withPubKey:model.data.publicKey];
            NSString *base64 = [RTUtil base64EncodeString:rsa];
            [LoginVM loginWithParams:@{@"mobile":phoneNum?:@"",@"pwd":base64?:@""} completion:^(BOOL finish, UserModel *userModel) {
                if (finish) {
                    completion(finish,userModel);
                }
            }];
            
        }
    }];
}


+ (void)getSMSWithPhone:(NSString *)string andType:(GetSMSType)type completion:(void(^)(BOOL finish, id obj))completion
{
//    type 1,获取注册验证码 2,找回密码
    [[Networking sharedInstance] requestDataWithParames:@{@"mobile":string?:@""} path:GetSMSApi  complete:^(id obj) {
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

+ (void)getTokenWithPhone:(NSString *)string andPwd:(NSString *)pwd completion:(void(^)(BOOL finish, id obj))completion
{
    [[Networking sharedInstance] requestDataWithParames:@{@"mobile":string?:@""} path:GetTokenApi  complete:^(id obj) {
        TokenModel *model = [TokenModel mj_objectWithKeyValues:obj];
        if (model.success) {
            return completion(YES,model);
        }else{
            return completion(NO,model);
        }
    } fail:^(NSString *error) {
        NSLog(@"%@",error);
    }];
}

+ (void)registerWithParams:(NSDictionary *)params completion:(void(^)(BOOL finish, id obj))completion
{
    [[Networking sharedInstance] requestDataWithParames:params path:RegisterApi complete:^(id obj) {
        UserModel *model = [UserModel mj_objectWithKeyValues:obj];
        if (model.success) {
            return completion(YES,model);
        }else{
            return completion(NO,model);
        }
    } fail:^(NSString *error) {
        NSLog(@"%@",error);
    }];
}

+ (void)registerWithPhone:(NSString *)phoneNum captchaNumber:(NSString *)capt passWord:(NSString *)pwd completion:(void(^)(BOOL finish, id obj))completion
{
    [LoginVM getKeyPairWithPhone:phoneNum completion:^(BOOL finish, RSAKeyModel *model) {
        if (finish) {
            NSString *sha1 = [RTUtil sha1:pwd];
            NSString *rsa = [RTUtil encrypString:sha1 withPubKey:model.data.publicKey];
            NSString *base64 = [RTUtil base64EncodeString:rsa];
            [LoginVM registerWithParams:@{@"mobile":phoneNum?:@"",@"captcha":capt?:@"",@"pwd":base64?:@""} completion:^(BOOL finish, UserModel *userModel) {
                if (finish) {
                    completion(finish,userModel);
                }
            }];
            
        }
    }];
}
@end

