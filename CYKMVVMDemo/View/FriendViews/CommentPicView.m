//
//  CommentPicView.m
//  Drlocksystem
//
//  Created by yukechen on 2017/12/12.
//  Copyright © 2017年 dianrui. All rights reserved.
//

#import "CommentPicView.h"

@interface CommentPicView ()
@property (nonatomic, strong) NSArray *imageViewsArray;
@end

@implementation CommentPicView

- (void)cyk_addSubviews{
    NSMutableArray *temp = [NSMutableArray new];
    
    for (int i = 0; i < 9; i++) {
        UIImageView *imageView = [UIImageView new];
        [self addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
        [imageView addGestureRecognizer:tap];
        [temp addObject:imageView];
    }
    self.imageViewsArray = [temp copy];
}
- (void)setPicPathStringsArray:(NSArray *)picPathStringsArray{
    _picPathStringsArray = picPathStringsArray;
    
    for (long i = _picPathStringsArray.count; i < self.imageViewsArray.count; i++) {
        UIImageView *imageView = [self.imageViewsArray objectAtIndex:i];
        imageView.hidden = YES;
    }
    
    if (_picPathStringsArray.count == 0) {
        self.jk_width = 0;
        self.jk_height = 0;
        return;
    }
    
    CGFloat itemW = [self itemWidthForPicPathArray:_picPathStringsArray];
    __block CGFloat itemH = 0;
    if (_picPathStringsArray.count == 1) {
        NSString * entity = _picPathStringsArray.firstObject;
        UIImageView *v1 = self.imageViewsArray.firstObject;
        v1.image = ImageNamed(entity);
        itemH = v1.image.size.height / v1.image.size.width * itemW;
//        __block CGSize imageSize;
//        [v1 sd_setImageWithURL:IMAGE_URL(entity.image) placeholderImage:[UIImage imageNamed:DefaultGraph_one] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//            imageSize = image.size;
//            if (imageSize.width) {
//                itemH = imageSize.height / imageSize.width * itemW;
//            }
//        }];
    } else {
        itemH = itemW;
    }
    long perRowItemCount = [self perRowItemCountForPicPathArray:_picPathStringsArray];
    CGFloat margin = 5;
    
    [_picPathStringsArray enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        long columnIndex = idx % perRowItemCount;
        long rowIndex = idx / perRowItemCount;
        UIImageView *imageView = [_imageViewsArray objectAtIndex:idx];
        imageView.hidden = NO;
        imageView.image = ImageNamed(obj);
        //[imageView sd_setImageWithURL:IMAGE_URL(obj.image) placeholderImage:[UIImage imageNamed:DefaultGraph_one]];
        imageView.frame = CGRectMake(columnIndex * (itemW + margin), rowIndex * (itemH + margin), itemW, itemH);
    }];
    
    CGFloat w = perRowItemCount * itemW + (perRowItemCount - 1) * margin;
    int columnCount = ceilf(_picPathStringsArray.count * 1.0 / perRowItemCount);
    CGFloat h = columnCount * itemH + (columnCount - 1) * margin;
    self.jk_width = w;
    self.jk_height = h;
    self.frame = CGRectMake(0, 0, w, h);
}

#pragma mark - private actions

- (void)tapImageView:(UITapGestureRecognizer *)tap
{
//    UIView *imageView = tap.view;
//    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
//    browser.currentImageIndex = imageView.tag;
//    browser.sourceImagesContainerView = self;
//    browser.imageCount = self.picPathStringsArray.count;
//    browser.delegate = self;
//    [browser show];
}

- (CGFloat)itemWidthForPicPathArray:(NSArray *)array
{
    if (array.count == 1) {
        return KMainScreenWidth-50-15-50/2;
    } else {
        CGFloat w = (KMainScreenWidth-50-15-50-10)/3;
        return w;
    }
}

- (NSInteger)perRowItemCountForPicPathArray:(NSArray *)array
{
    if (array.count < 3) {
        return array.count;
    } else if (array.count <= 4) {
        return 2;
    } else {
        return 3;
    }
}

//#pragma mark - SDPhotoBrowserDelegate
//
//- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
//{
//    CommentImageEntity *entity = self.picPathStringsArray[index];
//    NSURL *url = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,entity.image] withExtension:nil];
//    return url;
//}
//
//- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
//{
//    UIImageView *imageView = self.subviews[index];
//    return imageView.image;
//}


@end
