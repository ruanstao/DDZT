//
//  UIImage+Rendering.h
//  VEBLIFE
//
//  Created by Rex on 15/12/15.
//  Copyright © 2015年 Rex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Rendering)

/**
 *  获取图片并设置渲染模式
 *  @param name 图片名称  @param rendering 渲染模式
 */
+ (UIImage *)imageNamed:(NSString *)name renderingMode:(UIImageRenderingMode)rendering;

/**
 *  获取不渲染的图片
 *  @param name 图片名
 */
+ (UIImage *)disableRederingImageNamed:(NSString *)name;

/**
 *  从某个视图上获取Image
 *  @param view 某视图
 */
+ (UIImage *)captureImageFromView:(UIView *)view;

/**
 *  在某个图片上放一个其他小图片
 *  @param resizedImage 被放置的小图
 */
- (UIImage *)addlogoImage:(UIImage *)resizedImage;

/**
 *  创建并将图片缩放到所需要的大小
 *  @param image 进行操作的图片  @param size 缩放的大小
 */
+ (UIImage *)scaleFromImage:(UIImage *) image toSize:(CGSize) size;

/**
 *  屏幕截屏
 */
UIImage * screenshot(UIView *view);

@end
