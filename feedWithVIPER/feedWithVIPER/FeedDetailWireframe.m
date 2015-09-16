//
//  FeedDetailWireframe.m
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/16.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import "FeedDetailWireframe.h"
#import "FeedDetailViewController.h"
#import "FeedDetailInteractor.h"

@implementation FeedDetailWireframe

- (void)navigationToWithFeedId:(long long)feedId FromViewController:(UIViewController *)viewController
{
    FeedDetailViewController *detailViewController = [FeedDetailViewController new];
    FeedDetailInteractor *detailInteractor = [FeedDetailInteractor new];
    detailViewController.feedDetailInterfaceIO = detailInteractor;
    detailInteractor.feedDetailViewInterface = detailViewController;
    detailViewController.feedId = feedId;
    [viewController.navigationController pushViewController:detailViewController animated:YES];
}

@end
