//
//  FriendListView.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/28.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "CYKTableView.h"
#import "BaseViewModel.h"
@interface FriendListView : CYKTableView
@property(nonatomic,strong) BaseViewModel * viewModel;
@end
