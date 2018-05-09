//
//  RouterManager.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/9.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "RouterManager.h"
#import "CYKControllerObject.h"

@implementation RouterManager
+ (instancetype)shareScheme{
    static RouterManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)scanResultJump{
    // HomeDetailViewController
    [MGJRouter registerURLPattern:@"cyk://home_detail" toHandler:^(NSDictionary *routerParameters) {
        HomeDetailViewController * homeDetailController = [HomeDetailViewController new];
        [self pushViewController:homeDetailController animated:YES];
    }];
    
    // NewWebViewController (url是http链接 不能直接传 需转为字典传过来)
    [MGJRouter registerURLPattern:@"cyk://new_web" toHandler:^(NSDictionary *routerParameters) {
        NewWebViewController * newWebController = [NewWebViewController new];
        newWebController.url = routerParameters[MGJRouterParameterUserInfo][@"url"];
        [self pushViewController:newWebController animated:YES];
    }];
    
    // TestTableViewController
    [MGJRouter registerURLPattern:@"cyk://test_tab" toHandler:^(NSDictionary *routerParameters) {
        TestTableViewController * testController = [TestTableViewController new];
       [self pushViewController:testController animated:YES];
    }];
    
    // ADViewController
    [MGJRouter registerURLPattern:@"cyk://ad_view" toHandler:^(NSDictionary *routerParameters) {
        ADViewController * adController = [ADViewController new];
        adController.imagePath = routerParameters[@"imagePath"];
        [self pushViewController:adController animated:YES];
    }];
}

- (void)pushViewController:(UIViewController *)controller animated:(BOOL)animated{
    UIViewController * currentController = [UIViewController currentViewController];
    [currentController.navigationController pushViewController:controller animated:animated];
}

@end
