//
//  FeedsViewController.h
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/12.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedsViewInterface.h"
#import "FeedsInteractorIO.h"
#import "FeedDetailWireframeInterface.h"

@interface FeedsViewController : UIViewController<FeedsViewInterface>

@property (nonatomic, strong) id<FeedsInteractorIO> feedsInteractorIO;
@property (nonatomic, strong) id<FeedDetailWireframeInterface> feedDetailWireframeInterface;

@end
