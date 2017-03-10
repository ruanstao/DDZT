//
//  RTUtil.h
//  DDZT
//
//  Created by ruanstao on 2017/3/7.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface RTUtil : NSObject

+ (void)showHudProgeressInView:(UIView *)view;

+ (void)showHudProgeressInView:(UIView *)view andWiatString:(NSString *)string autoHide:(BOOL)needAutoHide;

+ (void)hideHudProgeressInView:(UIView *)view andWiatString:(NSString *)string;

//用本地RSA文件加密
+ (NSString *)encrypString:(NSString *)string;

+ (NSString *)decrypString:(NSString *)string;

+ (NSString *)encrypString:(NSString *)string withPubKey:(NSString *)pubKey;

+ (NSString *)decrypString:(NSString *)string withPriKey:(NSString *)priKey;

//sha1 加密
+ (NSString *)sha1:(NSString *)input;

/**
 base64 加密
 */
+ (NSString *)base64EncodeString:(NSString *)string;
/**
 base64 解密
 */
+ (NSString *)base64DecodeString:(NSString *)string;

@end
