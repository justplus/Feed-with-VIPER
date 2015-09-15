//
//  JXTArraySource.h
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/12.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface JXTArrayDataSource : NSObject<UITableViewDataSource>

- (id)initWithItems:(NSMutableArray *)items celldentifier:(NSString *)cellIdentifier
 cellConfigureBlock:(TableViewCellConfigureBlock) cellConfigureBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
