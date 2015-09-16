//
//  FeedDetailViewController.m
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/16.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import "FeedDetailViewController.h"

@interface FeedDetailViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation FeedDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self.feedDetailInterfaceIO loadFeedWithId:self.feedId];
}

- (void)setupUI
{
    self.navigationItem.title = @"动态详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.label];
}


- (void)showFeedDetailWithData:(NSDictionary *)data
{
    self.label.text = [NSString stringWithFormat:@"动态ID为：%lld", self.feedId];
}

- (UILabel *)label
{
    if (_label == nil) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, JXTScreenWidth, 20)];
        _label.textColor = [UIColor blackColor];
        // _label.textAlignment = kCTTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:14];
    }
    return _label;
}

@end
