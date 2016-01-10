//
//  HttpRequest.h
//  jokebook
//
//  Created by YUYE on 15/12/18.
//  Copyright © 2015年 YUYE. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CallBack)(NSDictionary *responseObject,BOOL success);

@interface HttpRequest : NSObject

/**
 *二次封装,所有网络请求从这里调用,有错误可以统一处理
 */
+(void)requestByURLString:(NSString*)str andParameters:(id)parameters Complation:(CallBack)complation;

@end
