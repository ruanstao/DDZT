//
//  LoginVM.m
//  DDZT
//
//  Created by RuanSTao on 2017/3/7.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import "LoginVM.h"

@implementation LoginVM

+ (void)loginWithPhone:(NSString *)phoneNum completion:(void(^)(BOOL finish, id obj))completion

{
    
    [[Networking sharedInstance] requestDataWithParames:@{@"phone":phoneNum,@"test":@"1"} path:GetPublicKeyApi  complete:^(id obj) {
        NSLog(@"%@",obj);
    } fail:^(NSString *error) {
        
        NSLog(@"%@",error);
    }];
}

@end
//{
//    "commonResult": {
//        "success": true,
//        "errorCode": null,
//        "errorMsg": null,
//        "showType": 1,
//        "data": {
//            "publicKey": "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCehSh4sO9EvIHGpys5emH1h8bmxZCmgLATvyS2\r\n89ZuPC8T2wdXJtUPq2APaJALlTKqT1ezJvb9xrDjZE6UOLtlQRZGp5KQbAgE9J1yXjNwzUwDRFiH\r\n/+he3AaTVjdxqRGx0TCb/sapFItrG2VwAinzvMIqJMeOfnIitI4IhIGsFQIDAQAB"
//        },
//        "pageInfo": null
//    }
//}
