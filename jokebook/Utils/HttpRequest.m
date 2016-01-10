//
//  HttpRequest.m
//  jokebook
//
//  Created by YUYE on 15/12/18.
//  Copyright © 2015年 YUYE. All rights reserved.
//

#import "HttpRequest.h"
#import <AFNetworking.h>

@implementation HttpRequest

+(void)requestByURLString:(NSString*)str andParameters:(id)parameters Complation:(CallBack)complation {
    //二次封装,所有网络请求从这里调用,有错误可以统一处理
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:str parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        complation(responseObject,YES);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        [self showWrningMessage:[NSString stringWithFormat:@"%@",error.localizedDescription]];
        complation(nil,NO);
        NSLog(@"%@",error);
    }];
    
}


+(void)showWrningMessage:(NSString *)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:error delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    });
    
}
@end
