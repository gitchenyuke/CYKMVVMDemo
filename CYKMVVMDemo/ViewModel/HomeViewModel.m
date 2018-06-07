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
    [super cyk_initialize];
    
    self.shouldPullDownToRefresh = YES;
    
    self.didSelectCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [MGJRouter openURL:@"cyk://home_detail"];
        return [RACSignal empty];
    }];
    
}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page{
    @weakify(self)
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        HomeRequest * req = [[HomeRequest alloc] initHomeRequest];
        [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            @strongify(self)
            HomeRequest * req = (HomeRequest *)request;
            HomeResult * res = [req result];
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

- (RACSubject *)ADEndSubject {
    if (!_ADEndSubject) {
        _ADEndSubject = [RACSubject subject];
    }
    return _ADEndSubject;
}
@end
