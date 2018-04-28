//
//  HomeModel.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/27.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseModel.h"
@protocol HomeModel;
@interface HomeModel : BaseModel
@property(nonatomic,strong) NSString<Optional> * topicName;//名称
@property(nonatomic,strong) NSString<Optional> * iconUrl;//logo
@property(nonatomic,strong) NSString<Optional> * id;//名称
@end
