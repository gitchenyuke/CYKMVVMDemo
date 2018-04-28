//
//  UIViewController+CurrentViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/27.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "UIViewController+CurrentViewController.h"

@implementation UIViewController (CurrentViewController)
+ (UIViewController *)currentViewController {
    UIViewController *rootViewController = self.applicationDelegate.window.rootViewController;
    return [self currentViewControllerFrom:rootViewController];
}

+(UINavigationController *)currentNavigationViewController {
    UIViewController *currentViewController = [self currentViewController];
    return currentViewController.navigationController;
}
+ (id<UIApplicationDelegate>)applicationDelegate {
    return [UIApplication sharedApplication].delegate;
}

/** 递归拿到当控制器 */
+ (UIViewController *)currentViewControllerFrom:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)viewController;
        return [self currentViewControllerFrom:navigationController.viewControllers.lastObject];
    } else if ([viewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tableBarController = (UITabBarController *)viewController;
        return [self currentViewControllerFrom:tableBarController.selectedViewController];
    } else if (viewController.presentedViewController != nil) {
        return [self currentViewControllerFrom:viewController.presentedViewController];
    } else {
        return viewController;
    }
}
@end
