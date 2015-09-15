//
//  JXTLinkModel.h
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/12.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXTLinkModel : NSObject

@property(nonatomic, copy) NSString *scheme;
@property(nonatomic, assign) int fromIndex;
@property(nonatomic, assign) int length;
@property(nonatomic, strong) id object;

- (id)initScheme:(NSString *)scheme fromIndex:(int)fromIndex length:(int)length object:(id)object;

@end
