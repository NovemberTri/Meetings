//
//  MeetingsFlow.m
//  Meetings_OC
//
//  Created by sxq on 2017/3/20.
//  Copyright © 2017年 sxq. All rights reserved.
//

#import "MeetingsFlow.h"

@implementation MeetingsFlow

- (instancetype)init
{
    self = [super init];
    if (self) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        self.itemSize = CGSizeMake(width, 185);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumLineSpacing = 0;
        self.minimumInteritemSpacing = 0;
    }
    return self;
}

@end
