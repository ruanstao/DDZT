//
//  UserModel.h
//  DDZT
//
//  Created by ruanstao on 2017/3/10.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import "BaseModel.h"

@class UserInfo;
@interface UserModel : BaseModel

@property (nonatomic,strong) UserInfo *data;
@end

@interface UserInfo : NSObject

@property (nonatomic,strong) NSString *accountInfo;


@end
