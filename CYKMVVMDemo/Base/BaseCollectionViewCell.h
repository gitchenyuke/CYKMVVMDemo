//
//  BaseCollectionViewCell.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/26.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"
#import "BaseCollectionViewCellProtocol.h"
@interface BaseCollectionViewCell : UICollectionViewCell<BaseCollectionViewCellProtocol>
@property(nonatomic,strong)  BaseModel * model;
@end
