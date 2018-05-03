//
//  CYKTableView.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/2.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "CYKTableView.h"

@interface CYKTableView ()
@property (nonatomic, assign) UITableViewStyle tableViewStyle;
@end
@implementation CYKTableView
- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel style:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        _tableViewStyle = style;
        [self cyk_addSubviews];
        [self cyk_bindViewModel];
    }
    return self;
}
- (void)cyk_addSubviews{
    // 适配 ios 11
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
}
- (void)cyk_bindViewModel{}
#pragma mark - TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}
- (UITableView *)tableView
{
    if(_tableView == nil)
    {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:self.tableViewStyle];
        [self addSubview:tableView];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView = tableView;
    }
    return _tableView;
}
- (NSMutableArray *)datas{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}
- (void)dealloc
{
    
}
@end
