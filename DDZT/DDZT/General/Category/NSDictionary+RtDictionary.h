//
//  NSDictionary+RtDictionary.h
//  JJSOA
//
//  Created by RuanSTao on 15/11/26.
//  Copyright © 2015年 JJSHome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (RtDictionary)

- (id)rtObjectForKey:(id)aKey;

- (id)rtValueForKey:(id)aKey;

@end
