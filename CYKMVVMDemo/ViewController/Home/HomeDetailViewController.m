//
//  HomeDetailViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/23.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "HomeDetailViewController.h"
#import "BaseNavigationController.h"


@interface HomeDetailViewController ()

@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:_model.topicName];
}



@end
