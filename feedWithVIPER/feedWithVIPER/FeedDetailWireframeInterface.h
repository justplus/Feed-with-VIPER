//
//  FeedDetailWireframeInterface.h
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/16.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#ifndef feedWithVIPER_FeedDetailWireframeInterface_h
#define feedWithVIPER_FeedDetailWireframeInterface_h

@protocol FeedDetailWireframeInterface <NSObject>

- (void)navigationToWithFeedId:(long long)feedId FromViewController:(UIViewController *)viewController;

@end

#endif
