//
//  TokenModel.h
//  DDZT
//
//  Created by ruanstao on 2017/3/10.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import "BaseModel.h"
@class TokenInfo;
@interface TokenModel : BaseModel

@property (nonatomic,strong) TokenInfo *data;
@end

@interface TokenInfo : NSObject

@property (nonatomic,strong) NSString *token;

@property (nonatomic,assign) long long *time;


@end
