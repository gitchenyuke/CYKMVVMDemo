//
//  BaseCollectionViewCellProtocol.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/26.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseCollectionViewCellProtocol <NSObject>
@optional
- (void)cyk_bindViewModel;
- (void)cyk_addSubviews;
@end
