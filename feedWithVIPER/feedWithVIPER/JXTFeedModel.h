//
//  JXTFeedModel.h
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/9.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JXTUserModel;

@interface JXTFeedModel : NSObject
@property(nonatomic, assign) long long id;
@property(nonatomic, copy) NSString *content;
@property(nonatomic, copy) NSArray *labels;
@property(nonatomic, copy) NSArray *attachments;
@property(nonatomic, copy) NSString *deadline;
@property(nonatomic, retain) NSMutableArray *listUped;
@property(nonatomic, retain) NSMutableArray *comments;
@property(nonatomic, assign) NSInteger commentCount;
@property(nonatomic, assign) NSInteger collectCount;
@property(nonatomic, assign) NSInteger likeCount;
@property(nonatomic, strong) JXTUserModel *owner;
@property(nonatomic, assign) long long createTime;
@property(nonatomic, assign) BOOL liked;
@property(nonatomic, assign) BOOL collected;
@property(nonatomic, assign) NSInteger typeExt;
@property(nonatomic, assign) NSInteger fromApp;
@property(nonatomic, copy) NSString *infoExt;
@end

@interface JXTFeedResult : NSObject
@property(nonatomic, assign) NSInteger total;
@property(nonatomic, copy) NSMutableArray *data;
@end
