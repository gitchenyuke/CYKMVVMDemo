//
//  RefreshHeader.h
//  Xiaozhuonline
//
//  Created by Zhuang on 2017/3/24.
//  Copyright © 2017年 dianrui. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

@interface RefreshHeader : MJRefreshGifHeader

@property(nonatomic,strong)NSMutableArray *refreshImages;//刷新动画的数组图片
@property(nonatomic,strong)NSMutableArray *normalImages;//普通状态下的数组图片

@end
