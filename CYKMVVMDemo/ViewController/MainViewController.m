//
//  MainViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "NewViewController.h"
#import "FriendsViewController.h"
#import "MeViewController.h"
#import "BaseNavigationController.h"

@interface MainViewController ()
{
    BaseNavigationController *navHomeViewController;
    BaseNavigationController *navNewsViewController;
    BaseNavigationController *navFriendsController;
    BaseNavigationController *navMeViewControoler;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViewControllers];
}

- (void)initViewControllers {
    navHomeViewController = [[BaseNavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]];
    navNewsViewController = [[BaseNavigationController alloc] initWithRootViewController:[[NewViewController alloc] init]];
    navFriendsController  = [[BaseNavigationController alloc] initWithRootViewController:[[FriendsViewController alloc] init]];
    navMeViewControoler   = [[BaseNavigationController alloc] initWithRootViewController:[[MeViewController alloc] init]];
    
    [navHomeViewController.tabBarItem setTitle:@"首页"];
    [navHomeViewController.tabBarItem setImage:[[UIImage imageNamed:@"tab_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [navHomeViewController.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tab_home_checked"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [navNewsViewController.tabBarItem setTitle:@"新闻"];
    [navNewsViewController.tabBarItem setImage:[[UIImage imageNamed:@"tab_store_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [navNewsViewController.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tab_store_checked"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [navFriendsController.tabBarItem setTitle:@"朋友圈"];
    [navFriendsController.tabBarItem setImage:[[UIImage imageNamed:@"tab_discover_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [navFriendsController.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tab_discover_checked"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [navMeViewControoler.tabBarItem setTitle:@"我的"];
    [navMeViewControoler.tabBarItem setImage:[[UIImage imageNamed:@"tab_me_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [navMeViewControoler.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tab_me_checked"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    self.viewControllers = @[navHomeViewController,navNewsViewController,navFriendsController,navMeViewControoler];
}

- (BOOL)prefersStatusBarHidden
{
    return self.selectedViewController.prefersStatusBarHidden;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return self.selectedViewController.preferredStatusBarUpdateAnimation;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return self.selectedViewController.preferredStatusBarStyle;
}

@end
