//
//  NewViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "NewViewController.h"
#import "NewWebViewController.h"
#import "NewModel.h"
#import "NewListView.h"
#import "NewViewModel.h"

@interface NewViewController ()
@property(nonatomic,strong) NewListView  * listView;
@property(nonatomic,strong) NewViewModel * viewModel;

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"新闻"];
    self.customNavBar.title = @"新闻";
}

- (void)cyk_addSubviews{
    [self.view addSubview:self.listView];
    self.listView.frame = CGRectMake(0,SafeAreaTopHeight, KMainScreenWidth, KMainScreenHeigth-SafeAreaTopHeight-SafeAreaBottomHeight);
}

- (void)cyk_bindViewModel{
    // 订阅点击事件的预约信号
    @weakify(self)
    [[self.viewModel.cellClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NewModel *model) {
        @strongify(self)
        NewWebViewController * newWebController = [NewWebViewController new];
        newWebController.url = model.url;
        [self.navigationController pushViewController:newWebController animated:YES];
    }];
}

- (NewListView *)listView{
    if (!_listView) {
        _listView = [[NewListView alloc] initWithViewModel:self.viewModel];
    }
    return _listView;
}

- (NewViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[NewViewModel alloc] init];
    }
    return _viewModel;
}
@end
