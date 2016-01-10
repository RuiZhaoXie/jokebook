//
//  XRHttpRequest.m
//  jokebook
//
//  Created by ruizhao xie on 16/1/10.
//  Copyright © 2016年 YUYE. All rights reserved.
//

#import "XRHttpRequest.h"
#import "XRDataParser.h"
#import "HttpRequest.h"
#import "XRRealmWork.h"
#import <AFNetworking.h>

//合理利用#define定义不变的参数
#define KEY @"870e6b2f1ca5253a91af27664057dc83"
#define FUNNY_URL  @"http://japi.juhe.cn/joke/img/text.from"
#define JOKE_URL @"http://japi.juhe.cn/joke/content/text.from"
#define MIN_NUM 1;

@implementation XRHttpRequest



+(void)requestFunnyImageByPage:(NSUInteger)Page Complation:(relustCallBack)complation {
    
    
    NSDictionary *parameters = @{@"key":KEY, @"page": [NSNumber numberWithUnsignedInteger:Page],@"pagesize":@"20"};
    
    [HttpRequest requestByURLString: FUNNY_URL andParameters:parameters Complation:^(NSDictionary *responseObject,BOOL success) {
        
        complation([XRDataParser parserFunnyImageByObject:responseObject]);
    }];
}

+(void)requestJokeByPage:(NSUInteger)Page Complation:(relustCallBack)complation {
    
    NSDictionary * parameters = @{@"key":KEY,@"page":[NSNumber numberWithUnsignedInteger:Page]
                                  ,@"pagesize":@"20"};
    [HttpRequest requestByURLString:JOKE_URL andParameters:parameters Complation:^(NSDictionary *responseObject,BOOL success) {
        //返回的数据非空就解析
        if (responseObject != nil && success==YES) {
            complation([XRDataParser parserJokeByObject:responseObject]);
        }
        else {
            //当网络请求失败的时候,调用数据库的数据
            complation([XRRealmWork findAllJokeData]);
        }
        
    }];
}
@end
