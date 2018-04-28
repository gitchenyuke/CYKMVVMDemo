//
//  HomeCollectionView.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/26.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseView.h"
#import "HomeViewModel.h"
#import "WRCustomNavigationBar.h"
@interface HomeCollectionView : BaseView
@property(nonatomic,strong) HomeViewModel * viewModel;
@property(nonatomic,strong) WRCustomNavigationBar * customNavBar;
@end
