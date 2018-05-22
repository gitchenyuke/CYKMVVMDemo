//
//  PublishMessageViewModel.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/18.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseViewModel.h"
#import "FriendHeaderViewFrame.h"
#import "FriendViewModel.h"

@interface PublishMessageViewModel : BaseViewModel
/// 发表按钮有效性
@property(nonatomic,strong) RACSignal *validLoginSignal;
/// 发表命令
@property(nonatomic,strong) RACCommand * publishCommand;
/// 说说模型对象
@property(nonatomic,strong) FriendHeaderViewFrame * friendModel;
/// 列表数据模型
@property(nonatomic,strong) FriendViewModel * friendViewModel;
/// 说说内容
@property(nonatomic,strong) NSString * message;

@end
