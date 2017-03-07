//
//  NSDictionary+RtDictionary.m
//  JJSOA
//
//  Created by RuanSTao on 15/11/26.
//  Copyright © 2015年 JJSHome. All rights reserved.
//

#import "NSDictionary+RtDictionary.h"

@implementation NSDictionary (RtDictionary)

- (id)rtObjectForKey:(id)aKey
{
    if ([self isKindOfClass:[NSNull class]]) {
        return nil;
    }
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return obj;
}

- (id)rtValueForKey:(id)aKey
{
    if ([self isKindOfClass:[NSNull class]]) {
        return nil;
    }
    id obj = [self valueForKey:aKey];
    if ([obj isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return obj;
}

@end
