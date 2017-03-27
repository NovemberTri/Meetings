//
//  TimeSelectButton.m
//  Meetings_OC
//
//  Created by sxq on 2017/3/27.
//  Copyright © 2017年 sxq. All rights reserved.
//

#import "TimeSelectButton.h"
#import "TimeSelectView.h"

@interface TimeSelectButton ()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *wrapButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) TimeSelectView *selectView;

@end

IB_DESIGNABLE
@implementation TimeSelectButton

#pragma mark - Initialized Method

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initFromXibForView:_contentView frame:^CGRect(CGRect frame) {
            return frame;
        }];
        self.selectView = [TimeSelectView selectView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initFromXibForView:_contentView frame:^CGRect(CGRect frame) {
            return frame;
        }];
        self.selectView = [TimeSelectView selectView];
    }
    return self;
}



#pragma mark - Setters

- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
}

- (void)setTitleAlignment:(TitleSelectButtonTitleAlignment)titleAlignment{
    _titleAlignment = titleAlignment;
    [self.titleLabel setTextAlignment:(NSTextAlignment)titleAlignment];
}

#pragma mark - Actions
- (IBAction)action:(id)sender {
    [self.selectView show];
}

@end
