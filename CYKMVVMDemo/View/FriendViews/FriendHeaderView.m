//
//  FriendHeaderView.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/28.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "FriendHeaderView.h"
#import "CommentPicView.h"

@interface FriendHeaderView ()
@property(nonatomic,strong) UIImageView * ivIcon;
@property(nonatomic,strong) UILabel * labName;
@property(nonatomic,strong) UILabel * labContent;
@property(nonatomic,strong) UILabel * labDate;
@property(nonatomic,strong) CommentPicView * picView;
@end

@implementation FriendHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView{
    static NSString * identifier = @"FriendHeaderView";
    FriendHeaderView * header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (header == nil) {
        header = [[self alloc] initWithReuseIdentifier:identifier];
    }
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpViews];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setViewFrame:(FriendHeaderViewFrame *)viewFrame{
    self.labName.text = viewFrame.model.name;
    self.labContent.text = viewFrame.model.state;
    self.picView.picPathStringsArray = viewFrame.model.images;
    self.labDate.text = @"1天前";
    self.ivIcon.image = ImageNamed(@"icon.jpg");
    
    self.ivIcon.frame = viewFrame.iconFrame;
    self.labName.frame = viewFrame.nameFrame;
    self.labContent.frame = viewFrame.contentFrame;
    self.picView.frame = viewFrame.picViewFrame;
    self.labDate.frame = viewFrame.dateFrame;
}
- (void)setUpViews{
    [self.contentView addSubview:self.ivIcon];
    [self.contentView addSubview:self.labName];
    [self.contentView addSubview:self.labContent];
    [self.contentView addSubview:self.labDate];
    [self.contentView addSubview:self.picView];
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
        _labContent.numberOfLines = 0;
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
