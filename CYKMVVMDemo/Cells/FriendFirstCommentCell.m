//
//  FriendFirstCommentCell.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/28.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "FriendFirstCommentCell.h"

@interface FriendFirstCommentCell ()
@property(nonatomic,strong) UIView  * backView;
@property(nonatomic,strong) UILabel * labName;
@end
@implementation FriendFirstCommentCell

- (void)cyk_addSubviews
{
    [self.contentView addSubview:self.backView];
    [self.backView addSubview:self.labName];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backView.frame = CGRectMake(75, 0, KMainScreenWidth-75-20, self.contentView.frame.size.height);
    self.labName.frame = CGRectMake(10, 5, self.backView.frame.size.width-20, 20);
    self.labName.text = @"李程:五一节目怎么安排?";
}
- (UIView *)backView{
    if (!_backView) {
        _backView = [UIView new];
        _backView.backgroundColor = ColorS(COLOR_BOTTOM);
    }
    return _backView;
}
- (UILabel *)labName{
    if (!_labName) {
        _labName = [UILabel new];
        _labName.textColor = ColorS(COLOR_BLACK_TWO);
        _labName.font = FontS(FONT_SMALL);
    }
    return _labName;
}
@end
