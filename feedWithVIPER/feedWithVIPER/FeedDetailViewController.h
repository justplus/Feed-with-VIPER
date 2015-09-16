//
//  FeedDetailViewController.h
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/16.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedDetailViewInterface.h"
#import "FeedDetailInteractorIO.h"

@interface FeedDetailViewController : UIViewController<FeedDetailViewInterface>

@property (nonatomic, assign) long long feedId;
@property (nonatomic, strong) id<FeedDetailInteractorIO> feedDetailInterfaceIO;

@end
