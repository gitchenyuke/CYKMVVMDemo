//
//  FriendModel.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/2.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseModel.h"
#import "FriendCommentModel.h"
@interface FriendModel : BaseModel
@property(nonatomic,assign) int id;//
@property(nonatomic,strong) NSString<Optional> * name;//名称
@property(nonatomic,strong) NSString<Optional> * icon;//头像
@property(nonatomic,strong) NSString<Optional> * state;//说说
@property(nonatomic,strong) NSArray<Optional>  * images;//图片
@property(nonatomic,strong) NSArray<Optional>  * comments;//评论列表
@end
