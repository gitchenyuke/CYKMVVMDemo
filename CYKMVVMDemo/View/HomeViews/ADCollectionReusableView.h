//
//  ADCollectionReusableView.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/26.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "HomeViewModel.h"
@interface ADCollectionReusableView : UICollectionReusableView<SDCycleScrollViewDelegate>
@property(nonatomic,strong) SDCycleScrollView *advView;
@property(nonatomic,strong) HomeViewModel * viewModel;
@property(nonatomic,strong) NSArray *localImages;
@end
