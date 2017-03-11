//
//  RSAKeyModel.h
//  DDZT
//
//  Created by ruanstao on 2017/3/10.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import "BaseModel.h"
@class KeysModel;
@interface RSAKeyModel : BaseModel

@property (nonatomic,strong) KeysModel *data;

@end

@interface KeysModel : JSONModel

@property (nonatomic,strong) NSString *publicKey;
@property (nonatomic,strong) NSString *privateKey;


@end
