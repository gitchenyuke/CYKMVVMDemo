//
//  CYKWebViewModel.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/8.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseViewModel.h"

@interface CYKWebViewModel : BaseViewModel
/// 是否取消导航栏的title等于webView的title。默认是不取消，default is NO
@property (nonatomic, readwrite, assign) BOOL shouldDisableWebViewTitle;
/// 是否取消关闭按钮。默认是不取消，default is NO
@property (nonatomic, readwrite, assign) BOOL shouldDisableWebViewClose;
@end
