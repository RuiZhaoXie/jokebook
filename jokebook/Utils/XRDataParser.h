//
//  XRDataParser.h
//  jokebook
//
//  Created by ruizhao xie on 16/1/10.
//  Copyright © 2016年 YUYE. All rights reserved.
//  解析josn数据的类

#import <Foundation/Foundation.h>

@interface XRDataParser : NSObject

/**
 *解析趣图数据
 */
+(NSMutableArray *)parserFunnyImageByObject:(id)obj;

/**
 *解析笑话数据
 */
+(NSMutableArray *)parserJokeByObject:(id)obj;

@end
