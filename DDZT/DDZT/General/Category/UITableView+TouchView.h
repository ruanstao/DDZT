//
//  UITableView+TouchView.h
//  JJSOA
//
//  Created by RuanSTao on 16/7/6.
//  Copyright © 2016年 JJSHome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (TouchView) <UIGestureRecognizerDelegate>

@property (nonatomic,weak)UIView *touchView;

@end
