//
//  JXTLinkModel.m
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/12.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import "JXTLinkModel.h"

@implementation JXTLinkModel

- (id)initScheme:(NSString *)scheme fromIndex:(int)fromIndex length:(int)length object:(id)object
{
    self = [super init];
    if (self) {
        _scheme = scheme;
        _fromIndex = fromIndex;
        _length = length;
        _object = object;
    }
    return self;
}

@end
