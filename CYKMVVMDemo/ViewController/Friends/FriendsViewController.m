//
//  FriendsViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "FriendsViewController.h"
#import "PublishMessageViewController.h"
#import "FriendListView.h"
#import "FriendViewModel.h"

@interface FriendsViewController ()
@property(nonatomic,strong) FriendListView * listView;
@property(nonatomic,strong) FriendViewModel * viewModel;
@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    self.customNavBar.title = @"朋友圈";
    self.customNavBar.barBackgroundColor = ColorS(COLOR_PINK);
    [self.customNavBar wr_setRightButtonWithImage:ImageNamed(@"ic_friend_add")];
    @weakify(self)
    self.customNavBar.onClickRightButton = ^{
        @strongify(self)
        PublishMessageViewController * publishController = [PublishMessageViewController new];
        publishController.viewModel.friendViewModel = self.viewModel;
        [self.navigationController pushViewController:publishController animated:YES];
    };
}

- (void)cyk_addSubviews
{
    [self.view addSubview:self.listView];
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.listView.frame = CGRectMake(0,SafeAreaTopHeight, KMainScreenWidth, KMainScreenHeigth-SafeAreaTopHeight-SafeAreaBottomHeight);
}
- (FriendListView *)listView{
    if (!_listView) {
        _listView = [[FriendListView alloc] initWithViewModel:self.viewModel style:UITableViewStyleGrouped];
    }
    return _listView;
}
- (FriendViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[FriendViewModel alloc] init];
    }
    return _viewModel;
}
@end
