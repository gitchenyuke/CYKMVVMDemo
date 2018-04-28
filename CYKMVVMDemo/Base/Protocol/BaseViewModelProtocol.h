//
//  BaseViewModelProtocol.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewModelProtocol <NSObject>
@optional
- (instancetype)initWithModel:(id)model;
// 初始化
- (void)cyk_initialize;
@end
