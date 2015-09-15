//
//  FeedsViewController.m
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/12.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import "FeedsViewController.h"
#import "CellInterface.h"
#import "JXTFeedModel.h"
#import "FeedCell.h"
#import "HomeworkCell.h"

static NSString * const FeedCellIdentifier = @"FeedCell";

@interface FeedsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation FeedsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self.feedsInteractorIO loadFeeds];
}

#pragma mark - UI
- (void)setupUI {
    self.navigationItem.title = @"班级圈";
    
    [self.view addSubview:self.tableView];
}

#pragma mark - implementation
- (void)showFeedListWithData:(NSMutableArray *)data {
    [self.data addObjectsFromArray:data];
    [self.tableView reloadData];
}

- (void)showNoContent {
    NSLog(@"There is no feeds here~");
}

#pragma mark - UITableView datasource and delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *data = self.data[indexPath.row];
    CGRect frame = [[data objectForKey:@"frame"] CGRectValue];
    return frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *data = self.data[indexPath.row];
    
    id cell = [tableView dequeueReusableCellWithIdentifier:FeedCellIdentifier];
    if (cell == nil) {
        JXTFeedModel *feed = [data objectForKey:@"feed"];
        if (feed.typeExt == 0) {
            cell = [[FeedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FeedCellIdentifier];
        }
        else if (feed.typeExt == 1) {
            cell = [[HomeworkCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FeedCellIdentifier];
        }
    }
    [cell clean];
    [cell drawWithData:data];
    return cell;
}

#pragma mark - property
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, JXTScreenWidth, JXTScreenHeight) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (NSMutableArray *)data
{
    if (_data == nil) {
        _data = [NSMutableArray array];
    }
    return _data;
}

@end
