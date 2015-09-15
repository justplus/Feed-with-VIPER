//
//  FeedsInterator.m
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/12.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import "FeedsInteractor.h"
#import "FeedsDataManager.h"
#import "MJExtension.h"
#import "JXTFeedModel.h"
#import "JXTFeedModel+FeedExtension.h"
#import "JXTFeedModel+HomeworkExtension.h"

@implementation FeedsInteractor

- (void)loadFeeds {
    NSString *url = @"http://rest.changyan.com/api?version=1.0&format=json&appkey=KtSNKxk3&access_token=jx&ct=2&cver=1.0.1001&feedIdGet=30639&labelIds=&limit=20&method=jx.feed.list.temp&type=0&userId=2300000030000024168";
    [FeedsDataManager listFeedsWithUrl:url andParameters:nil success:^(id responseObject) {
        JXTFeedResult *result = [JXTFeedResult objectWithKeyValues:responseObject];
        if (result.data.count <= 0) {
            [self.feedsViewInterface showNoContent];
        }
        else {
            // 异步准备数据，并刷新列表
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSMutableArray *data = [NSMutableArray array];
                for (JXTFeedModel *feed in result.data) {
                    // 普通动态
                    if (feed.typeExt == 0) {
                        NSMutableDictionary *feedData = [feed prepareFeedData];
                        [data addObject:feedData];
                    }
                    // 作业
                    else if (feed.typeExt == 1) {
                        NSMutableDictionary *homeworkData = [feed prepareHomeworkData];
                        [data addObject:homeworkData];
                    }
                }
                // 主线程刷新数据
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.feedsViewInterface showFeedListWithData:data];
                });
            });
        }
    } failure:^(NSError *error) {
        
    } netDown:^{
        
    }];
}


- (void)loadedFeeds:(NSArray *)feeds {
    
}

@end
