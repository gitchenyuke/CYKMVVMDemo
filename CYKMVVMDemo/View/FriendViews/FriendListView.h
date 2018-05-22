//
//  FriendListView.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/28.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "CYKTableView.h"
#import "FriendViewModel.h"
@interface FriendListView : CYKTableView
@property(nonatomic,strong) FriendViewModel * viewModel;
@end
