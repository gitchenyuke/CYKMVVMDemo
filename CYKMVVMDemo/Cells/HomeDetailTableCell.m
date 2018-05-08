//
//  HomeDetailTableCell.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/7.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "HomeDetailTableCell.h"
#import "HomeModel.h"
@interface HomeDetailTableCell ()
@property(nonatomic,strong) UIImageView * ivThum;
@property(nonatomic,strong) UILabel * labTitle;

@end
@implementation HomeDetailTableCell

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style{
    static NSString *ID = @"HomeDetailTableCell";
    HomeDetailTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:ID];
    }
    return cell;
}

- (void)cyk_addSubviews{
    
    _ivThum = [UIImageView new];
    
    _labTitle = [UILabel new];
    
    [self.contentView addSubview:_ivThum];
    [self.contentView addSubview:_labTitle];
    
    [_ivThum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_offset(15);
        make.size.mas_offset(CGSizeMake(50, 50));
    }];
    
    [_labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_ivThum.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)setModel:(HomeModel *)model{
    _labTitle.text = model.topicName;
    [_ivThum sd_setImageWithURL:URL(model.iconUrl) placeholderImage:ImageNamed(@"tab_discover_normal")];
}

@end
