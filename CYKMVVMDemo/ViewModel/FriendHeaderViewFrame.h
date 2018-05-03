//
//  FriendHeaderViewFrame.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/3.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendModel.h"
@interface FriendHeaderViewFrame : NSObject
@property(nonatomic,assign) CGRect iconFrame;
@property(nonatomic,assign) CGRect nameFrame;
@property(nonatomic,assign) CGRect contentFrame;
@property(nonatomic,assign) CGRect dateFrame;
@property(nonatomic,assign) CGRect picViewFrame;
@property(nonatomic,assign) CGFloat hight;
@property(nonatomic,strong) FriendModel * model;
@end
