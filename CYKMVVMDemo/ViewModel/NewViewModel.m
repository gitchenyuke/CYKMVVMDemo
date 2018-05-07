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
            NewRequest * req = [[NewRequest alloc] initNewRequest];
            [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                [self.dataArray removeAllObjects];
                NewRequest * req = (NewRequest *)request;
                NewResult * res = [req result];
                if ([res isSuccess]) {
                    [self.dataArray addObjectsFromArray:res.info];
                }
                [self tableViewEndRefreshing:tableview];
            } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                [self tableViewEndRefreshing:tableview];
            }];
            return [RACSignal empty];
        }];
    }
    return _refreshDataCommand;
}

- (void)tableViewEndRefreshing:(UITableView *)tableView{
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
