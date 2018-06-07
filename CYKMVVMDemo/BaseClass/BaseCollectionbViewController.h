//
//  BaseCollectionbViewController.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/25.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseViewController.h"
#import "UIScrollView+EmptyDataSet.h"
#import "BaseCollectionViewModel.h"
@interface BaseCollectionbViewController : BaseViewController
<
  UICollectionViewDelegate,
  UICollectionViewDataSource,
  UICollectionViewDelegateFlowLayout,
  DZNEmptyDataSetSource,
  DZNEmptyDataSetDelegate
>
@property(nonatomic,readonly,weak) UICollectionView * collectionView;
/// default 50,50
@property(nonatomic,assign) CGSize cellSize;
/// dequeueReusableCell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;
/// configure cell data
- (void)configureCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object;
@end
