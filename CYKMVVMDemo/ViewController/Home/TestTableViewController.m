//
//  TestTableViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/5/8.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "TestTableViewController.h"
#import "TestTableViewModel.h"

@interface TestTableViewController ()
@property(nonatomic,readwrite,strong) TestTableViewModel * viewModel;
@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"test"];
}
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object{
    NSString * string = (NSString *)object;
    cell.textLabel.text = string;
}
- (void)cyk_bindViewModel{
    [super cyk_bindViewModel];
    self.viewModel.dataSource = @[@"测试基类",@"请开始你的表演",@"3是实话实说"];
}
- (TestTableViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[TestTableViewModel alloc] init];
    }
    return _viewModel;
}

@end
