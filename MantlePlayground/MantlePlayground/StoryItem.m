//
//  StoryItem.m
//  MantlePlayground
//
//  Created by zhangwei on 16/8/9.
//  Copyright © 2016年 com.sankuai.com. All rights reserved.
//

#import "StoryItem.h"

@implementation StoryItem

#pragma mark - MTLJSONSerializing

/*
 The dictionary returned by this method specifies how your model object's properties map 
 to the keys in the JSON representation.

 注意顺序：<property name>: <JSON key path>
 
 1. 如果某些属性不想映射到JSON中，使用`NSNull.null`代替，譬如：@{ "somePropertyName": NSNull.null}
 2. 这个方法什么时候会被用到？
 */
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"imageStrings": @"images",
             @"imageString": @"image",
             @"type": @"type",
             @"ID": @"id",
             @"title": @"title"
             };
}

@end
