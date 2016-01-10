//
//  XRDataParser.m
//  jokebook
//
//  Created by ruizhao xie on 16/1/10.
//  Copyright © 2016年 YUYE. All rights reserved.
//

#import "XRDataParser.h"
#import <MJExtension.h>
#import "XRFunnyImage.h"
#import "XRRealmWork.h"
#import "XRJoke.h"

@implementation XRDataParser

+(NSMutableArray *)parserFunnyImageByObject:(id)obj {
    NSString * reason = [obj objectForKey:@"reason"];
    NSMutableArray * funnyImages = [NSMutableArray array];
    if ([reason isEqualToString:@"Success"]) {
        NSDictionary * result = [obj objectForKey:@"result"];
        NSArray * data = [result objectForKey:@"data"];
        for (NSDictionary * dic in data) {
            XRFunnyImage * funnyImage = [XRFunnyImage mj_objectWithKeyValues:dic];
            [funnyImages addObject:funnyImage];
        }
    }
    return funnyImages;
}

+(NSMutableArray *)parserJokeByObject:(id)obj {
    NSString * reason = [obj objectForKey:@"reason"];
    NSMutableArray * jokes = [NSMutableArray array];
    if ([reason isEqualToString:@"Success"]) {
        NSDictionary * result = [obj objectForKey:@"result"];
        NSArray * data = [result objectForKey:@"data"];
        for (NSDictionary * jokeDic in data) {
            XRJoke * joke = [[XRJoke alloc]init];
            joke = [XRJoke mj_objectWithKeyValues:jokeDic];
            //添加到数组
            [jokes addObject:joke];
            //添加到数据库
            [XRRealmWork addJokeDataWithObject:joke];
            
        }
    }
    return jokes;
}

@end
