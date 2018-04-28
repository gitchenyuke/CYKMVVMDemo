//
//  FriendsViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "FriendsViewController.h"
#import "FriendListView.h"

@interface FriendsViewController ()
@property(nonatomic,strong) FriendListView * listView;
@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.customNavBar.title = @"朋友圈";

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
        _listView = [[FriendListView alloc] initWithViewModel:nil];
    }
    return _listView;
}

@end
