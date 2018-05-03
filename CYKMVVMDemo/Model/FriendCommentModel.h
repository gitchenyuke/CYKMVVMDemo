//
//  FriendCommentModel.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/2.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseModel.h"
@protocol FriendCommentModel;
@interface FriendCommentModel : BaseModel
@property(nonatomic,strong) NSString<Optional> * comment;//评论内容
@property(nonatomic,strong) NSString<Optional> * friendName;//朋友名称
@property(nonatomic,assign) int type;//1:评论 2:回复

@end
