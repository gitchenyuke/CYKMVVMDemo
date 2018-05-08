//
//  BaseTableViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/7.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseTableViewController.h"
static float CELL_DEF_HIGHT = 35.f;
@interface BaseTableViewController ()
/// tableView
@property (nonatomic, readwrite, weak)  UITableView *tableView;
/// 视图模型
@property (nonatomic, readwrite, strong) BaseTableViewModel *viewModel;

@end

@implementation BaseTableViewController
@dynamic viewModel;
- (void)dealloc
{
    // set nil
    _tableView.dataSource = nil;
    _tableView.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)cyk_bindViewModel{
    [super cyk_bindViewModel];
    // 监听视图模型的数据源
    @weakify(self)
    [[RACObserve(self.viewModel, dataSource) deliverOnMainThread] subscribeNext:^(id x) {
        @strongify(self)
        [self reloadData];
    }];
    
    // 订阅command命令中的信号
    [self.viewModel.requestRemoteDataCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self)
        if ([self.tableView.mj_header isRefreshing]) {
            [self.tableView.mj_header endRefreshing];
        }
        if ([self.tableView.mj_footer isRefreshing]) {
            [self.tableView.mj_footer endRefreshing];
        }
    }];
}

- (void)cyk_addSubviews{
    [super cyk_addSubviews];
    /// CoderMikeHe FIXED: 纯代码布局，子类如果重新布局，建议用Masonry重新设置约束
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.viewModel.style];
    // 注册cell
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    tableView.backgroundColor = ColorS(COLOR_BOTTOM);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // set delegate and dataSource
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    self.tableView = tableView;
    
    // 添加加载刷新
    if (self.viewModel.shouldPullDownToRefresh) {
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            /// 请求第一页的网络数据
            self.viewModel.page = 1;
            [self.viewModel.requestRemoteDataCommand execute:@(self.viewModel.page)];
        }];
        [self.tableView.mj_header beginRefreshing];
    }
    
    if (self.viewModel.shouldPullUpToRefresh) {
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self.viewModel.requestRemoteDataCommand execute:@(self.viewModel.page+1)];
        }];
    }
    
    if (@available(iOS 11.0, *)) {
        /// CoderMikeHe: 适配 iPhone X + iOS 11，
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    }
}

/// reload tableView data
- (void)reloadData{
    [self.tableView reloadData];
}
/// duqueueReusavleCell
- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
}

/// configure cell data
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object {}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //是否有分段
    if (self.viewModel.shouldMultiSections) return self.viewModel.dataSource?self.viewModel.dataSource.count : 0;
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.viewModel.shouldMultiSections) return [self.viewModel.dataSource[section] count];
    return self.viewModel.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELL_DEF_HIGHT;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self tableView:tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    // fetch object
    id object = nil;
    if (self.viewModel.shouldMultiSections) object = self.viewModel.dataSource[indexPath.section][indexPath.row];
    if (!self.viewModel.shouldMultiSections) object = self.viewModel.dataSource[indexPath.row];
    
    /// bind model
    [self configureCell:cell atIndexPath:indexPath withObject:(id)object];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 执行 commond
    [self.viewModel.didSelectCommand execute:indexPath];
}

- (void)setupNavBar
{
    [self.view addSubview:self.customNavBar];
    [self.customNavBar wr_setBottomLineHidden:YES];
    // 自定义导航栏背景颜色
    self.customNavBar.barBackgroundColor = [UIColor whiteColor];
    // 设置初始导航栏透明度
    [self.customNavBar wr_setBackgroundAlpha:1];
    // 设置自定义导航栏标题颜色
    self.customNavBar.titleLabelColor = ColorS(COLOR_BLACK_ONE);
}
- (WRCustomNavigationBar *)customNavBar
{
    if (_customNavBar == nil) {
        _customNavBar = [WRCustomNavigationBar CustomNavigationBar];
    }
    return _customNavBar;
}
@end
