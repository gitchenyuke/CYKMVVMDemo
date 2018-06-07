//
//  BaseCollectionViewModel.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/25.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseCollectionViewModel.h"
@interface BaseCollectionViewModel ()
/// request remote data cmd
@property (nonatomic, readwrite, strong) RACCommand *requestRemoteDataCommand;
@end
@implementation BaseCollectionViewModel
- (void)cyk_initialize{
    [super cyk_initialize];
    self.page = 1;
    self.perPage = 20;
    
    /// request remote data
    @weakify(self)
    self.requestRemoteDataCommand = [[RACCommand alloc] initWithSignalBlock:^(NSNumber *page) {
        @strongify(self)
        return [[self requestRemoteDataSignalWithPage:page.unsignedIntegerValue] takeUntil:self.rac_willDeallocSignal];
    }];
}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page {
    return [RACSignal empty];
}
@end
