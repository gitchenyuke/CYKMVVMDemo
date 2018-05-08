//
//  CYKHomeDetailViewModel.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/7.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface CYKHomeDetailViewModel : BaseTableViewModel
/// 表头随机颜色
@property (nonatomic, readwrite, strong) RACCommand *didHeaderViewColorCommand;
@end
