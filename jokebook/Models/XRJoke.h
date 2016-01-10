//
//  XRJoke.h
//  jokebook
//
//  Created by ruizhao xie on 15/12/15.
//  Copyright © 2015年 YUYE. All rights reserved.
//

#import <Realm/Realm.h>

@interface XRJoke : RLMObject
@property NSString * content;
@property NSString * hashId;
@property NSString * unixtime;
@property NSString * updatetime;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<XRJoke>
RLM_ARRAY_TYPE(XRJoke)
