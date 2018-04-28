//
//  NewModel.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "NewModel.h"
#import "NewTableViewCell.h"
#import "NewTwoTableViewCell.h"

@implementation NewModel
- (NSString *)cellIdentifier
{
    if ([_showType integerValue]==2) {
        return NSStringFromClass([NewTwoTableViewCell class]);
    }else{
        return NSStringFromClass([NewTableViewCell class]);
    }
}
- (CGFloat)cellHight
{
    if ([_showType integerValue]==2) {
        return [NewTwoTableViewCell getTableViewCellHightModel:self];
    }else{
        return [NewTableViewCell getTableViewCellHightModel:self];
    }
}
@end
