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

- (void)cyk_bindViewModel{
    // 发起刷新命令信号
    [self.viewModel.refreshDataCommand execute:nil];
    
    // 订阅command命令中的信号 (头部刷新)
    [[self.viewModel.refreshDataCommand.executing skip:1] subscribeNext:^(id x) {
        if ([x isEqualToNumber:@(YES)]) {
            [SVProgressHUD showWithStatus:@"正在加载..."];
        }else {
            [SVProgressHUD dismiss];
        }
    }];
    
//    [[[self.viewModel.refreshDataCommand.executing skip:1]
//      doNext:^(id x) {
//          //@strongify(self);
//          //[self.view endEditing:YES];
//      }] subscribeNext:^(NSNumber * showHud) {
//          //@strongify(self);
//          if (showHud.boolValue) {
//              [SVProgressHUD showWithStatus:@"正在加载..."];
//              //[MBProgressHUD mh_showProgressHUD:@"请稍后..."];
//          }else {
//              [SVProgressHUD dismiss];
//              //[MBProgressHUD mh_hideHUD];
//          }
//      }];
    
    // 接收滚动广告的点击信号
    [[self.viewModel.ADEndSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        [MGJRouter openURL:[NSString stringWithFormat:@"cyk://ad_view?imagePath=%@",(NSString *)x]];
    }];
    
    // 接收cell点击事件信号
    [[self.viewModel.cellClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        [MGJRouter openURL:@"cyk://home_detail"];
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
