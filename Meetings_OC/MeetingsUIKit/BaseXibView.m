//
//  BaseXibView.m
//  Meetings_OC
//
//  Created by sxq on 2017/3/27.
//  Copyright © 2017年 sxq. All rights reserved.
//

#import "BaseXibView.h"

@implementation BaseXibView

- (void) initFromXibForView:(UIView*)view frame:(CGRect(^)(CGRect))resize{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSArray *views = [bundle loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    view = [views firstObject];
    view.frame = resize(self.bounds);
    [self addSubview:view];
}

@end
