//
//  FeedCellInterface.h
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/12.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#ifndef feedWithVIPER_CellInterface_h
#define feedWithVIPER_CellInterface_h

@protocol CellInterface <NSObject>

@required
- (void)setupCell;
- (void)drawWithData:(NSMutableDictionary *)data;
@optional
- (void)clean;

@end

#endif
