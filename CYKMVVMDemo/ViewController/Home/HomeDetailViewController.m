//
//  HomeDetailViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/23.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "HomeDetailViewController.h"
#import "BaseNavigationController.h"
#import "FriendListView.h"
#import "WRNavigationBar.h"

@interface HomeDetailViewController ()
@property(nonatomic,strong) FriendListView * listView;
@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self setTitle:_model.topicName];
    [self setTitle:@"朋友圈"];
    [self wr_setNavBarBarTintColor:ColorS(@"#37363B")];
    [self wr_setNavBarTitleColor:[UIColor whiteColor]];
}

- (void)cyk_addSubviews
{
    [self.view addSubview:self.listView];
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.listView.frame = CGRectMake(0,0, KMainScreenWidth, KMainScreenHeigth-SafeAreaTopHeight);
}
- (FriendListView *)listView{
    if (!_listView) {
        _listView = [[FriendListView alloc] initWithViewModel:nil style:UITableViewStyleGrouped];
    }
    return _listView;
}

@end
