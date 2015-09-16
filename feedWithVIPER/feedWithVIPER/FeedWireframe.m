//
//  FeedWireframe.m
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/15.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import "FeedWireframe.h"
#import "FeedDetailViewController.h"
#import "FeedDetailInteractor.h"

@implementation FeedWireframe

- (void)navigateToFeedDetailFromViewController:(UIViewController *)viewController
{
    FeedDetailViewController *detailViewController = [FeedDetailViewController new];
    FeedDetailInteractor *detailInteractor = [FeedDetailInteractor new];
    detailViewController.feedDetailInterfaceIO = detailInteractor;
    detailInteractor.feedDetailViewInterface = detailViewController;
    [viewController.navigationController pushViewController:detailViewController animated:YES];
}

@end
