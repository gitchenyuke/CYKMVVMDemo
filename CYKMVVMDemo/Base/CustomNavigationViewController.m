//
//  CustomNavigationViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/26.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "CustomNavigationViewController.h"

@interface CustomNavigationViewController ()

@end

@implementation CustomNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavBar];
}

- (void)setupNavBar
{
    [self.view addSubview:self.customNavBar];
    [self.customNavBar wr_setBottomLineHidden:YES];
    // 自定义导航栏背景颜色
    self.customNavBar.barBackgroundColor = [UIColor whiteColor];
    // 设置初始导航栏透明度
    [self.customNavBar wr_setBackgroundAlpha:1];
    // 设置自定义导航栏标题颜色
    self.customNavBar.titleLabelColor = ColorS(COLOR_BLACK_ONE);
}
- (WRCustomNavigationBar *)customNavBar
{
    if (_customNavBar == nil) {
        _customNavBar = [WRCustomNavigationBar CustomNavigationBar];
    }
    return _customNavBar;
}
@end
