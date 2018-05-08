//
//  FriendFooterView.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/3.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "FriendFooterView.h"

@interface FriendFooterView ()
@property(nonatomic,strong) UIImageView * ivLine;

@end
@implementation FriendFooterView

+ (instancetype)footerViewWithTableView:(UITableView *)tableView{
    static NSString * identifier = @"FriendFooterView";
    FriendFooterView * footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (footer == nil) {
        footer = [[self alloc] initWithReuseIdentifier:identifier];
    }
    return footer;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpViews];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)setUpViews{
    _ivLine = [UIImageView new];
    _ivLine.backgroundColor = ColorS(COLOR_LINE);
    [self.contentView addSubview:_ivLine];
    [_ivLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.contentView);
        make.height.mas_offset(0.5);
    }];
}
@end
