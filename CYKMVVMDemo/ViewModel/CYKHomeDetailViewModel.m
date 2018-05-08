//
//  CYKHomeDetailViewModel.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/7.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "TestTableViewController.h"
#import "CYKHomeDetailViewModel.h"
#import "HomeRequest.h"

@implementation CYKHomeDetailViewModel
- (void)cyk_initialize{
    [super cyk_initialize];
    // 允许下拉刷新
    self.shouldPullDownToRefresh = YES;
    // 允许上拉加载
    self.shouldPullUpToRefresh   = YES;
    // 显示每页数据为10
    self.perPage = 10;
    
    /// cell 点击事件
    self.didSelectCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSIndexPath * indexPath) {
        UIViewController * currentControll = [UIViewController currentViewController];
        TestTableViewController * testController = [TestTableViewController new];
        [currentControll.navigationController pushViewController:testController animated:YES];
        return [RACSignal empty];
    }];
    
    self.didHeaderViewColorCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(UIImageView * ivThum) {
        ivThum.backgroundColor = [UIColor jk_randomColor];
        return [RACSignal empty];
    }];
}

/// 请求指定页的网络数据
- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page{
    @weakify(self)
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
     @strongify(self)
        HomeRequest * req = [[HomeRequest alloc] initHomeRequest];
        [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            @strongify(self)
            HomeRequest * req = (HomeRequest *)request;
            HomeResult * res = [req result];
            if ([res isSuccess]) {
                if (page == 1) {
                    self.dataSource = res.info;
                }else{
                    // 类似拼接
                    self.dataSource = @[(self.dataSource?:@[]).rac_sequence , res.info.rac_sequence].rac_sequence.flatten.array;
                }
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
