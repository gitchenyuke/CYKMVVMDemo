//
//  BaseTableViewCell.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
#pragma mark - 公共方法
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    return [self cellWithTableView:tableView style:UITableViewCellStyleDefault];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style{
    static NSString *ID = @"BaseTableViewCell";
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:ID];
    }
    return cell;
}
+ (CGFloat)getTableViewCellHightModel:(id)model
{
    return 0;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self cyk_addSubviews];
        [self cyk_bindViewModel];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self cyk_addSubviews];
        [self cyk_bindViewModel];
    }
    return self;
}
- (void)cyk_addSubviews{}
- (void)cyk_bindViewModel{}
@end
