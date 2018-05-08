//
//  FriendFirstCommentCell.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/28.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface FriendFirstCommentCell : BaseTableViewCell
+ (CGFloat)calculateFriendFirstCommentCellHight:(id)model;
- (void)reloadModel:(id)model marger:(CGFloat)marger;
@end
