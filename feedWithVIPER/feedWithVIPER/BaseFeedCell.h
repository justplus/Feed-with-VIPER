//
//  FeedCell.h
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/12.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseFeedCell : UITableViewCell

- (void)setupCell;
- (void)drawFeedWithData:(NSMutableDictionary *)data;
- (void)clean;

@end
