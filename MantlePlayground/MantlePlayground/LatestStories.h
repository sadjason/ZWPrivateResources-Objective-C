//
//  LatestStories.h
//  MantlePlayground
//
//  Created by zhangwei on 16/8/9.
//  Copyright © 2016年 com.sankuai.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoryItem.h"

@interface LatestStories : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSDate *publishDate;
@property (nonatomic, copy) NSArray<StoryItem *> *stories; // 当日新闻
@property (nonatomic, copy) NSArray<StoryItem *> *topStories; // 图片新闻

@end
