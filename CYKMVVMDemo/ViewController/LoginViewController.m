//
//  LoginViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/9.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "LoginViewController.h"
#import "CYKLoginPassWordView.h"
#import "CYKLoginViewModel.h"
@interface LoginViewController ()
@property(nonatomic,strong) UILabel * labTitle;
@property(nonatomic,strong) UIButton * btnLogin;
@property(nonatomic,strong) CYKLoginPassWordView * accountView;
@property(nonatomic,strong) CYKLoginPassWordView * passWordView;
@property(nonatomic,strong) CYKLoginViewModel * viewModel;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)cyk_addSubviews{
    _labTitle = [[UILabel alloc] initWithTextColor:ColorS(COLOR_BLACK_ONE) TextFont:FONT_BIG];
    _labTitle.text = @"微信号/QQ号/邮箱登录";
    _accountView = [[CYKLoginPassWordView alloc] initWithTitle:@"账号" placeholder:@"微信号/QQ/邮箱"];
    _passWordView= [[CYKLoginPassWordView alloc] initWithTitle:@"密码" placeholder:@"请填写密码"];
    
    _btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btnLogin setTitle:@"登录" forState:UIControlStateNormal];
    _btnLogin.titleLabel.font = FontS(FONT_MIDDLE);
    ViewBorderRadius(_btnLogin, 4, 1, ColorS(COLOR_GREEN));
    [_btnLogin jk_setBackgroundColor:ColorS(COLOR_BLUE) forState:UIControlStateNormal];
    [_btnLogin jk_setBackgroundColor:ColorS(COLOR_LINE) forState:UIControlStateDisabled];
    
    [self.view addSubview:_labTitle];
    [self.view addSubview:_accountView];
    [self.view addSubview:_passWordView];
    [self.view addSubview:_btnLogin];
    
    [_labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.top.mas_offset(120);
        make.height.mas_offset(30);
    }];
    
    [_accountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.top.equalTo(_labTitle.mas_bottom).offset(50);
        make.height.mas_offset(50);
    }];
    
    [_passWordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.top.equalTo(_accountView.mas_bottom).offset(0);
        make.height.mas_offset(50);
    }];
    
    [_btnLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.top.equalTo(_passWordView.mas_bottom).offset(50);
        make.height.mas_offset(50);
    }];
}

- (void)cyk_bindViewModel{
    [super cyk_bindViewModel];
    RAC(self.viewModel,account) = self.accountView.textField.rac_textSignal;
    RAC(self.viewModel,password)= self.passWordView.textField.rac_textSignal;
    
    RAC(self.btnLogin,enabled)  = self.viewModel.validLoginSignal;
   
    @weakify(self)
    [[self.btnLogin rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self)
        [self.viewModel.loginCommand execute:self.btnLogin];
    }];
}

- (CYKLoginViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[CYKLoginViewModel alloc] init];
    }
    return _viewModel;
}

@end
