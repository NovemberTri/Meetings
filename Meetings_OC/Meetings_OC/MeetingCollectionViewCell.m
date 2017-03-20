//
//  MeetingCollectionViewCell.m
//  Meetings_OC
//
//  Created by sxq on 2017/3/20.
//  Copyright © 2017年 sxq. All rights reserved.
//

#import "MeetingCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface MeetingCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIView *mainContainer;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIView *tomatoView;
@property (weak, nonatomic) IBOutlet UILabel *meetingNameLabel;

@end

@implementation MeetingCollectionViewCell

- (void)setMainContainer:(UIView *)mainContainer{
    mainContainer.layer.cornerRadius = 5;
    mainContainer.layer.shadowColor = [UIColor blackColor].CGColor;
    mainContainer.layer.shadowOpacity = .2f;
    mainContainer.layer.shadowRadius = 5.0f;
    mainContainer.layer.shadowOffset = CGSizeMake(0, 0);
    _mainContainer = mainContainer;
}

@end
