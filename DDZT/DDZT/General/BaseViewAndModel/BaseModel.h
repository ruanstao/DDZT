//
//  BaseModel.h
//  DDZT
//
//  Created by ruanstao on 2017/3/9.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
@class BasePageInfo;
@interface BaseModel : JSONModel
@property (nonatomic,assign) BOOL success;
@property (nonatomic,strong) NSString *errorCode;
@property (nonatomic,strong) NSString *errorMsg;
@property (nonatomic,assign) NSInteger showType; //0不展示1展示errorMsg
@property (nonatomic,strong) BasePageInfo *pageInfo;
//@property (nonatomic,strong) id data; //子类自实现

@end

@interface BasePageInfo : NSObject
@property (nonatomic,assign) NSInteger totalRecord;
@property (nonatomic,assign) NSInteger pageSize;
@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,assign) NSInteger totalPage;

@end
