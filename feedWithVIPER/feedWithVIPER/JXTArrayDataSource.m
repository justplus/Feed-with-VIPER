//
//  JXTArraySource.m
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/12.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import "JXTArrayDataSource.h"

@interface JXTArrayDataSource()

@property(nonatomic, strong) NSArray *items;
@property(nonatomic, copy) NSString *cellIdentifier;
@property(nonatomic, weak) TableViewCellConfigureBlock cellConfigureBlock;

@end

@implementation JXTArrayDataSource

- (id)initWithItems:(NSMutableArray *)items celldentifier:(NSString *)cellIdentifier
 cellConfigureBlock:(TableViewCellConfigureBlock) cellConfigureBlock;
{
    self = [super init];
    if (self) {
        self.items = items;
        self.cellIdentifier = cellIdentifier;
        self.cellConfigureBlock = cellConfigureBlock;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[indexPath.row];
}


#pragma mark - UITableDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
    }
    id item = [self itemAtIndexPath:indexPath];
    self.cellConfigureBlock(cell, item);
    return cell;
}

#pragma mark - property
- (NSArray *)items
{
    if (_items == nil) {
        _items = [NSArray array];
    }
    return _items;
}

@end
