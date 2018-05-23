//
//  BaseTableViewController.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/7.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTableViewModel.h"
#import "UIScrollView+EmptyDataSet.h"
#import "WRCustomNavigationBar.h"

@interface BaseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
/// The table view for tableView controller.
/// tableView
@property (nonatomic, readonly, weak) UITableView *tableView;
/// 默认35.f
@property (nonatomic,assign) CGFloat cellHight;
/// 自定义导航栏
@property (nonatomic,strong) WRCustomNavigationBar *customNavBar;

/// reload tableView data , sub class can override
- (void)reloadData;

/// dequeueReusableCell
- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

/// configure cell data
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object;
/// configure customNav
- (void)setupNavBar;
@end
