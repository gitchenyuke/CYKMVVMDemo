//
//  CommentInputView.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/22.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseView.h"

@interface CommentInputView : BaseView
@property(nonatomic,strong) UITextView * textView;
@property(nonatomic,strong) UIButton * btnComment;

- (BOOL)cyk_becomeFirstResponder;

@end
