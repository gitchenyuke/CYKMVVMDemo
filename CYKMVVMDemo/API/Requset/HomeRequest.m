//
//  HomeRequest.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/27.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "HomeRequest.h"

@implementation HomeRequest
- (id)initHomeRequest{
    self = [super init];
    if (self) {
    }
    return self;
}

- (NSString *)requestUrl{
    return @"news/topicOrderSource/list";
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}

- (id)requestArgument{
    return @{};
}

- (HomeResult *)result{
    NSError *err = nil;
    HomeResult *result = [[HomeResult alloc] initWithDictionary:[self responseJSONObject] error:&err];
    if (err == nil) {
        return  result;
    }
    return nil;
}

@end
