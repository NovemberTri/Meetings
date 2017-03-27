//
//  BaseXibView.h
//  Meetings_OC
//
//  Created by sxq on 2017/3/27.
//  Copyright © 2017年 sxq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseXibView : UIView
- (void) initFromXibForView:(UIView*)view frame:(CGRect(^)(CGRect))resize;
@end
