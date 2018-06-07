//
//  HomeViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "HomeViewController.h"
#import "ADViewController.h"
#import "HomeDetailViewController.h"

#import "HomeCollectionViewCell.h"
#import "ADCollectionReusableView.h"

#import "HomeViewModel.h"
#import "HomeModel.h"

static const float HEADVIEWH = 200.0;
@interface HomeViewController ()
@property(nonatomic,strong) HomeViewModel * viewModel;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
}

- (void)cyk_addSubviews{
    [super cyk_addSubviews];
    [self.collectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([HomeCollectionViewCell class])];
    [self.collectionView registerClass:[ADCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([ADCollectionReusableView class])];
    [self.view insertSubview:self.customNavBar aboveSubview:self.collectionView];
    [self.customNavBar wr_setBackgroundAlpha:0];
    self.customNavBar.barBackgroundColor = ColorS(COLOR_PINK);
}

- (void)cyk_bindViewModel{
    
    [super cyk_bindViewModel];
    
    self.cellSize = CGSizeMake((KMainScreenWidth-40)/3.0, (KMainScreenWidth-40)/3.0);

    [[self.viewModel.requestRemoteDataCommand.executing skip:1] subscribeNext:^(id x) {
        if ([x isEqualToNumber:@(YES)]) {
            [SVProgressHUD showWithStatus:@"正在加载..."];
        }else {
            [SVProgressHUD dismiss];
        }
    }];
    
//    [[[self.viewModel.refreshDataCommand.executing skip:1]
//      doNext:^(id x) {
//          //@strongify(self);
//          //[self.view endEditing:YES];
//      }] subscribeNext:^(NSNumber * showHud) {
//          //@strongify(self);
//          if (showHud.boolValue) {
//              [SVProgressHUD showWithStatus:@"正在加载..."];
//              //[MBProgressHUD mh_showProgressHUD:@"请稍后..."];
//          }else {
//              [SVProgressHUD dismiss];
//              //[MBProgressHUD mh_hideHUD];
//          }
//      }];
    
    // 接收滚动广告的点击信号
    [[self.viewModel.ADEndSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        [MGJRouter openURL:[NSString stringWithFormat:@"cyk://ad_view?imagePath=%@",(NSString *)x]];
    }];
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    return [HomeCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
}

//设置标题头的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(KMainScreenWidth, HEADVIEWH);
}
//需要自定义，需要注册
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    ADCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([ADCollectionReusableView class]) forIndexPath:indexPath];
    view.viewModel = self.viewModel;
    //标题头
    if (kind == UICollectionElementKindSectionHeader) {}
    return view;
}

- (void)configureCell:(HomeCollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(HomeModel *)object{
    cell.model = object;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0){
        CGFloat alpha = offsetY/HEADVIEWH>1.0f?1.f:offsetY/HEADVIEWH;
        [self.customNavBar wr_setBackgroundAlpha:alpha];
    }else{
        [self.customNavBar wr_setBackgroundAlpha:0];
    }
}
- (HomeViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[HomeViewModel alloc] init];
    }
    return _viewModel;
}

@end
