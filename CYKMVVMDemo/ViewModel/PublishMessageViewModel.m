//
//  PublishMessageViewModel.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/18.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "PublishMessageViewModel.h"
#import "PublishMessageViewController.h"

@implementation PublishMessageViewModel
- (void)cyk_initialize{
    [super cyk_initialize];
    
    self.validLoginSignal = [[RACSignal combineLatest:@[RACObserve(self, message)] reduce:^(NSString * message){
        return @(MHStringIsNotEmpty(message));
    }] distinctUntilChanged];
    
    @weakify(self)
    self.publishCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
        FriendModel * model = [[FriendModel alloc] init];
        model.name = @"小明";
        model.state = self.message;
        self.friendModel.model = model;
        [self.friendViewModel.didPublishSubject sendNext:self.friendModel];
        UIViewController * viewController = (UIViewController *)input;
        [viewController.navigationController popViewControllerAnimated:YES];
        return [RACSignal empty];
    }];
}

- (FriendHeaderViewFrame *)friendModel{
    if (!_friendModel) {
        _friendModel = [[FriendHeaderViewFrame alloc] init];
    }
    return _friendModel;
}

@end
