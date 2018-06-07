//
//  HomeViewModel.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/27.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseCollectionViewModel.h"

@interface HomeViewModel : BaseCollectionViewModel
// 滚动广告图的点击信号
@property (nonatomic, strong) RACSubject *ADEndSubject;

@end
