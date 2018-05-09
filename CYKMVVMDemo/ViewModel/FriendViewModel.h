//
//  FriendViewModel.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/3.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseViewModel.h"

@interface FriendViewModel : BaseViewModel
@property(nonatomic,strong) RACCommand * didSelectedPicCommand;
@end
