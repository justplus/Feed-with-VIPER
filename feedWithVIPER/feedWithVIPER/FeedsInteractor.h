//
//  FeedsInterator.h
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/12.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeedsInteractorIO.h"
#import "FeedsViewInterface.h"

@interface FeedsInteractor : NSObject<FeedsInteractorIO>

@property (nonatomic, strong) id<FeedsViewInterface> feedsViewInterface;

@end
