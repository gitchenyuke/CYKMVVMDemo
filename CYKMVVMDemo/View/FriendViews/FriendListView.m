//
//  FriendListView.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/28.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "FriendListView.h"
#import "CommentInputView.h"
#import "FriendHeaderView.h"
#import "FriendFooterView.h"
#import "FriendFirstCommentCell.h"

#import "FriendModel.h"
#import "FriendHeaderViewFrame.h"
@interface FriendListView ()
/// 评论的View
@property(nonatomic,strong) CommentInputView * inputView;

@end
@implementation FriendListView
- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel style:(UITableViewStyle)style{
    self.viewModel = (FriendViewModel *)viewModel;
    return [super initWithViewModel:viewModel style:style];
}
- (void)cyk_addSubviews{
    self.tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView cyk_registerCell:[FriendFirstCommentCell class]];
    [self.tableView cyk_registerView:[FriendHeaderView class]];
    [self.tableView cyk_registerView:[FriendFooterView class]];
}
- (void)cyk_bindViewModel{
    [super cyk_bindViewModel];
    
    @weakify(self)
    [[RACObserve(self.viewModel, dataSource) deliverOnMainThread] subscribeNext:^(id x) {
        @strongify(self)
        [self.tableView reloadData];
    }];
    
    /// 评论回调
    [self.viewModel.didCommentSubject subscribeNext:^(id x) {
        @strongify(self)
        [self endEditing:YES];
        self.inputView.textView.text = @"";
        [self.tableView reloadData];
    }];
    
    /// 监听评论内容
    RAC(self.viewModel,comment) = self.inputView.textView.rac_textSignal;
    /// 是否可以评论
    RAC(self.inputView.btnComment,enabled) = self.viewModel.validCommentSignal;
    /// 发表评论
    [[self.inputView.btnComment rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self)
        [self.viewModel.didCommentCommand execute:nil];
    }];

    /// 监听键盘弹出
    [[[[MHNotificationCenter rac_addObserverForName:UIKeyboardWillChangeFrameNotification object:nil] takeUntil:self.rac_willDeallocSignal] deliverOnMainThread] subscribeNext:^(NSNotification * notification) {
        NSDictionary *info = [notification userInfo];
        CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
        CGRect kbRect = [value CGRectValue];

        // 添加移动动画，使视图跟随键盘移动
        [UIView animateWithDuration:duration animations:^{
            CGRect inputRect = _inputView.frame;
            inputRect.origin.y = CGRectGetMinY(kbRect)-inputRect.size.height;
            [_inputView setFrame:inputRect];
        }];
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModel.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    FriendHeaderViewFrame * viewFrame = self.viewModel.dataSource[section];
    return viewFrame.model.comments.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendHeaderViewFrame * viewFrame = self.viewModel.dataSource[indexPath.section];
    if (indexPath.row == viewFrame.model.comments.count-1) {
        return [FriendFirstCommentCell calculateFriendFirstCommentCellHight:viewFrame.model.comments[indexPath.row]]+5;
    }
    return [FriendFirstCommentCell calculateFriendFirstCommentCellHight:viewFrame.model.comments[indexPath.row]];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendFirstCommentCell *cell = [FriendFirstCommentCell cellWithTableView:tableView];
    FriendHeaderViewFrame * viewFrame = self.viewModel.dataSource[indexPath.section];
    if (indexPath.row == viewFrame.model.comments.count-1) {
        [cell reloadModel:viewFrame.model.comments[indexPath.row] marger:5];
    }else{
        [cell reloadModel:viewFrame.model.comments[indexPath.row] marger:0];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    FriendHeaderViewFrame * viewFrame = self.viewModel.dataSource[section];
    return viewFrame.hight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 15.f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    FriendHeaderView * headerView = [FriendHeaderView headerViewWithTableView:tableView];
    FriendHeaderViewFrame * viewFrame = self.viewModel.dataSource[section];
    headerView.btnComment.tag = section;
    headerView.viewFrame = viewFrame;
    [headerView.btnComment addTarget:self action:@selector(didCommentAction:) forControlEvents:UIControlEventTouchUpInside];
    return headerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [FriendFooterView footerViewWithTableView:tableView];
}
- (void)didCommentAction:(UIButton *)sender{
    FriendHeaderViewFrame * viewFrame = self.viewModel.dataSource[sender.tag];
    self.viewModel.viewFrame = viewFrame;
    [self.inputView cyk_becomeFirstResponder];
}
- (CommentInputView *)inputView{
    if (!_inputView) {
        _inputView = [[CommentInputView alloc] initWithFrame:CGRectMake(0, KMainScreenHeigth, KMainScreenWidth, 40)];
        _inputView.backgroundColor = ColorS(COLOR_BOTTOM);
        [self addSubview:_inputView];
    }
    return _inputView;
}

@end
