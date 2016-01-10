//
//  XRRealmWork.m
//  jokebook
//
//  Created by ruizhao xie on 15/12/11.
//  Copyright © 2015年 YUYE. All rights reserved.
//

#import "XRRealmWork.h"
#import "XRJoke.h"


@implementation XRRealmWork

//增
+(void)addDataWithObject:(RLMObject *)obj {
    // 获取默认的 Realm 实例
    RLMRealm *realm = [RLMRealm defaultRealm];
    // 每个线程只需要使用一次即可
    
    // 通过事务将数据添加到 Realm 中
    [realm beginWriteTransaction];
    [realm addObject:obj];
    [realm commitWriteTransaction];
}

//删
+(void)deleteDataWithObject:(RLMObject *)obj {
    RLMRealm *realm = [RLMRealm defaultRealm];
    // 在事务中删除一个对象
    [realm beginWriteTransaction];
    [realm deleteObject:obj];
    [realm commitWriteTransaction];
}

//删除所有数据
+(void)deleteAllObject {
    RLMRealm *realm = [RLMRealm defaultRealm];
    // 从 Realm 中删除所有数据
    [realm beginWriteTransaction];
    [realm deleteAllObjects];
    [realm commitWriteTransaction];
}

//改
+(void)changeDataWithObject:(RLMObject *)obj {
    
}

//查
+(id)findAllJokeData{
    RLMResults * results = [XRJoke allObjects];
    
    return results;
}



+(void)addJokeDataWithObject:(RLMObject *)obj {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [XRJoke createOrUpdateInRealm:realm withValue:obj];
//    [XRJoke createInRealm:realm withValue:obj];
    [realm commitWriteTransaction];
}

@end
