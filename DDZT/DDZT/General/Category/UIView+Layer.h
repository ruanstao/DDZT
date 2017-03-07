//
//  UIView+WSK.h
//  CorePlotDemo
//
//  Created by Koson on 15-2-9.
//  Copyright (c) 2015年 JJSHome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Layer)

/**
 *  产生一个Image的倒影，并把这个倒影图片加在一个View上面。
 *  image:被倒影的原图。
 *  frame:盖在上面的图。
 *  opacity:倒影的透明度，0为完全透明，即倒影不可见;1为完全不透明。
 *  view:倒影加载在上面。
 *  产生倒影后的View。
 */
+ (UIView *)reflectImage:(UIImage *)image withFrame:(CGRect)frame opacity:(CGFloat)opacity atView:(UIView *)view;

//开始和停止旋转动画
- (void)startRotationAnimatingWithDuration:(CGFloat)duration;
- (void)stopRotationAnimating;

//暂停恢复动画
- (void)pauseAnimating;
- (void)resumeAnimating;

@end
