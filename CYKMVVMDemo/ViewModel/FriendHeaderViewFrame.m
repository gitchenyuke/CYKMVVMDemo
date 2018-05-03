//
//  FriendHeaderViewFrame.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/3.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "FriendHeaderViewFrame.h"
#import "CommentPicView.h"
static const float ICON_W = 50.f;
@interface FriendHeaderViewFrame ()
@property(nonatomic,strong) CommentPicView * picview;
@end
@implementation FriendHeaderViewFrame

- (void)setModel:(FriendModel *)model{
    _model = model;
    _iconFrame = CGRectMake(15, 15, ICON_W, ICON_W);
    CGFloat x = CGRectGetMaxX(_iconFrame)+10;
    _nameFrame = CGRectMake(x, 15,200, 20);
    _contentFrame = CGRectMake(x, CGRectGetMaxY(_nameFrame)+5, KMainScreenWidth-ICON_W-45, [self commentHight:model.state]);
    _picViewFrame = CGRectMake(x, CGRectGetMaxY(_contentFrame)+5, KMainScreenWidth-ICON_W-55, [self picViewHight:self.picview images:model.images]);
    _dateFrame = CGRectMake(x, CGRectGetMaxY(_picViewFrame)+5, 100, 20);
    _hight = _nameFrame.size.height+_contentFrame.size.height+_picViewFrame.size.height+_dateFrame.size.height+35;
}
- (CGFloat)picViewHight:(CommentPicView *)picView images:(NSArray *)images{
    picView.picPathStringsArray = images;
    return picView.jk_height;
}
- (CGFloat)commentHight:(NSString *)comment{
    return [comment jk_heightWithFont:FontS(FONT_MIDDLE) constrainedToWidth:KMainScreenWidth-ICON_W-45];
}
- (CommentPicView *)picview{
    if (!_picview) {
        _picview = [[CommentPicView alloc] init];
    }
    return _picview;
}

@end
