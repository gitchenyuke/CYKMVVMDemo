//
//  AppDelegate.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "BaseNavigationController.h"
#import "LoginViewController.h"
#import "RouterManager.h"
#import "IQKeyboardManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //服务端接口配置
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = DominUrl;
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    /** 键盘与输入框的距离 */
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    //LoginViewController *loginVC = [[LoginViewController alloc] init];
    self.window.rootViewController = mainVC;
    
    @weakify(self)
    [[MHNotificationCenter rac_addObserverForName:MHSwitchRootViewControllerNotification object:nil] subscribeNext:^(id x) {
        @strongify(self)
        [self loginSuccess];
    }];
    
    // config Router
    [[RouterManager shareScheme] scanResultJump];
    
    return YES;
}

- (void)loginSuccess{
    [UIView transitionWithView:[[UIApplication sharedApplication].delegate window] duration:0.3 options: UIViewAnimationOptionTransitionCrossDissolve animations:^{
        BOOL oldState=[UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        MainViewController *mainVC = [[MainViewController alloc] init];
        self.window.rootViewController = mainVC;
        [UIView setAnimationsEnabled:oldState];
    }completion:NULL];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
