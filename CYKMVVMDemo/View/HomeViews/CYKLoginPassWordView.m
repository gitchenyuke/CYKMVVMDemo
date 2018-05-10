//
//  CYKLoginPassWordView.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/9.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "CYKLoginPassWordView.h"

@implementation CYKLoginPassWordView

- (instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder{
    self = [super init];
    if (self) {
        
        _labTitle = [[UILabel alloc] initWithTextColor:ColorS(COLOR_BLACK_ONE) TextFont:FONT_MIDDLE];
        _labTitle.text = title;
        
        _textField = [[UITextField alloc] initWithFrame:CGRectZero];
        _textField.font = FontS(FONT_MIDDLE);
        _textField.placeholder = placeholder;
        
        _ivLine = [UIImageView new];
        _ivLine.backgroundColor = ColorS(COLOR_LINE);
        
        [self addSubview:_labTitle];
        [self addSubview:_textField];
        [self addSubview:_ivLine];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.equalTo(self);
        make.width.mas_offset(100);
    }];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_labTitle.mas_right).offset(0);
        make.centerY.right.equalTo(self);
        make.height.mas_offset(25);
    }];
    
    [_ivLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.mas_offset(0.5);
    }];
}

@end
