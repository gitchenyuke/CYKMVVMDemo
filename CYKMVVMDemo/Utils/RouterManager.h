//
//  RouterManager.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/9.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RouterManager : NSObject
+ (instancetype)shareScheme;
- (void)scanResultJump;
@end
