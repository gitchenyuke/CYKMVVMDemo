//
//  HomeDetailViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/23.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "HomeDetailViewController.h"
#import "HomeDetailTableCell.h"
#import "WRNavigationBar.h"
#import "CYKHomeDetailViewModel.h"
#import "HomeModel.h"

@interface HomeDetailViewController ()
@property (nonatomic, readwrite, strong) CYKHomeDetailViewModel * viewModel;
@property (nonatomic, readwrite ,strong) UIImageView * ivThum;
@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"朋友圈"];
}
- (void)cyk_addSubviews{
    [super cyk_addSubviews];
    self.tableView.tableHeaderView = self.ivThum;
}
- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    return [HomeDetailTableCell cellWithTableView:tableView];
}
#pragma mark - UITableViewDataSource & UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.f;
}
- (void)configureCell:(HomeDetailTableCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object{
    HomeModel * model = (HomeModel *)object;
    cell.model = model;
}

- (CYKHomeDetailViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[CYKHomeDetailViewModel alloc] init];
    }
    return _viewModel;
}
- (UIImageView *)ivThum{
    if (!_ivThum) {
        _ivThum = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KMainScreenWidth, 200)];
        _ivThum.backgroundColor = [UIColor redColor];
        _ivThum.userInteractionEnabled = YES;
        [_ivThum jk_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [self.viewModel.didHeaderViewColorCommand execute:_ivThum];
        }];
    }
    return _ivThum;
}

@end
