//
//  NewResult.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseResult.h"
#import "NewModel.h"

@interface NewResult : BaseResult
@property(nonatomic,strong) NSArray<Optional,NewModel> * info;
@end
