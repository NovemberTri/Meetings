//
//  TimeSelectButton.h
//  Meetings_OC
//
//  Created by sxq on 2017/3/27.
//  Copyright © 2017年 sxq. All rights reserved.
//

#import "BaseXibView.h"

typedef NS_ENUM(NSUInteger, TitleSelectButtonTitleAlignment) {
    TitleSelectButtonTitleAlignmentLeft,
    TitleSelectButtonTitleAlignmentCenter,
    TitleSelectButtonTitleAlignmentRight,
};

@interface TimeSelectButton : BaseXibView
@property (nonatomic, copy)IBInspectable NSString *title;
#if TARGET_INTERFACE_BUILDER
@property (nonatomic, assign) IBInspectable NSInteger titleAlignment;
#else
@property (nonatomic, assign) TitleSelectButtonTitleAlignment titleAlignment;
#endif

@end
