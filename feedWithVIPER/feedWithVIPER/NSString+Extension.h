//
//  NSString+Extension.h
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/12.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (CGSize)sizeWithConstrainedToWidth:(float)width fromFont:(UIFont *)font1 lineSpace:(float)lineSpace numberOfLines:(int)numberOfLines;

@end
