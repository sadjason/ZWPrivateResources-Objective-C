//
//  StoryItem.h
//  MantlePlayground
//
//  Created by zhangwei on 16/8/9.
//  Copyright © 2016年 com.sankuai.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface StoryItem : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) NSUInteger ID;
@property (nonatomic, copy) NSArray<NSString *> *imageStrings;  // 普通story的image是数组形式
@property (nonatomic, copy) NSString *imageString;              // top story的image是字符串形式
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSUInteger type;

@end
