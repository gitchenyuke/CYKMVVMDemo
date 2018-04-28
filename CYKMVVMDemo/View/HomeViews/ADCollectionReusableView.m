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
- (void)setViewModel:(HomeViewModel *)viewModel{
    _viewModel = viewModel;
}
- (SDCycleScrollView *)advView
{
    if (_advView == nil) {
        _localImages = @[@"picture0.jpeg", @"picture1.jpeg", @"picture2.jpeg", @"picture3.jpeg"];
        _advView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KMainScreenWidth, 200) imageNamesGroup:_localImages];
        _advView.delegate = self;
        _advView.pageDotColor = [UIColor grayColor];
        _advView.autoScrollTimeInterval = 2;
        _advView.currentPageDotColor = [UIColor whiteColor];
        _advView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    }
    return _advView;
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSString * imagePath = _localImages[index];
    [_viewModel.ADEndSubject sendNext:imagePath];
}
@end
