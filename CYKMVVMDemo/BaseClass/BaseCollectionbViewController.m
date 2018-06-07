//
//  BaseCollectionbViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/25.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseCollectionbViewController.h"

@interface BaseCollectionbViewController ()
@property(nonatomic,readwrite,weak) UICollectionView * collectionView;
@property(nonatomic,readwrite,strong) BaseCollectionViewModel * viewModel;
@end

@implementation BaseCollectionbViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)cyk_bindViewModel{
    [super cyk_bindViewModel];
    // 监听视图模型的数据源  deliverOnMainThread 主线程异步刷新
    @weakify(self)
    [[RACObserve(self.viewModel, dataSource) deliverOnMainThread] subscribeNext:^(id x) {
        @strongify(self)
        [self.collectionView reloadData];
    }];
    
    // 订阅command命令中的信号
    [[self.viewModel.requestRemoteDataCommand.executionSignals.switchToLatest deliverOnMainThread] subscribeNext:^(id x) {
        @strongify(self)
        [self.collectionView reloadEmptyDataSet];
        if ([self.collectionView.mj_header isRefreshing]) {
            [self.collectionView.mj_header endRefreshing];
        }
        if ([self.collectionView.mj_footer isRefreshing]) {
            [self.collectionView.mj_footer endRefreshing];
        }
    }];
}

- (void)setCellSize:(CGSize)cellSize{_cellSize = cellSize;}

- (void)cyk_addSubviews{
    [super cyk_addSubviews];
    self.cellSize = CGSizeMake(50, 50);
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //UICollectionView  的实例化
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    //UICollectionViewDelegateFlowLayout  代理
    collectionView.delegate = self;
    //UICollectionViewDataSource   数据源协议
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    self.collectionView = collectionView;
    
    // 添加加载刷新
    if (self.viewModel.shouldPullDownToRefresh) {
        self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            /// 请求第一页的网络数据
            self.viewModel.page = 1;
            [self.viewModel.requestRemoteDataCommand execute:@(self.viewModel.page)];
        }];
        [self.collectionView.mj_header beginRefreshing];
    }
    
    if (self.viewModel.shouldPullUpToRefresh) {
        self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self.viewModel.requestRemoteDataCommand execute:@(self.viewModel.page+1)];
        }];
    }
}
- (void)configureCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object{}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
//设置段数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    //是否有分段
    if (self.viewModel.shouldMultiSections) return self.viewModel.dataSource?self.viewModel.dataSource.count : 1;
    return 1;
}
//设置单元格个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.viewModel.shouldMultiSections) return [self.viewModel.dataSource[section] count];
    return self.viewModel.dataSource.count;
}
//只能用注册自定义cell的方式
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    return [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [self collectionView:collectionView dequeueReusableCellWithIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    // fetch object
    id object = nil;
    if (self.viewModel.shouldMultiSections) object = self.viewModel.dataSource[indexPath.section][indexPath.row];
    if (!self.viewModel.shouldMultiSections) object = self.viewModel.dataSource[indexPath.row];
    
    /// bind model
    [self configureCell:cell atIndexPath:indexPath withObject:(id)object];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return _cellSize;
}

//设置边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //上左下右
    return UIEdgeInsetsMake(10 ,10, 10, 10);
}
//点击方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel.didSelectCommand execute:indexPath];
}

@end
