//
//  BaseViewController.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
#import "WRCustomNavigationBar.h"
@interface BaseViewController : UIViewController<BaseViewProtocol>
@property(nonatomic,strong) WRCustomNavigationBar *customNavBar;
/// customNavigationBar
- (void)setupNavBar;
@end
