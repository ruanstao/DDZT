//
//  UITableView+TouchView.m
//  JJSOA
//
//  Created by RuanSTao on 16/7/6.
//  Copyright © 2016年 JJSHome. All rights reserved.
//

#import "UITableView+TouchView.h"
#import <objc/runtime.h>
@implementation UITableView (TouchView)

const char * kTableViewTouchViewKey = "kTableViewTouchViewKey";

- (void)setTouchView:(UIView *)touchView
{
    objc_setAssociatedObject(self, &kTableViewTouchViewKey, touchView, OBJC_ASSOCIATION_ASSIGN);
}

- (UIView *)touchView
{
    UIView *touchView = objc_getAssociatedObject(self, &kTableViewTouchViewKey);
    return touchView;
}

//如果手势在touchView上，则不接收手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (self.touchView) {
        CGPoint point = [touch locationInView:self];
        BOOL pointInside = [self.touchView pointInside:point withEvent:nil];
        if (pointInside) {
            return NO;
        }
    }
    return YES;
}

@end
