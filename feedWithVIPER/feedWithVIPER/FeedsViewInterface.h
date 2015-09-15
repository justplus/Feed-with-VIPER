//
//  FeedsViewInterface.h
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/12.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#ifndef feedWithVIPER_FeedsViewInterface_h
#define feedWithVIPER_FeedsViewInterface_h

@protocol FeedsViewInterface <NSObject>

@required
- (void)showFeedListWithData:(NSMutableArray *)data;
@optional
- (void)showNoContent;

@end

#endif
