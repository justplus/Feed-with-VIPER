//
//  JXTUserModel.h
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/9.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JXTUserAvatarModel;

@interface JXTUserModel : NSObject
@property(nonatomic, copy) NSString *userId;
@property(nonatomic, copy) NSString *roleName;
@property(nonatomic, copy) NSString *userName;
@property(nonatomic, copy) NSString *mobile;
@property(nonatomic, strong) JXTUserAvatarModel *avatar;
@end

@interface JXTUserAvatarModel : NSObject
@property(nonatomic, copy) NSString *small;
@property(nonatomic, copy) NSString *middle;
@property(nonatomic, copy) NSString *large;
@end
