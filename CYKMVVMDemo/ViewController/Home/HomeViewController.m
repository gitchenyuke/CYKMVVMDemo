//
//  HomeViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "HomeViewController.h"
#import "ADViewController.h"
#import "HomeDetailViewController.h"

#import "HomeCollectionView.h"
#import "ADCollectionReusableView.h"

#import "HomeViewModel.h"
#import "HomeModel.h"

@interface HomeViewController ()
@property(nonatomic,strong) HomeCollectionView * homeView;
@property(nonatomic,strong) HomeViewModel * viewModel;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.homeView];
    [self.view insertSubview:self.customNavBar aboveSubview:self.homeView];
    [self.customNavBar wr_setBackgroundAlpha:0];
    self.customNavBar.barBackgroundColor = ColorS(COLOR_PINK);
}

- (void)cyk_bindViewModel
{
    // 发起刷新命令信号
    [self.viewModel.refreshDataCommand execute:nil];
    // 接收滚动广告的点击信号
    @weakify(self)
    [[self.viewModel.ADEndSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        ADViewController * adController = [ADViewController new];
        adController.imagePath = (NSString *)x;
        [self.navigationController pushViewController:adController animated:YES];
    }];
    // 接收cell点击事件信号
    
    [[self.viewModel.cellClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
       @strongify(self)
        HomeModel * model = (HomeModel *)x;
        HomeDetailViewController * homeDetailController = [HomeDetailViewController new];
        homeDetailController.model = model;
        [self.navigationController pushViewController:homeDetailController animated:YES];
    }];
}

- (HomeCollectionView *)homeView{
    if (!_homeView) {
        _homeView = [[HomeCollectionView alloc] initWithViewModel:self.viewModel];
        _homeView.customNavBar = self.customNavBar;
        _homeView.frame = CGRectMake(0, 0, KMainScreenWidth, KMainScreenHeigth-SafeAreaBottomHeight);
    }
    return _homeView;
}

- (HomeViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[HomeViewModel alloc] init];
    }
    return _viewModel;
}

@end
