//
//  UITableView+MHExtension.m
//  WeChat
//
//  Created by senba on 2017/5/19.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import "UITableView+MHExtension.h"

@implementation UITableView (MHExtension)

- (void)cyk_registerCell:(Class)cls {
    
    [self cyk_registerCell:cls forCellReuseIdentifier:NSStringFromClass(cls)];
}
- (void)cyk_registerCell:(Class)cls forCellReuseIdentifier:(NSString *)reuseIdentifier
{
    [self registerClass:cls forCellReuseIdentifier:reuseIdentifier];
}


- (void)cyk_registerNibCell:(Class)cls {
    [self cyk_registerNibCell:cls forCellReuseIdentifier:NSStringFromClass(cls)];
}
- (void)cyk_registerNibCell:(Class)cls forCellReuseIdentifier:(NSString *)reuseIdentifier
{
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cls) bundle:nil] forCellReuseIdentifier:reuseIdentifier];
}


- (void)cyk_registerView:(Class)cls{
    [self cyk_registerView:cls forViewReuseIdentifier:NSStringFromClass(cls)];
}
- (void)cyk_registerView:(Class)cls forViewReuseIdentifier:(NSString *)reuseIdentifier{
    [self registerClass:cls forHeaderFooterViewReuseIdentifier:reuseIdentifier];
}


- (void)cyk_registerNibView:(Class)cls{
    [self cyk_registerNibView:cls forViewReuseIdentifier:NSStringFromClass(cls)];
}
- (void)cyk_registerNibView:(Class)cls forViewReuseIdentifier:(NSString *)reuseIdentifier{
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cls) bundle:nil] forHeaderFooterViewReuseIdentifier:reuseIdentifier];
}

@end
