//
//  HomeCollectionViewCell.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/26.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "HomeModel.h"
#define CELL_WIDT self.contentView.frame.size.width-25
@interface HomeCollectionViewCell ()
@property(nonatomic,strong) UIImageView * ivThum;
@property(nonatomic,strong) UILabel * labTitle;
@end
@implementation HomeCollectionViewCell
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HomeCollectionViewCell";
    HomeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    return cell;
}
- (void)cyk_addSubviews
{
    [self.contentView addSubview:self.ivThum];
    [self.contentView addSubview:self.labTitle];
    self.labTitle.text = @"侧说几句";
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.ivThum.frame = CGRectMake(10, 0, CELL_WIDT, CELL_WIDT);
    self.labTitle.frame = CGRectMake(0, CELL_WIDT+5, self.contentView.frame.size.width, 20);
}
- (void)setModel:(HomeModel *)model
{
    [self.ivThum sd_setImageWithURL:URL(model.iconUrl) placeholderImage:ImageNamed(@"tab_discover_normal")];
    self.labTitle.text = model.topicName;
}
- (UIImageView *)ivThum{
    if (!_ivThum) {
        _ivThum = [UIImageView new];
        _ivThum.backgroundColor = ColorS(COLOR_BOTTOM);
        ViewRadius(_ivThum, (CELL_WIDT)/2);
    }
    return _ivThum;
}
- (UILabel *)labTitle{
    if (!_labTitle) {
        _labTitle = [UILabel new];
        _labTitle.textColor = ColorS(COLOR_BLACK_ONE);
        _labTitle.font = FontS(FONT_MIDDLE);
        _labTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _labTitle;
}
@end
