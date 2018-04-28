//
//  HomeViewModel.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/27.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "HomeViewModel.h"
#import "HomeRequest.h"
@implementation HomeViewModel
- (void)cyk_initialize
{
    // 订阅command命令中的信号 (头部刷新)
    @weakify(self)
    [self.refreshDataCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self)
        NSLog(@"数据请求成功~");
        [self.refreshEndSubject sendNext:nil]; //加载完成 发送请求数据源信号
    }];
    //加载过程
    [[[self.refreshDataCommand.executing skip:1] take:1] subscribeNext:^(id x) {
        if ([x isEqualToNumber:@(YES)]) {
                //正在加载
            NSLog(@"正在加载...");
           // BaseViewController * viewCtl = (BaseViewController *)[UIViewController currentViewController];
            
        }
    }];
}
//创建信号
- (RACCommand *)refreshDataCommand
{
    if (!_refreshDataCommand) {
        @weakify(self)
        // 创建命令
        _refreshDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self)
            // 创建信号
            
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                HomeRequest * req = [[HomeRequest alloc] initHomeRequest];
                [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                    [self.dataArray removeAllObjects];
                    HomeRequest * req = (HomeRequest *)request;
                    HomeResult * res = [req result];
                    if ([res isSuccess]) {
                        [self.dataArray addObjectsFromArray:res.info];
                    }
                    [subscriber sendNext:nil]; //网络请求成功 发送信号
                    [subscriber sendCompleted]; //完成
                } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                    [subscriber sendNext:nil]; //网络请求成功 发送信号
                    [subscriber sendCompleted]; //完成
                }];
                return nil;
            }];
        }];
    }
    return _refreshDataCommand;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (RACSubject *)refreshEndSubject {
    if (!_refreshEndSubject) {
        _refreshEndSubject = [RACSubject subject];
    }
    return _refreshEndSubject;
}
- (RACSubject *)cellClickSubject {
    if (!_cellClickSubject) {
        _cellClickSubject = [RACSubject subject];
    }
    return _cellClickSubject;
}
@end
