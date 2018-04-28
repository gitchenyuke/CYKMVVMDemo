//
//  UIViewController+CurrentViewController.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/27.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CurrentViewController)

+ (UIViewController *)currentViewController;

+ (UINavigationController *)currentNavigationViewController;


@end
