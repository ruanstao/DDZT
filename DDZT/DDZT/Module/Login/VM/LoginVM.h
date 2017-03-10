//
//  LoginVM.h
//  DDZT
//
//  Created by RuanSTao on 2017/3/7.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginVM : NSObject

+ (void)loginWithPhone:(NSString *)phoneNum completion:(void(^)(BOOL finish, id obj))completion;

@end
