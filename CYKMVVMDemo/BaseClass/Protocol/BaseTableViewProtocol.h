//
//  BaseTableViewProtocol.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/2.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol BaseViewModelProtocol;
@protocol BaseTableViewProtocol <NSObject>
// 创建viewmodel
- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel style:(UITableViewStyle)style;
// 绑定ViewModel
- (void)cyk_bindViewModel;
// 设置View
- (void)cyk_addSubviews;

@end
