//
//  FriendListView.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/28.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "FriendListView.h"
#import "FriendHeaderView.h"
#import "FriendFooterView.h"
#import "FriendFirstCommentCell.h"

#import "FriendModel.h"
#import "FriendHeaderViewFrame.h"
@interface FriendListView ()

@end
@implementation FriendListView
- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel style:(UITableViewStyle)style{
    self.viewModel = (BaseViewModel *)viewModel;
    return [super initWithViewModel:viewModel style:style];
}
- (void)cyk_addSubviews{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[FriendFirstCommentCell class] forCellReuseIdentifier:NSStringFromClass([FriendFirstCommentCell class])];
    [self.tableView registerClass:[FriendHeaderView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([FriendHeaderView class])];
    [self.tableView registerClass:[FriendFooterView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([FriendFooterView class])];
    [self reloadData];
}
- (void)reloadData{
    for (int i = 0; i<20; i++) {
        FriendModel * model = [[FriendModel alloc] init];
        FriendHeaderViewFrame * viewFrame = [[FriendHeaderViewFrame alloc] init];
        if (i==0 || i==4|| i == 9) {
            model.name = @"八戒";
            model.state = @"花木兰打完胜仗回国后，皇帝发现她是女子，龙颜大怒，判他欺君之罪，让他和众将士一日之内绣出十副刺绣，木兰为了不连累战友，对皇上请命：臣独秀。";
        }else if (i==2 || i == 7 || i == 13){
            model.name = @"@蛋蛋的情缘";
            model.state = @"有什么事吗我上课上课我是男是女文科生开始我";
        }else if (i == 11 || i == 15 ||i==1 ||i == 19){
            model.name = @"鲁班七号";
            model.state = @"布兰奇号,智障二百五哈哈哈";
        }else{
            model.name = @"崔世特";
            model.state = @"十五年年室内外开始看为空是男是女我和我开始看我看完是累死了送礼物";
        }
        model.id = i;
        model.comments = [self commentWithNum:i];
        model.images = [self imageWithNum:i];
        viewFrame.model = model;
        [self.datas addObject:viewFrame];
    }
    [self.tableView reloadData];
}
- (NSArray *)commentWithNum:(int)num{
    NSMutableArray * arr = [NSMutableArray array];
    for (int i = 0; i<3; i++) {
        FriendCommentModel * commentModel = [[FriendCommentModel alloc] init];
        if (i==2) {
            commentModel.friendName = @"我";
            commentModel.type = 1;
            if (num == 2 || num == 12 || num == 7) {
                commentModel.comment = @"'就是偷这种东西 才能维持的了生活这样子'。解读：无产阶级革命家窃.格瓦拉因为不愿与意识形态上的一切敌人同流合污，失去了经费来源，经济十分窘迫。“偷”字简明而形象地描述了革命家与反动的资产阶级艰苦卓绝的斗争历程，而“维持得了生活”体现出革命家将所缴获的战利品全部捐献给了自己所投身的革命事业，而将自己的生活开支压到最低水平，在糖衣炮弹的诱惑面前展现了一位无产阶级革命者应有的风范";
            }else if (num == 3||num == 10||num == 15){
                commentModel.comment = @"侧睡觉睡觉就可上课课";
            }else{
                commentModel.comment = @"没事没事买明文累死了上是快速开始完了完了了二楼老老实实";
            }
            
        }else{
            commentModel.friendName = @"@蛋蛋的情缘";
            commentModel.type = 1;
            commentModel.comment = @"陈独秀";
        }
        [arr addObject:commentModel];
    }
    return [arr mutableCopy];
}
- (NSArray *)imageWithNum:(int)num{
    NSMutableArray * arr = [NSMutableArray array];
    if (num == 1) {
        [arr addObject:@"comment1"];
    }else{
        for (int i = 0; i<7; i++) {
            NSString * imageUrl = [NSString stringWithFormat:@"comment%d",i+1];
            [arr addObject:imageUrl];
        }
    }
    return [arr mutableCopy];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.datas.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    FriendHeaderViewFrame * viewFrame = self.datas[section];
    return viewFrame.model.comments.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendHeaderViewFrame * viewFrame = self.datas[indexPath.section];
    if (indexPath.row == viewFrame.model.comments.count-1) {
        return [FriendFirstCommentCell calculateFriendFirstCommentCellHight:viewFrame.model.comments[indexPath.row]]+5;
    }
    return [FriendFirstCommentCell calculateFriendFirstCommentCellHight:viewFrame.model.comments[indexPath.row]];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * indetinfi = @"FriendFirstCommentCell";
    FriendFirstCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:indetinfi];
    if (cell == nil) {
        cell = [[FriendFirstCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetinfi];
    }
    FriendHeaderViewFrame * viewFrame = self.datas[indexPath.section];
    if (indexPath.row == viewFrame.model.comments.count-1) {
        [cell reloadModel:viewFrame.model.comments[indexPath.row] marger:5];
    }else{
        [cell reloadModel:viewFrame.model.comments[indexPath.row] marger:0];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    FriendHeaderViewFrame * viewFrame = self.datas[section];
    return viewFrame.hight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 15.f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    static NSString *iden = @"FriendHeaderView";
    FriendHeaderView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:iden];
    if (view == nil) {
        view = [[FriendHeaderView alloc] initWithReuseIdentifier:iden];
    }
    FriendHeaderViewFrame * viewFrame = self.datas[section];
    view.viewFrame = viewFrame;
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    static NSString *iden = @"FriendFooterView";
    FriendFooterView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:iden];
    if (view == nil) {
        view = [[FriendFooterView alloc] initWithReuseIdentifier:iden];
    }
    return view;
}

@end
