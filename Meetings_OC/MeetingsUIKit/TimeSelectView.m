//
//  TimeSelectView.m
//  Meetings_OC
//
//  Created by sxq on 2017/3/27.
//  Copyright © 2017年 sxq. All rights reserved.
//

#import "TimeSelectView.h"

static CGFloat const kHeight = 275;

@interface TimeSelectView ()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) UIWindow *wrapWindow;

@property (nonatomic, assign, readwrite) BOOL isShow;
@end

@implementation TimeSelectView

#pragma mark - initialized Method

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self contentSetting];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.frame = [self realBounds];
        [self contentSetting];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = [[UIScreen mainScreen] bounds];
        [self contentSetting];
    }
    return self;
}

- (void)contentSetting
{
    [self initFromXibForView:_contentView frame:^CGRect(CGRect frame) {
        return [self realBounds];
    }];

    _contentView.layer.shadowColor = [UIColor blackColor].CGColor;
    _contentView.layer.shadowOpacity = 0.1;

    _isShow = NO;
}

#pragma mark - Utils

- (CGRect)realFrame{
    CGRect rect = [[UIScreen mainScreen] bounds];
    return CGRectMake(0,
                      CGRectGetHeight(rect) - kHeight,
                      CGRectGetWidth(rect),
                      kHeight);
}

- (CGRect)realBounds{
    CGRect rect = [[UIScreen mainScreen] bounds];
    return CGRectMake(0,0,
                      CGRectGetWidth(rect),
                      kHeight);
}


#pragma mark - Actions
- (IBAction)cancelAction:(id)sender {
    [self hidden];
}

#pragma mark - Behaviors

- (void)show{
    if (!self.isShow) {
        self.wrapWindow = [[UIWindow alloc] initWithFrame:[self realFrame]];
        [self.wrapWindow addSubview:self];
        [self.wrapWindow makeKeyAndVisible];
        self.transform = CGAffineTransformMakeTranslation(0, kHeight);
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            self.isShow = YES;
        }];
    }
}

- (void)hidden{
    if (self.isShow) {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformMakeTranslation(0, kHeight);
        } completion:^(BOOL finished) {
            for (UIView* subView in self.window.subviews) {
                [subView removeFromSuperview];
            }
            self.wrapWindow = nil;
            self.isShow = false;
        }];
    }
}

@end
