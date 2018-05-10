//
//  BaseTableViewCell.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
#import "BaseModel.h"
@interface BaseTableViewCell : UITableViewCell<BaseViewProtocol>
@property(nonatomic,strong)  BaseModel * model;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;
+ (CGFloat)getTableViewCellHightModel:(id)model;
@end
