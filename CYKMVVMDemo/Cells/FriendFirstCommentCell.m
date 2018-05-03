//
//  FriendFirstCommentCell.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/28.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "FriendFirstCommentCell.h"
#import "FriendCommentModel.h"
@interface FriendFirstCommentCell ()
@property(nonatomic,strong) UIView  * backView;
@property(nonatomic,strong) UILabel * labName;
@end
@implementation FriendFirstCommentCell
+ (CGFloat)calculateFriendFirstCommentCellHight:(id)model{
    FriendCommentModel * commentModel = (FriendCommentModel *)model;
    return [[self class] hightComment:commentModel.comment]+5;
}
- (void)cyk_addSubviews
{
    [self.contentView addSubview:self.backView];
    [self.backView addSubview:self.labName];
}
- (void)reloadModel:(id)model marger:(CGFloat)marger{
    FriendCommentModel * commentModel = (FriendCommentModel *)model;
    NSString * comment = [NSString stringWithFormat:@"%@:%@",commentModel.friendName,commentModel.comment];
    self.backView.frame = CGRectMake(75, 0, KMainScreenWidth-75-20, [[self class] hightComment:commentModel.comment]+5+marger);
    
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:comment];
    NSRange redRange = NSMakeRange(0, [[noteStr string] rangeOfString:@":"].location);
    [noteStr addAttribute:NSForegroundColorAttributeName value:ColorS(COLOR_BLUE_ONE) range:redRange];
    [self.labName setAttributedText:noteStr];
    //self.labName.text = comment;
    self.labName.frame = CGRectMake(5, 5, self.backView.frame.size.width-10, [[self class] hightComment:commentModel.comment]);
    [self setNeedsLayout];
}
+ (CGFloat)hightComment:(NSString *)comment{
    return [comment jk_heightWithFont:FontS(FONT_MIDDLE) constrainedToWidth:KMainScreenWidth-75-20-10];
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
        _labName.font = FontS(FONT_MIDDLE);
        _labName.numberOfLines = 0;
        [_labName sizeToFit];
    }
    return _labName;
}
@end
