//
//  BaseViewModel.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel
// 单例
//+ (instancetype)allocWithZone:(struct _NSZone *)zone{
//    BaseViewModel *viewmodel = [super allocWithZone:zone];
//    if (viewmodel) {
//        [viewmodel cyk_initialize];
//    }
//    return viewmodel;
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self cyk_initialize];
    }
    return self;
}
- (void)cyk_initialize{}
@end
