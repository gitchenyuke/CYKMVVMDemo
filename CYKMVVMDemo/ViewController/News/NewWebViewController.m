//
//  NewWebViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/23.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "NewWebViewController.h"
#import "NewWebViewModel.h"
@interface NewWebViewController ()
@property(nonatomic,readwrite,strong) NewWebViewModel * viewModel;
@end

@implementation NewWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadRequest:_url];
}

- (NewWebViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[NewWebViewModel alloc] init];
    }
    return _viewModel;
}

@end
