//
//  BaseView.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

// 初始化
- (instancetype)init{
    self = [super init];
    if (self) {
        [self cyk_addSubviews];
        [self cyk_bindViewModel];
    }
    return self;
}
// 绑定数据的初始化
- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel
{
    self = [super init];
    if (self) {
        [self cyk_addSubviews];
        [self cyk_bindViewModel];
    }
    return self;
}
- (void)cyk_addSubviews{}
- (void)cyk_bindViewModel{}
@end
