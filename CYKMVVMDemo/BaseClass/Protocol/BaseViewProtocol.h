//
//  BaseViewProtocol.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewModelProtocol;
@protocol BaseViewProtocol <NSObject>
@optional
// 创建viewmodel
- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel;
// 绑定ViewModel
- (void)cyk_bindViewModel;
// 设置View
- (void)cyk_addSubviews;
@end
