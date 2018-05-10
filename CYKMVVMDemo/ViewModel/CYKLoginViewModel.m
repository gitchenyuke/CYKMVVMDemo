//
//  CYKLoginViewModel.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/9.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "CYKLoginViewModel.h"

@implementation CYKLoginViewModel
- (void)cyk_initialize{
    
    [super cyk_initialize];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(UIButton* sender) {
        [SVProgressHUD showWithStatus:@"正在登陆..."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD showSuccessWithStatus:@"登陆成功"];
            [SVProgressHUD dismissWithDelay:1];
            dispatch_async(dispatch_get_main_queue(), ^{
                [MHNotificationCenter postNotificationName:MHSwitchRootViewControllerNotification object:nil];
            });
            
        });
        return [RACSignal empty];
    }];
    
    /// 按钮的有效性
    self.validLoginSignal = [RACSignal combineLatest:@[RACObserve(self, account),RACObserve(self, password)] reduce:^(NSString *account,NSString *password){
        // 账号不为空 并且密码大于5位数
        return @(MHStringIsNotEmpty(account) && password.length>5);
    }];
}

@end
