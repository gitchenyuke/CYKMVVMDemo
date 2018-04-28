//
//  NewRequest.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "NewRequest.h"

@implementation NewRequest
- (id)initNewRequest{
    self = [super init];
    if (self) {
    }
    return self;
}

- (NSString *)requestUrl{
    return @"user/article/list///80/20";
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}

- (id)requestArgument{
    return @{};
}

- (NewResult *)result{
    NSError *err = nil;
    NewResult *result = [[NewResult alloc] initWithDictionary:[self responseJSONObject] error:&err];
    if (err == nil) {
        return  result;
    }
    return nil;
}

@end
