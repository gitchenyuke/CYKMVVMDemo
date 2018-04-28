//
//  NewViewModel.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "NewViewModel.h"
#import "NewRequest.h"

@implementation NewViewModel
- (void)cyk_initialize
{
    // 订阅command命令中的信号 (头部刷新)
//    @weakify(self)
//    [self.refreshDataCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
//        @strongify(self)
//        NSLog(@"数据请求成功~");
//        [self.refreshEndSubject sendNext:nil]; //加载完成 发送请求数据源信号
//    }];
    
    //加载过程
//    [[[self.refreshDataCommand.executing skip:1] take:1] subscribeNext:^(id x) {
//        if ([x isEqualToNumber:@(YES)]) {
//            //正在加载
//            NSLog(@"正在加载...");
//        }
//    }];
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
            NSLog(@"开始请求");
            UITableView * tableview = input;
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                NewRequest * req = [[NewRequest alloc] initNewRequest];
                [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                    [self.dataArray removeAllObjects];
                    NewRequest * req = (NewRequest *)request;
                    NewResult * res = [req result];
                    if ([res isSuccess]) {
                        [self.dataArray addObjectsFromArray:res.info];
                    }
                    //[subscriber sendNext:nil]; //网络请求成功 发送信号
                    //[subscriber sendCompleted]; //完成
                    [self tableViewEndRefreshing:tableview];
                } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                    //[subscriber sendNext:NETERROR];
                    //[subscriber sendCompleted];
                    [self tableViewEndRefreshing:tableview];
                }];
                return nil;
            }];
        }];
    }
    return _refreshDataCommand;
}

- (void)tableViewEndRefreshing:(UITableView *)tableView
{
    [tableView reloadData];
    if (tableView.mj_header.isRefreshing) {
        [tableView.mj_header endRefreshing];
    }
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (RACSubject *)cellClickSubject {
    if (!_cellClickSubject) {
        _cellClickSubject = [RACSubject subject];
    }
    return _cellClickSubject;
}
@end
