//
//  RefreshFooter.m
//  Xiaozhuonline
//
//  Created by Zhuang on 2017/3/24.
//  Copyright © 2017年 dianrui. All rights reserved.
//

#import "RefreshFooter.h"

@implementation RefreshFooter

- (void)prepare{
    [super prepare];
    
    //刷新状态字体颜色
    self.stateLabel.textColor = [UIColor jk_colorWithHexString:@"#969696"];
    self.stateLabel.font = [UIFont boldSystemFontOfSize:13];
    
    [self.gifView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.stateLabel.mas_centerY).offset(0);
        make.centerX.equalTo(self.stateLabel.mas_centerX).offset(-80);
    }];
    
    //普通状态的图片
    [self setImages:self.normalImages forState:MJRefreshStateIdle];
    
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [self setImages:self.refreshImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:self.refreshImages forState:MJRefreshStateRefreshing];
    
}
- (void)placeSubviews{
    [super placeSubviews];
}
- (NSMutableArray *)refreshImages{
    if (!_refreshImages) {
        _refreshImages = [NSMutableArray new];
        for (int i = 0; i < 5 ; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_%d",i + 1]];
            [self.refreshImages addObject:image];
        }
    }
    return _refreshImages;
}
- (NSMutableArray *)normalImages{
    if (!_normalImages) {
        _normalImages = [NSMutableArray new];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_1"]];
        [self.normalImages addObject:image];
    }
    return _normalImages;
}

@end
