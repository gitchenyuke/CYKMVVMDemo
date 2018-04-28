//
//  ADViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/28.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "ADViewController.h"

@interface ADViewController ()
@property(nonatomic,strong) UIImageView * ivThum;

@end

@implementation ADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"广告图"];
    [self.view addSubview:self.ivThum];
    self.ivThum.image = ImageNamed(_imagePath);
}

- (UIImageView *)ivThum{
    if (!_ivThum) {
        _ivThum = [[UIImageView alloc] initWithFrame:self.view.bounds];
    }
    return _ivThum;
}

@end
