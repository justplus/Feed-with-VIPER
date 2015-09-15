//
//  NSString+Extension.m
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/12.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import "NSString+Extension.h"
#import "M80AttributedLabel.h"

@implementation NSString (Extension)

- (CGSize)sizeWithConstrainedToWidth:(float)width fromFont:(UIFont *)font1 lineSpace:(float)lineSpace numberOfLines:(int)numberOfLines
{
    CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)font1.fontName,font1.pointSize,NULL);
    NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:(__bridge id)font,(NSString*)kCTFontAttributeName,nil];
    NSMutableAttributedString *drawString = [[NSMutableAttributedString alloc] initWithString:self attributes:attributes];
    
    //如果LineBreakMode为TranncateTail,那么默认排版模式改成kCTLineBreakByCharWrapping,使得尽可能地显示所有文字
    CTLineBreakMode lineBreakMode = kCTLineBreakByTruncatingTail;
    if (lineBreakMode == kCTLineBreakByTruncatingTail)
    {
        lineBreakMode = numberOfLines == 1 ? kCTLineBreakByCharWrapping : kCTLineBreakByWordWrapping;
    }
    CGFloat _fontLineHeight = font1.lineHeight;  //使用全局fontHeight作为最小lineHeight
    CTTextAlignment _textAlignment = kCTLeftTextAlignment;
    CGFloat _paragraphSpacing = 0.0f;
    CTParagraphStyleSetting settings[] =
    {
        {kCTParagraphStyleSpecifierAlignment,sizeof(_textAlignment),&_textAlignment},
        {kCTParagraphStyleSpecifierLineBreakMode,sizeof(lineBreakMode),&lineBreakMode},
        {kCTParagraphStyleSpecifierMaximumLineSpacing,sizeof(lineSpace),&lineSpace},
        {kCTParagraphStyleSpecifierMinimumLineSpacing,sizeof(lineSpace),&lineSpace},
        {kCTParagraphStyleSpecifierParagraphSpacing,sizeof(_paragraphSpacing),&_paragraphSpacing},
        {kCTParagraphStyleSpecifierMinimumLineHeight,sizeof(_fontLineHeight),&_fontLineHeight},
    };
    CTParagraphStyleRef paragraphStyle = CTParagraphStyleCreate(settings,sizeof(settings) / sizeof(settings[0]));
    [drawString addAttribute:(id)kCTParagraphStyleAttributeName
                       value:(__bridge id)paragraphStyle
                       range:NSMakeRange(0, [drawString length])];
    CFRelease(paragraphStyle);
    if (drawString == nil)
    {
        return CGSizeZero;
    }
    CFAttributedStringRef attributedStringRef = (__bridge CFAttributedStringRef)drawString;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(attributedStringRef);
    CFRange range = CFRangeMake(0, 0);
    if (numberOfLines > 0 && framesetter)
    {
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddRect(path, NULL, CGRectMake(0, 0, width, CGFLOAT_MAX));
        CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
        CFArrayRef lines = CTFrameGetLines(frame);
        
        if (nil != lines && CFArrayGetCount(lines) > 0)
        {
            NSInteger lastVisibleLineIndex = MIN(numberOfLines, CFArrayGetCount(lines)) - 1;
            CTLineRef lastVisibleLine = CFArrayGetValueAtIndex(lines, lastVisibleLineIndex);
            
            CFRange rangeToLayout = CTLineGetStringRange(lastVisibleLine);
            range = CFRangeMake(0, rangeToLayout.location + rangeToLayout.length);
        }
        CFRelease(frame);
        CFRelease(path);
        
    }
    
    CFRange fitCFRange = CFRangeMake(0, 0);
    CGSize newSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, range, NULL, CGSizeMake(width, CGFLOAT_MAX), &fitCFRange);
    if (framesetter)
    {
        CFRelease(framesetter);
    }
    
    //hack:
    //1.需要加上额外的一部分size,有些情况下计算出来的像素点并不是那么精准
    //2.ios7的CTFramesetterSuggestFrameSizeWithConstraints方法比较残,需要多加一部分height
    //3.ios7多行中如果首行带有很多空格，会导致返回的suggestionWidth远小于真是width,那么多行情况下就是用传入的width
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0)
    {
        if (newSize.height < CTFontGetSize(font) * 2)   //单行
        {
            CFRelease(font);
            return CGSizeMake(ceilf(newSize.width) + 2.0, ceilf(newSize.height) + 4.0);
        }
        else
        {
            CFRelease(font);
            return CGSizeMake(width, ceilf(newSize.height) + 4.0);
        }
    }
    else
    {
        CFRelease(font);
        return CGSizeMake(ceilf(newSize.width) + 2.0, ceilf(newSize.height) + 2.0);
    }
    
}

@end
