//
//  LatestStories.m
//  MantlePlayground
//
//  Created by zhangwei on 16/8/9.
//  Copyright © 2016年 com.sankuai.com. All rights reserved.
//

#import "LatestStories.h"
#import "Mantle.h"

@implementation LatestStories

// 将publishDate映射到NSDate，反之亦然
+ (NSValueTransformer *)publishDateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(id x) {
        return [self.dateFormatter dateFromString:x];
    } reverseBlock:^id(id x) {
        return [self.dateFormatter stringFromDate:x];
    }];
}

+ (NSDateFormatter *)dateFormatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMMdd";
    
    return dateFormatter;
}

+ (NSValueTransformer *)storiesJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:StoryItem.class];
}

+ (NSValueTransformer *)topStoriesJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:StoryItem.class];
}

#pragma mark - MTLJSONSerializing

// <property name>: <JSON key path>
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"publishDate": @"date",
             @"stories": @"stories",
             @"topStories": @"top_stories"
             };
}


@end
