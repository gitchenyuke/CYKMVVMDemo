//
//  NewViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "NewViewController.h"

#import "NewTableViewCell.h"
#import "NewTwoTableViewCell.h"
#import "NewModel.h"
#import "NewsViewModel.h"

@interface NewViewController ()
@property(nonatomic,strong) NewsViewModel * viewModel;

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"新闻"];
    [self setupNavBar];
    self.customNavBar.title = @"新闻";
}
- (void)cyk_addSubviews{
    [super cyk_addSubviews];
    // 重写布局
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(SafeAreaTopHeight);
        make.left.right.bottom.equalTo(self.view);
    }];
    [self.tableView registerClass:[NewTableViewCell class] forCellReuseIdentifier:NSStringFromClass([NewTableViewCell class])];
    [self.tableView registerClass:[NewTwoTableViewCell class] forCellReuseIdentifier:NSStringFromClass([NewTwoTableViewCell class])];
}
#pragma mark - UITableViewDataSource & UITableViewDelegate
// 优雅的布局多种cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewModel * model = self.viewModel.dataSource[indexPath.row];
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellIdentifier];
    if (cell == nil) {
        cell = [[BaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:model.cellIdentifier];
    }
    cell.model = model;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewModel * model = self.viewModel.dataSource[indexPath.row];
    return [model cellHight];
}

- (NewsViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[NewsViewModel alloc] init];
    }
    return _viewModel;
}
@end

