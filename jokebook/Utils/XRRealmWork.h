//
//  XRRealmWork.h
//  jokebook
//
//  Created by ruizhao xie on 15/12/11.
//  Copyright © 2015年 YUYE. All rights reserved.
//

#import <Realm/Realm.h>

@interface XRRealmWork : RLMObject
/**
 *添加数据(开子线程操作事务)
 */
+(void)addDataWithObject:(RLMObject *)obj;
/**
 *删除数据(开子线程操作事务)
 */
+(void)deleteDataWithObject:(RLMObject *)obj;
/**
 *删除所有数据
 */
+(void)deleteAllObject;
/**
 *改(开子线程操作事务)
 */
+(void)changeDataWithObject:(RLMObject *)obj;
/**
 *查找所有笑话数据(开子线程操作事务)
 */
+(id)findAllJokeData;


+(void)addJokeDataWithObject:(RLMObject *)obj;

@end


