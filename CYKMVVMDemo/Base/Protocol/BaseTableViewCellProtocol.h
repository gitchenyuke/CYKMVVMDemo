//
//  BaseTableViewCellProtocol.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseTableViewCellProtocol <NSObject>
@optional
- (void)cyk_bindViewModel;
- (void)cyk_addSubviews;
@end
