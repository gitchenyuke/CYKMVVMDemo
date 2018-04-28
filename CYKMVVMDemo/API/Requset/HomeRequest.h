//
//  HomeRequest.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/27.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "Baserequest.h"
#import "HomeResult.h"

@interface HomeRequest : Baserequest
- (id)initHomeRequest;
- (HomeResult *)result;
@end
