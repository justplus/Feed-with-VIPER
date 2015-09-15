//
//  JXTFeedModel.m
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/9.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import "JXTFeedModel.h"

@implementation JXTFeedModel

@end

@implementation JXTFeedResult
+ (NSDictionary *)objectClassInArray
{
    return @{@"data":[JXTFeedModel class]};
}
@end
