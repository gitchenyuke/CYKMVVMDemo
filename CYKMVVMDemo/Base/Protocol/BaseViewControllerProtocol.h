//
//  BaseViewControllerProtocol.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewModelProtocol;

@protocol BaseViewControllerProtocol <NSObject>
@optional //可实现可不实现
// 绑定viewModel
- (instancetype)initWithViewModel:(id <BaseViewModelProtocol>)viewModel;
// 绑定逻辑
- (void)cyk_bindViewModel;
- (void)cyk_addSubviews;
@end
