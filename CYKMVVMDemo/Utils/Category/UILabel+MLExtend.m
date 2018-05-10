//
//  UILabel+MLExtend.m
//  molihuanxiang
//
//  Created by yukechen on 2017/6/26.
//  Copyright © 2017年 yukechen. All rights reserved.
//

#import "UILabel+MLExtend.h"

@implementation UILabel (MLExtend)

- (UILabel *)initWithTextColor:(UIColor *)color TextFont:(CGFloat)font{
    self = [super init];
    if (self) {
        [self setTextColor:color];
        [self setFont:[UIFont systemFontOfSize:font]];
    }
    return self;
}

@end
