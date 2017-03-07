//
//  UIImage+Rendering.m
//  VEBLIFE
//
//  Created by Rex on 15/12/15.
//  Copyright © 2015年 Rex. All rights reserved.
//

#import "UIImage+Rendering.h"

@implementation UIImage (Rendering)

+ (UIImage *)imageNamed:(NSString *)name renderingMode:(UIImageRenderingMode)rendering
{
    UIImage * image = [[UIImage imageNamed:name] imageWithRenderingMode:rendering];
    return image;
}

+ (UIImage *)disableRederingImageNamed:(NSString *)name
{
    UIImage * image = [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

- (UIImage *)addlogoImage:(UIImage *)resizedImage
{
    UIGraphicsBeginImageContext(self.size);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    UIImage *maskImage  = resizedImage;//[UIImage imageNamed:@"dzh_logo.png"];
    
    [maskImage drawInRect:CGRectMake(0,
                                     64,
                                     maskImage.size.width,
                                     maskImage.size.height)];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
    
}
+ (UIImage *)captureImageFromView:(UIView *)view
{
    
    CGRect screenRect = [view bounds];
    
    UIGraphicsBeginImageContext(screenRect.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:ctx];
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *) scaleFromImage: (UIImage *) image toSize: (CGSize) size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

UIImage * screenshot(UIView *view) {

    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);

    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
