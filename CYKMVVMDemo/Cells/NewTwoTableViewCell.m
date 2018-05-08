//
//  NewTwoTableViewCell.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/23.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "NewTwoTableViewCell.h"
#import "NewModel.h"

@interface NewTwoTableViewCell ()
@property(nonatomic,strong) UIImageView * ivThum;
@property(nonatomic,strong) UILabel * labTitle;

@end
@implementation NewTwoTableViewCell

+ (CGFloat)getTableViewCellHightModel:(id)model
{
    return 150;
}
- (void)cyk_addSubviews
{
    [self.contentView addSubview:self.ivThum];
    [self.contentView addSubview:self.labTitle];
}
- (void)setModel:(NewModel *)model
{
    NewModel * newModel = (NewModel *)model;
    self.labTitle.text =  newModel.title;
    NSString * url = newModel.imgsrc.firstObject;
    [self.ivThum sd_setImageWithURL:URL(url) placeholderImage:ImageNamed(@"tab_discover_normal")];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.labTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_offset(10);
        make.right.mas_offset(-10);
    }];
    
    [self.ivThum mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labTitle.mas_bottom).offset(10);
        make.left.right.equalTo(self.labTitle);
        make.height.mas_offset(100);
    }];
}
- (UIImageView *)ivThum
{
    if (!_ivThum) {
        _ivThum = [UIImageView new];
        _ivThum.backgroundColor = [UIColor grayColor];
    }
    return _ivThum;
}
- (UILabel *)labTitle
{
    if (!_labTitle) {
        _labTitle = [UILabel new];
        _labTitle.numberOfLines = 0;
        _labTitle.font = FontS(FONT_MIDDLE);
        _labTitle.textColor = ColorS(COLOR_BLACK_TWO);
    }
    return _labTitle;
}

@end
