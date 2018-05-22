//
//  FriendViewModel.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/3.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "FriendViewModel.h"
#import "FriendHeaderViewFrame.h"

@implementation FriendViewModel
- (void)cyk_initialize{
    
    self.didPublishSubject = [RACSubject subject];
    
    self.didCommentSubject = [RACSubject subject];
    
    @weakify(self)
    self.didCommentCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
        FriendCommentModel * commentModel = [[FriendCommentModel alloc] init];
        commentModel.friendName = @"五五开";
        commentModel.type = 1;
        commentModel.comment = self.comment;
        NSArray * commentAdd = @[commentModel];
        self.viewFrame.model.comments = @[(self.viewFrame.model.comments ?:@[]).rac_sequence, commentAdd.rac_sequence].rac_sequence.flatten.array;
        [self.didCommentSubject sendNext:nil];
        return [RACSignal empty];
    }];
    
    self.validCommentSignal = [[RACSignal combineLatest:@[RACObserve(self, comment)] reduce:^(NSString * comment){
        return @(MHStringIsNotEmpty(comment));
    }] distinctUntilChanged];
    
    // 预处理发送说说
    [[self.didPublishSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(FriendHeaderViewFrame * viewFrame) {
        NSArray * addData = @[viewFrame];
        /// 类似于拼接 新发说说排在前面
        self.dataSource = @[addData.rac_sequence, (self.dataSource ?:@[]).rac_sequence ].rac_sequence.flatten.array;
    }];
    
    [self reloadData];
}

- (void)reloadData{
    NSMutableArray * arr = [NSMutableArray array];
    for (int i = 0; i<20; i++) {
        FriendModel * model = [[FriendModel alloc] init];
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
        [arr addObject:model];
    }
    // 根据数据转出viewFrame的数组
    self.dataSource = [[self dataSourceWithFriendModels:[arr mutableCopy]] mutableCopy];
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
    }else if (num == 2){
        [arr addObject:@"comment1"];
        [arr addObject:@"comment4"];
    }else if (num == 4){
        [arr addObject:@"comment2"];
        [arr addObject:@"comment3"];
        [arr addObject:@"comment1"];
        [arr addObject:@"comment4"];
    }else{
        for (int i = 0; i<7; i++) {
            NSString * imageUrl = [NSString stringWithFormat:@"comment%d",i+1];
            [arr addObject:imageUrl];
        }
    }
    return [arr mutableCopy];
}

#pragma mark - 辅助方法
- (NSArray *)dataSourceWithFriendModels:(NSArray *)friendModels {
    if (MHObjectIsNil(friendModels) || friendModels.count == 0) return nil;
    NSArray *viewModels = [friendModels.rac_sequence map:^(FriendModel *model) {
        FriendHeaderViewFrame * viewFrame = [[FriendHeaderViewFrame alloc] init];
        viewFrame.model = model;
        return viewFrame;
    }].array;
    return viewModels ?: @[] ;
}

@end
