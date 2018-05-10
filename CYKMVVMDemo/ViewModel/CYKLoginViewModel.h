//
//  CYKLoginViewModel.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/9.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseViewModel.h"

@interface CYKLoginViewModel : BaseViewModel
/// LoginCommand
@property(nonatomic,strong) RACCommand *loginCommand;
/// 登录按钮有效性
@property(nonatomic,strong) RACSignal *validLoginSignal;
/// 账号
@property(nonatomic,strong) NSString * account;
/// 密码
@property(nonatomic,strong) NSString * password;
@end
