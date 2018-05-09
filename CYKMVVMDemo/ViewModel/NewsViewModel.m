//
//  NewsViewModel.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/8.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "NewsViewModel.h"
#import "NewRequest.h"
#import "NewModel.h"

#import "NewWebViewController.h"

@implementation NewsViewModel
- (void)cyk_initialize{
    [super cyk_initialize];
    
    // 允许下拉刷新
    self.shouldPullDownToRefresh = YES;
    // cell 点击事件
    self.didSelectCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSIndexPath * indexPath) {
        NewModel * model = self.dataSource[indexPath.row];
        [MGJRouter openURL:@"cyk://new_web" withUserInfo:@{@"url":model.url} completion:NULL];
        return [RACSignal empty];
    }];
}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page{
    @weakify(self)
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self)
        NewRequest * req = [[NewRequest alloc] initNewRequest];
        [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            NewRequest * req = (NewRequest *)request;
            NewResult * res = [req result];
            if ([res isSuccess]) {
                self.dataSource = res.info;
            }
            [subscriber sendNext:nil]; //网络请求成功 发送信号
            [subscriber sendCompleted]; //完成
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            [subscriber sendNext:nil]; //网络请求成功 发送信号
            [subscriber sendCompleted]; //完成
        }];
        return nil;
    }];
}

@end
