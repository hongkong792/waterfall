
//
//  UIView+MJ.m
//  waterfall
//
//  Created by yangxianggang on 17/2/25.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import "UIView+MJ.h"

@implementation UIView (MJ)


- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
-  (CGFloat)height
{
    return self.frame.size.height;
}

@end
