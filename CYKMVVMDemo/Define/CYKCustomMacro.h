//
//  CYKCustomMacro.h
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/20.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#ifndef CYKCustomMacro_h
#define CYKCustomMacro_h

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

// 是否为空对象
#define MHObjectIsNil(__object)  ((nil == __object) || [__object isKindOfClass:[NSNull class]])
// 字符串为空
#define MHStringIsEmpty(__string) ((__string.length == 0) || MHObjectIsNil(__string))
// 字符串不为空
#define MHStringIsNotEmpty(__string)  (!MHStringIsEmpty(__string))
// 数组为空
#define MHArrayIsEmpty(__array) ((MHObjectIsNil(__array)) || (__array.count==0))
// 通知中心
#define MHNotificationCenter [NSNotificationCenter defaultCenter]
/// AppDelegate
#define MHSharedAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
//常用宏
#define KMainScreenWidth     [[UIScreen mainScreen] bounds].size.width
#define KMainScreenHeigth    [[UIScreen mainScreen] bounds].size.height
#define KWidth_scale         [[UIScreen mainScreen] bounds].size.width/375.0
#define KHeight_scale        (KMainScreenHeigth == 812.0 ? 667.0/667.0 : KMainScreenHeigth/667.0) //因为iphoneX宽度与iphone8一样,但高度却比iphone8高
#define SafeAreaTopHeight    (KMainScreenHeigth == 812.0 ? 88 : 64) //iphoneX 导航栏高度
#define SafeAreaBottomHeight (KMainScreenHeigth == 812.0 ? 83 : 49) //iphoneX tabar高度

#define ImageNamed(name)     [UIImage imageNamed:name]
#define FontS(s)             [UIFont systemFontOfSize:s] //设置字体大小
#define ColorS(s)            [UIColor jk_colorWithHexString:s] //设置字体颜色
#define URL(s)               [NSURL URLWithString:s]

#define BUTTON_BOTTOM        60//底部按钮统一高度
#define LIST_SIZE            20//列表每页记录数
#define ALER_SPACING         56//提示框距离两边的距离总和

#endif /* CYKCustomMacro_h */
