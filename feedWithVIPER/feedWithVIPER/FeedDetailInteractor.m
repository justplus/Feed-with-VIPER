//
//  FeedDetailInteractor.m
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/16.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import "FeedDetailInteractor.h"

@implementation FeedDetailInteractor

- (void)loadFeedWithId:(long long)feedId
{
    // 请求数据
    // 准备数据
    NSDictionary *data = [NSDictionary dictionary];
    [self.feedDetailViewInterface showFeedDetailWithData:data];
}

@end
