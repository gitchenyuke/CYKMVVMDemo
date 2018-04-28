//
//  FriendHeaderView.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/28.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "FriendHeaderView.h"
#import "CommentPicView.h"

static const float ICON_W = 50.f;

@interface FriendHeaderView ()
@property(nonatomic,strong) UIView * backView;
@property(nonatomic,strong) UIImageView * ivIcon;
@property(nonatomic,strong) UILabel * labName;
@property(nonatomic,strong) UILabel * labContent;
@property(nonatomic,strong) UILabel * labDate;
@property(nonatomic,strong) CommentPicView * picView;
@end

@implementation FriendHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpViews];
    }
    return self;
}
- (void)layoutSubviews
{
    self.backView.frame = self.bounds;
    self.ivIcon.frame = CGRectMake(15, 15, ICON_W, ICON_W);
    CGFloat x = CGRectGetMaxX(self.ivIcon.frame)+10;
    self.labName.frame = CGRectMake(x, 15,200, 20);
    self.labContent.frame = CGRectMake(x, CGRectGetMaxY(self.labName.frame)+5, KMainScreenWidth-ICON_W-15-15, 20);
    self.picView.frame = CGRectMake(x, CGRectGetMaxY(self.labContent.frame)+5, KMainScreenWidth-ICON_W-15-50, 100);
    self.labDate.frame = CGRectMake(x, CGRectGetMaxY(self.picView.frame)+5, 100, 20);
}
- (void)setUpViews{
    
    // 设置 FriendHeaderView的背景颜色
    self.backgroundView = ({
        self.backView = [[UIView alloc] initWithFrame:CGRectZero];
        self.backView.backgroundColor = [UIColor whiteColor];
        self.backView;
    });
    [self.contentView addSubview:self.ivIcon];
    [self.contentView addSubview:self.labName];
    [self.contentView addSubview:self.labContent];
    [self.contentView addSubview:self.labDate];
    [self.contentView addSubview:self.picView];
    
    self.labName.text = @"李程";
    self.labContent.text = @"听说你都成网红了,我回来啦";
    self.picView.backgroundColor = [UIColor orangeColor];
    self.labDate.text = @"5小时前";
}
- (UIImageView *)ivIcon{
    if (!_ivIcon) {
        _ivIcon = [UIImageView new];
        _ivIcon.backgroundColor = [UIColor redColor];
    }
    return _ivIcon;
}
- (UILabel *)labName{
    if (!_labName) {
        _labName = [UILabel new];
        _labName.textColor = ColorS(COLOR_BLUE_ONE);
        _labName.font = FontS(FONT_MIDDLE);
    }
    return _labName;
}
- (UILabel *)labContent{
    if (!_labContent) {
        _labContent = [UILabel new];
        _labContent.textColor = ColorS(COLOR_BLACK_ONE);
        _labContent.font = FontS(FONT_MIDDLE);
    }
    return _labContent;
}
- (UILabel *)labDate{
    if (!_labDate) {
        _labDate = [UILabel new];
        _labDate.textColor = ColorS(COLOR_BLACK_THREE);
        _labDate.font = FontS(FONT_SMALL);
    }
    return _labDate;
}
- (CommentPicView *)picView{
    if (!_picView) {
        _picView = [[CommentPicView alloc] init];
    }
    return _picView;
}
@end
