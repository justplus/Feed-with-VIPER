//
//  FeedsDataManager.h
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/9.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedsDataManager : NSObject

+ (void)listFeedsWithUrl:(NSString *)url
           andParameters:(NSDictionary *)parameters
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure
                 netDown:(void (^)())netDown;

@end
