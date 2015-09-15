//
//  JXTFeedModel+FeedExtension.m
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/12.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import "JXTFeedModel+FeedExtension.h"
#import "FeedMacro.h"
#import "NSString+Extension.h"

@implementation JXTFeedModel (FeedExtension)

- (NSMutableDictionary *)prepareFeedData {
    NSInteger height = 0;
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    
    data[@"feed"] = self;
    
    data[@"userAvatarFrame"] = [NSValue valueWithCGRect:CGRectMake(FEED_LEFT_PADDING,height+FEED_TOP_PADDING,
                                                                   FEED_USER_AVATAR_SIZE,FEED_USER_AVATAR_SIZE)];
    data[@"userNameFrame"] = [NSValue valueWithCGRect:CGRectMake(FEED_LEFT_PADDING+FEED_USER_AVATAR_SIZE+FEED_LEFT_PADDING,height+FEED_TOP_PADDING+1,JXTScreenWidth-FEED_USER_AVATAR_SIZE*4, 20)];
    height += FEED_TOP_PADDING + FEED_USER_AVATAR_SIZE + FEED_CONTENT_TOP_PADDING;
    
    if (![self.content isEqualToString:@""]) {
        CGSize contentSize = [self.content sizeWithConstrainedToWidth:JXTScreenWidth-FEED_LEFT_PADDING-FEED_RIGHT_PADDING fromFont:[UIFont systemFontOfSize:FEED_CONTENT_FONT_SIZE] lineSpace:FEED_CONTENT_LINE_HEIGHT numberOfLines:0];
        data[@"contentFrame"] = [NSValue valueWithCGRect:CGRectMake(FEED_LEFT_PADDING, height, contentSize.width, contentSize.height)];
        height += contentSize.height;
    }
    
    data[@"frame"] = [NSValue valueWithCGRect:CGRectMake(0, 0, JXTScreenWidth, height)];
    
    return data;
}

@end
