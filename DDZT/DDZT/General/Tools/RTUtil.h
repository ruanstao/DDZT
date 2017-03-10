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

+ (NSString *)encrypString:(NSString *)string;

+ (NSString *)decrypString:(NSString *)string;

@end
