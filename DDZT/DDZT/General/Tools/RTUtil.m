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

@end
