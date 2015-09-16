//
//  FeedDetailInteractorIO.h
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/16.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#ifndef feedWithVIPER_FeedDetailInteractorIO_h
#define feedWithVIPER_FeedDetailInteractorIO_h

@protocol FeedDetailInteractorIO <NSObject>

- (void)loadFeedWithId:(long long)feedId;

@end

#endif
