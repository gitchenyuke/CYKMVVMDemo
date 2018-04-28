//
//  NewModel.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseModel.h"

@protocol NewModel;
@interface NewModel : BaseModel
@property(nonatomic,strong) NSString<Optional> * id;
@property(nonatomic,strong) NSArray<Optional>  * imgsrc;//thum取第一张
@property(nonatomic,strong) NSString<Optional> * replyCount;//浏览次数
@property(nonatomic,strong) NSString<Optional> * title;//标题
@property(nonatomic,strong) NSString<Optional> * url; //web链接
@property(nonatomic,strong) NSString<Optional> * showType; //显示类型2 全宽 其他默认
@property(nonatomic,strong) NSString<Optional> * cellIdentifier; //cell标识
-(CGFloat)cellHight;
@end
