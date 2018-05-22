//
//  CYKTableView.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/2.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewProtocol.h"
@interface CYKTableView : UIView<UITableViewDelegate, UITableViewDataSource,BaseTableViewProtocol>

@property(nonatomic,readonly,strong) UITableView *tableView;

@end
