//
//  TimeSelectView.m
//  Meetings_OC
//
//  Created by sxq on 2017/3/27.
//  Copyright © 2017年 sxq. All rights reserved.
//

#import "TimeSelectView.h"
#import <CoreGraphics/CoreGraphics.h>

static CGFloat const kHeight = 275;

@interface TimeSelectView ()
@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIView *indicator;
@property (nonatomic, strong) CALayer *indicatorLayer;

@property (strong, nonatomic) UIWindow *wrapWindow;
@property (nonatomic, assign, readwrite) BOOL isShow;
@end

@implementation TimeSelectView

#pragma mark - initialized Method

+(instancetype)selectView{
    static TimeSelectView *select = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        select = [[self alloc] init];
        select.isShow = NO;
    });
    return select;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = [self realBounds];
        [self contentSetting];
        [self indicatorSetting];
        [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillShowNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
            [self hidden];
        }];
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
}

- (void)indicatorSetting
{
    _indicatorLayer = [[CALayer alloc] init];
    _indicatorLayer.frame = CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width/ 2 - 20, 2);
    _indicatorLayer.backgroundColor = [UIColor redColor].CGColor;
    [_indicator.layer addSublayer:_indicatorLayer];
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

- (IBAction)dateAction:(id)sender {
    self.indicatorLayer.frame = CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width/ 2 - 20, 2);
}

- (IBAction)timeAction:(id)sender {
    self.indicatorLayer.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/ 2 + 10, 0, [UIScreen mainScreen].bounds.size.width/ 2 - 20, 2);
}


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
