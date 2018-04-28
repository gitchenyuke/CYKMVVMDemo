//
//  HomeViewModel.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/27.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseViewModel.h"

@interface HomeViewModel : BaseViewModel
// 头部刷新命令
@property (nonatomic, strong) RACCommand *refreshDataCommand;
// 刷新结束信号
@property (nonatomic, strong) RACSubject *refreshEndSubject;
// cell的点击事件信号
@property (nonatomic, strong) RACSubject *cellClickSubject;
// 数据源
@property (nonatomic, strong) NSMutableArray *dataArray;
@end
