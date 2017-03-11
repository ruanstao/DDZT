//
//  RTUtil.m
//  DDZT
//
//  Created by ruanstao on 2017/3/7.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import "RTUtil.h"
#import "MBProgressHUD.h"
#import "RSAEncryptor.h"
#import <CommonCrypto/CommonDigest.h>
#import "GTMBase64.h"
@implementation RTUtil

+ (void)showHudProgeressInView:(UIView *)view
{
    [RTUtil showHudProgeressInView:view andWiatString:nil autoHide:NO];
}

+ (void)showHudProgeressInView:(UIView *)view andWiatString:(NSString *)string autoHide:(BOOL)needAutoHide
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.text = string;
    if (needAutoHide){
        [hud hideAnimated:YES afterDelay:1.6];
    }
    
}

+ (void)hideHudProgeressInView:(UIView *)view andWiatString:(NSString *)string
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

+ (NSString *)encrypString:(NSString *)string
{
    NSString *pubpath = [[NSBundle mainBundle] pathForResource:@"iOS_public_key" ofType:@"cer"];
    return [RSAEncryptor encryptString: string publicKeyWithContentsOfFile:pubpath];
}

+ (NSString *)decrypString:(NSString *)string
{
    NSString *pripath = [[NSBundle mainBundle] pathForResource:@"iOS_private_key" ofType:@"p12"];
    return [RSAEncryptor decryptString:string privateKeyWithContentsOfFile:pripath password:@"123"];
}

+ (NSString *)encrypString:(NSString *)string withPubKey:(NSString *)pubKey
{
    return [RSAEncryptor encryptString: string publicKey:pubKey];
}

+ (NSString *)decrypString:(NSString *)string withPriKey:(NSString *)priKey
{
    return [RSAEncryptor decryptString:string privateKey:priKey];
}

//sha1加密方式
+ (NSString *)sha1:(NSString *)input
{
    //const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    //NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

+ (NSString *)base64EncodeString:(NSString *)string {
    //1.先把字符串转换为二进制数据
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    //2.对二进制数据进行base64编码，返回编码后的字符串
    return [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}


//对base64编码后的字符串进行解码
+ (NSString *)base64DecodeString:(NSString *)string {
    //1.将base64编码后的字符串『解码』为二进制数据
    NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    //2.把二进制数据转换为字符串返回
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
