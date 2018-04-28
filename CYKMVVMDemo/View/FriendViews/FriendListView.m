//
//  FriendListView.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/28.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "FriendListView.h"
#import "FriendHeaderView.h"
#import "FriendFirstCommentCell.h"
@interface FriendListView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;

@end
@implementation FriendListView
- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel
{
    self.viewModel = (BaseViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}
- (void)cyk_addSubviews{
    [self addSubview:self.tableView];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NewModel * model = self.viewModel.dataArray[indexPath.row];
    NSString * indetinfi = @"FriendFirstCommentCell";
    FriendFirstCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:indetinfi];
    if (cell == nil) {
        cell = [[FriendFirstCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetinfi];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 200.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *iden = @"HeadView";
    FriendHeaderView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:iden];
    if (view == nil) {
        view = [[FriendHeaderView alloc] initWithReuseIdentifier:iden];
        [view.contentView setBackgroundColor:[UIColor purpleColor]];
    }
    return view;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[FriendFirstCommentCell class] forCellReuseIdentifier:NSStringFromClass([FriendFirstCommentCell class])];
        [_tableView registerClass:[FriendHeaderView class] forHeaderFooterViewReuseIdentifier:@"HeadView"];
    }
    return _tableView;
}
@end
