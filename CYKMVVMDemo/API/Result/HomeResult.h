//
//  HomeResult.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/27.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseResult.h"
#import "HomeModel.h"
@interface HomeResult : BaseResult
@property(nonatomic,strong) NSArray<HomeModel,Optional> * info;
@end
