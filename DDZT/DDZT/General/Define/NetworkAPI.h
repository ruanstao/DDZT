//
//  NetworkAPI.h
//  DDZT
//
//  Created by ruanstao on 2017/3/7.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#ifndef NetworkAPI_h
#define NetworkAPI_h

//home
//#define Host @"http://16q7q00725.iok.la"
//company
#define Host @"http://172.16.6.88:8088"

//获取初始化数据  
#define CommonApi  [NSString stringWithFormat:@"%@%@",Host,@"/app/common/appInit"]

//从服务端获取临时的rsa公钥
#define GetKeyPairApi  [NSString stringWithFormat:@"%@%@",Host,@"/app/common/getKeyPair"]

//注册用户名和提交密码
#define RegisterApi  [NSString stringWithFormat:@"%@%@",Host,@"/app/common/register"]

//app端生成密钥对,公钥私钥大小都为为1024byte,上传密码和自己产生的公钥给服务端,自己保存私钥
#define LoginApi  [NSString stringWithFormat:@"%@%@",Host,@"/app/common/login"]

//获取验证码
#define GetSMSApi  [NSString stringWithFormat:@"%@%@",Host,@"/app/common/getSMS"]

//获取token
#define GetTokenApi  [NSString stringWithFormat:@"%@%@",Host,@"/app/common/getToken"]

#endif /* NetworkAPI_h */
