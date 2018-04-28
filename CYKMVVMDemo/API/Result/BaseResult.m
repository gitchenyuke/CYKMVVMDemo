//
//  BaseResult.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseResult.h"

@implementation BaseResult
- (BOOL)isSuccess{
    return self.code == 0;
}
@end
