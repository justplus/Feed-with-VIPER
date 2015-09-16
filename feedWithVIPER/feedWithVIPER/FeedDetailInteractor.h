//
//  FeedDetailInteractor.h
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/16.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeedDetailInteractorIO.h"
#import "FeedDetailViewInterface.h"

@interface FeedDetailInteractor : NSObject<FeedDetailInteractorIO>

@property (nonatomic, strong) id<FeedDetailViewInterface> feedDetailViewInterface;

@end
