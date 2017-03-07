//
//  RTUtil.m
//  DDZT
//
//  Created by ruanstao on 2017/3/7.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import "RTUtil.h"
#import "MBProgressHUD.h"

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

@end
