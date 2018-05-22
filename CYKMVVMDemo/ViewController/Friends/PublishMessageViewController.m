//
//  PublishMessageViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/18.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "PublishMessageViewController.h"

@interface PublishMessageViewController ()
@property(nonatomic,strong) UITextView * textView;
@property(nonatomic,strong) UIButton * btnPublish;

@end

@implementation PublishMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"发表说说"];
}

- (void)cyk_addSubviews{
    [super cyk_addSubviews];
    
    [self.view addSubview:self.textView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.btnPublish];
    @weakify(self)
    [[self.btnPublish rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self)
        [self.viewModel.publishCommand execute:self];
    }];
}

- (void)cyk_bindViewModel{
    [super cyk_bindViewModel];
    
    RAC(self.btnPublish,enabled) = self.viewModel.validLoginSignal;
    
    RAC(self.viewModel,message)  = self.textView.rac_textSignal;
}

- (UIButton *)btnPublish{
    if (!_btnPublish) {
        _btnPublish = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnPublish.frame = CGRectMake(0, 0, 50, 30);
        [_btnPublish setTitle:@"发表" forState:UIControlStateNormal];
        [_btnPublish setTitleColor:ColorS(COLOR_BLUE_ONE) forState:UIControlStateNormal];
        [_btnPublish setTitleColor:ColorS(COLOR_LINE) forState:UIControlStateDisabled];
    }
    return _btnPublish;
}

- (UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(15, 30, KMainScreenWidth-30, 200)];
        _textView.font = FontS(FONT_MIDDLE);
        _textView.textColor = ColorS(COLOR_BLUE_ONE);
        _textView.backgroundColor = ColorS(COLOR_BOTTOM);
        [_textView jk_addPlaceHolder:@"请输入你要发表的内容"];
        ViewBorderRadius(_textView, 5, .5, ColorS(COLOR_LINE));
    }
    return _textView;
}

- (PublishMessageViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[PublishMessageViewModel alloc] init];
    }
    return _viewModel;
}

@end
