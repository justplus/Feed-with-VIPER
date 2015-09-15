//
//  HomeworkCell.m
//  feedWithVIPER
//
//  Created by zhaoliang on 15/9/12.
//  Copyright (c) 2015年 zhaoliang. All rights reserved.
//

#import "HomeworkCell.h"
#import "M80AttributedLabel.h"
#import "UIButton+WebCache.h"
#import "JXTUserModel.h"
#import "JXTFeedModel.h"

@interface HomeworkCell()

@property (nonatomic, strong) UIButton *userAvatar;
@property (nonatomic, strong) M80AttributedLabel *userName;
@property (nonatomic, strong) M80AttributedLabel *feedContent;

@end

@implementation HomeworkCell

#pragma mark - interface implementation
- (void)setupCell {
    
}

- (void)drawWithData:(NSMutableDictionary *)data {
    JXTFeedModel *feed = [data objectForKey:@"feed"];
    if ([data objectForKey:@"userAvatarFrame"] != nil) {
        self.userAvatar.frame = [[data objectForKey:@"userAvatarFrame"] CGRectValue];
        [self.userAvatar sd_setBackgroundImageWithURL:[NSURL URLWithString:feed.owner.avatar.middle] forState:UIControlStateNormal];
    }
    self.userName.frame = [[data objectForKey:@"userNameFrame"] CGRectValue];
    [self.userName setText:feed.owner.userName];
    
    if ([data objectForKey:@"contentFrame"] != nil) {
        self.feedContent.frame = [[data objectForKey:@"contentFrame"] CGRectValue];
        [self.feedContent setText:feed.content];
    }
}

- (void)clean {
    
}

#pragma mark - property
- (UIButton *)userAvatar
{
    if (_userAvatar == nil) {
        _userAvatar = [UIButton buttonWithType:UIButtonTypeCustom];
        _userAvatar.clipsToBounds = YES;
        _userAvatar.layer.cornerRadius = 2;
        _userAvatar.layer.masksToBounds = YES;
        _userAvatar.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_userAvatar];
        [_userAvatar addTarget:self action:@selector(didUserAvatarTapped) forControlEvents:UIControlEventTouchUpInside];
    }
    return _userAvatar;
}

- (M80AttributedLabel *)userName
{
    if (_userName == nil) {
        _userName = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
        _userName.numberOfLines = 1;
        _userName.textColor = [UIColor blackColor];
        [self.contentView addSubview:_userName];
    }
    return _userName;
}

- (M80AttributedLabel *)feedContent
{
    if (_feedContent == nil) {
        _feedContent = [M80AttributedLabel new];
        _feedContent.numberOfLines = 0;
        _feedContent.autoDetectLinks = YES;
        _feedContent.lineSpacing = 3;
        _feedContent.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:_feedContent];
    }
    return _feedContent;
}

@end
