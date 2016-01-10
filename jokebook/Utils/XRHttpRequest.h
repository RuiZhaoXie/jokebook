//
//  XRHttpRequest.h
//  jokebook
//
//  Created by ruizhao xie on 16/1/10.
//  Copyright © 2016年 YUYE. All rights reserved.
//  

#import <Foundation/Foundation.h>

typedef void(^relustCallBack)(NSArray * relusts);

@interface XRHttpRequest : NSObject

/**
 *请求笑话数据，返回的结果已经解析好
 */
+(void)requestJokeByPage:(NSUInteger)Page Complation:(relustCallBack)complation;

/**
 *请求趣图数据，返回的结果已经解析好
 */
+(void)requestFunnyImageByPage:(NSUInteger)Page Complation:(relustCallBack)complation;

@end
