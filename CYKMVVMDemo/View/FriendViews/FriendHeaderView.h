//
//  FriendHeaderView.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/28.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendHeaderViewFrame.h"
@interface FriendHeaderView : UITableViewHeaderFooterView
@property(nonatomic,strong) FriendHeaderViewFrame * viewFrame;
+ (instancetype)headerViewWithTableView:(UITableView *)tableView;
@end
