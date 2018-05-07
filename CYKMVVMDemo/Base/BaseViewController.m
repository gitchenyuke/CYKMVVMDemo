//
//  BaseViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseViewController.h"
#import "HomeViewController.h"
#import "NewViewController.h"
#import "MeViewController.h"
#import "FriendsViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
/// 当“BaseViewController”初始化后会调用
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    BaseViewController *viewController = [super allocWithZone:zone];
    @weakify(viewController)
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        @strongify(viewController)
        [viewController cyk_addSubviews];
        [viewController cyk_bindViewModel];
    }];
    return viewController;
}
- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self = [super init];
    if (self) {}
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    if (@available(iOS 11.0, *)) { // 适配ios11 tableView 滑动头尾部乱跳
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 自定义导航栏需要隐藏系统导航栏
    if ([self isKindOfClass:[HomeViewController class]] ||
        [self isKindOfClass:[NewViewController class]] ||
        [self isKindOfClass:[MeViewController class]] ||
        [self isKindOfClass:[FriendsViewController class]]) {
        if (self.navigationController.navigationBar.hidden == NO) {
            [self.navigationController setNavigationBarHidden:YES animated:YES];
        }
    }else{
        if (self.navigationController.navigationBar.hidden) {
            [self.navigationController setNavigationBarHidden:NO animated:YES];
        }
    }
}
- (void)cyk_addSubviews{}
- (void)cyk_bindViewModel{}

@end
