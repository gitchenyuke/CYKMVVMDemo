//
//  ADCollectionReusableView.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/26.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "ADCollectionReusableView.h"

@implementation ADCollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.advView];
    }
    return self;
}
- (SDCycleScrollView *)advView
{
    if (_advView == nil) {
        NSArray *localImages = @[@"picture0.jpeg", @"picture1.jpeg", @"picture2.jpeg", @"picture3.jpeg"];
        _advView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KMainScreenWidth, 200) imageNamesGroup:localImages];
        _advView.pageDotColor = [UIColor grayColor];
        _advView.autoScrollTimeInterval = 2;
        _advView.currentPageDotColor = [UIColor whiteColor];
        _advView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    }
    return _advView;
}
@end
