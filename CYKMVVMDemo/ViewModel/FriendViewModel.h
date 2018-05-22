//
//  FriendViewModel.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/3.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseTableViewModel.h"

@class FriendHeaderViewFrame;
@interface FriendViewModel : BaseTableViewModel
/// 发送说说的信号
@property(nonatomic,strong) RACSubject * didPublishSubject;
/// 评论回调 评论完成刷新列表
@property(nonatomic,strong) RACSubject * didCommentSubject;
/// 评论事件
@property(nonatomic,strong) RACCommand * didCommentCommand;
/// 评论按钮有效性
@property(nonatomic,strong) RACSignal *validCommentSignal;
/// 评论的对象
@property(nonatomic,strong) FriendHeaderViewFrame * viewFrame;
/// 评论内容
@property(nonatomic,strong) NSString * comment;

@end
