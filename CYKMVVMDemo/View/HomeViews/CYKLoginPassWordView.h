//
//  CYKLoginPassWordView.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/9.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseView.h"

@interface CYKLoginPassWordView : BaseView
@property(nonatomic,strong) UILabel * labTitle;
@property(nonatomic,strong) UITextField * textField;
@property(nonatomic,strong) UIImageView * ivLine;
- (instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder;
@end
