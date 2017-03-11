//
//  RegisteModel.h
//  DDZT
//
//  Created by RuanSTao on 2017/3/11.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import "BaseModel.h"

@class RegisteInfo;
@interface RegisteModel : BaseModel

@property (nonatomic,strong) RegisteInfo *data;
@end

@interface RegisteInfo : NSObject

@property (nonatomic,strong) NSString *captcha;

@end
