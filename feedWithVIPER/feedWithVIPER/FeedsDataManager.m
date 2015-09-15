//
//  FeedsDataManager.m
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/9.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import "FeedsDataManager.h"
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "AppDelegate.h"

@implementation FeedsDataManager

+ (void)listFeedsWithUrl:(NSString *)url
           andParameters:(NSDictionary *)parameters
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure
                 netDown:(void (^)())netDown
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSMutableDictionary *paramDict = [NSMutableDictionary dictionaryWithDictionary:parameters];
    paramDict[@"ct"] = @(2);
    paramDict[@"cver"] = @"1.0.1.1001";
    [manager GET:url parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
        // TODO: 开启缓存
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
