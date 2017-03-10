//
//  CommonVM.h
//  DDZT
//
//  Created by ruanstao on 2017/3/10.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonVM : NSObject

+ (void)getCommonInfoCompletion:(void(^)(BOOL finish, id obj))completion;

@end
