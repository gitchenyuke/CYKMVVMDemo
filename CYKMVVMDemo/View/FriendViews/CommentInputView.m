//
//  CommentInputView.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/22.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "CommentInputView.h"

@implementation CommentInputView

- (BOOL)cyk_becomeFirstResponder{ return [self.textView becomeFirstResponder]; }

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.textView = [[UITextView alloc] initWithFrame:CGRectZero];
        self.textView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.textView];
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_offset(UIEdgeInsetsMake(5, 5, 5, 50));
        }];
        
        ViewBorderRadius(self.textView, 5, 0.5, ColorS(COLOR_LINE));
        
        self.btnComment = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.btnComment];
        [self.btnComment setTitle:@"评论" forState:UIControlStateNormal];
        self.btnComment.titleLabel.font = FontS(FONT_MIDDLE);
        [self.btnComment setTitleColor:ColorS(COLOR_BLACK_THREE) forState:UIControlStateDisabled];
        [self.btnComment setTitleColor:ColorS(COLOR_BLUE_ONE) forState:UIControlStateNormal];
        [self.btnComment mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.mas_offset(-5);
            make.size.mas_offset(CGSizeMake(40, 30));
        }];
    }
    return self;
}

@end
