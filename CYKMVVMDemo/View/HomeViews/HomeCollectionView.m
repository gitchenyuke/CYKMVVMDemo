//
//  HomeCollectionView.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/26.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "HomeCollectionView.h"
#import "HomeCollectionViewCell.h"
#import "ADCollectionReusableView.h"
#import "HomeModel.h"

static const float HEADVIEWH = 200.0;
@interface HomeCollectionView ()
<
  UICollectionViewDelegate,
  UICollectionViewDataSource,
  UICollectionViewDelegateFlowLayout
>
@property(nonatomic,strong) UICollectionView * collectionview;
@end

@implementation HomeCollectionView
- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel
{
    self.viewModel = (HomeViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}
- (void)cyk_bindViewModel
{
    // 订阅数据请求结束
    @weakify(self)
    [self.viewModel.refreshEndSubject subscribeNext:^(id x) {
        @strongify(self)
        [self.collectionview reloadData];
    }];
}
- (void)cyk_addSubviews
{
    [self addSubview:self.collectionview];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionview.frame = self.bounds;
}
- (void)setCustomNavBar:(WRCustomNavigationBar *)customNavBar
{
    _customNavBar = customNavBar;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > SafeAreaTopHeight){
        CGFloat alpha = offsetY/HEADVIEWH>1.0f?1.f:offsetY/HEADVIEWH;
        [_customNavBar wr_setBackgroundAlpha:alpha];
    }else{
        [_customNavBar wr_setBackgroundAlpha:0];
    }
}
#pragma mark - UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.viewModel.dataArray.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((KMainScreenWidth-40)/3.0, (KMainScreenWidth-40)/3.0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HomeCollectionViewCell";
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    HomeModel * model = self.viewModel.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}
//设置标题头的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(KMainScreenWidth, HEADVIEWH);
}
//需要自定义，需要注册
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    ADCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([ADCollectionReusableView class]) forIndexPath:indexPath];
    //标题头
    if (kind == UICollectionElementKindSectionHeader) {

    }
    return view;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeModel * model = self.viewModel.dataArray[indexPath.row];
    [self.viewModel.cellClickSubject sendNext:model];
}

- (UICollectionView *)collectionview{
    if (!_collectionview) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collectionview = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionview.showsVerticalScrollIndicator = NO;
        _collectionview.showsHorizontalScrollIndicator = NO;
        _collectionview.delegate = self;
        _collectionview.dataSource = self;
        [_collectionview registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:@"HomeCollectionViewCell"];
        [_collectionview registerClass:[ADCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([ADCollectionReusableView class])];
        _collectionview.backgroundColor = [UIColor clearColor];
    }
    return _collectionview;
}

@end
