//
//  XRJoke.m
//  jokebook
//
//  Created by ruizhao xie on 15/12/15.
//  Copyright © 2015年 YUYE. All rights reserved.
//

#import "XRJoke.h"

@implementation XRJoke

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

+(NSString *)primaryKey {
    return @"hashId";
}

@end
