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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cyk_addSubviews];
    [self cyk_bindViewModel];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    if (@available(iOS 11.0, *)) { // 适配ios11 tableView 滑动头尾部乱跳
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
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

- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self = [super init];
    if (self) {
        [self cyk_addSubviews];
        [self cyk_bindViewModel];
    }
    return self;
}

- (void)cyk_addSubviews{}
- (void)cyk_bindViewModel{}

@end
