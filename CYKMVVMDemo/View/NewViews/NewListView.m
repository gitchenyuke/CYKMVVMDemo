//
//  NewListView.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "NewListView.h"
#import "NewModel.h"
#import "NewTableViewCell.h"
#import "NewTwoTableViewCell.h"

@interface NewListView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;

@end

@implementation NewListView

- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel
{
    self.viewModel = (NewViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}
- (void)cyk_addSubviews
{
    [self addSubview:self.tableView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
}
- (void)cyk_bindViewModel
{
    @weakify(self)
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self)
        // 执行头部刷新命令
        [self.viewModel.refreshDataCommand execute:self.tableView];
    }];
    // 自动刷新
    [self.tableView.mj_header beginRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewModel * model = self.viewModel.dataArray[indexPath.row];
    return [model cellHight];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewModel * model = self.viewModel.dataArray[indexPath.row];
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellIdentifier];
    if (cell == nil) {
        cell = [[BaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:model.cellIdentifier];
    }
    cell.model = model;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 发送cell点击事件信号
    [self.viewModel.cellClickSubject sendNext:self.viewModel.dataArray[indexPath.row]];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[NewTableViewCell class] forCellReuseIdentifier:NSStringFromClass([NewTableViewCell class])];
        [_tableView registerClass:[NewTwoTableViewCell class] forCellReuseIdentifier:NSStringFromClass([NewTwoTableViewCell class])];
    }
    return _tableView;
}

@end
