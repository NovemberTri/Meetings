//
//  TimeSelectView.h
//  Meetings_OC
//
//  Created by sxq on 2017/3/27.
//  Copyright © 2017年 sxq. All rights reserved.
//

#import "BaseXibView.h"

@interface TimeSelectView : BaseXibView
@property (nonatomic, assign, readonly) BOOL isShow;

- (void)show;
- (void)hidden;
@end
