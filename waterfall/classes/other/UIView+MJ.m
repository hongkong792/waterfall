
//
//  UIView+MJ.m
//  waterfall
//
//  Created by yangxianggang on 17/2/25.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import "UIView+MJ.h"
#import <objc/runtime.h>

static void * _width = @"width";

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
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)width
{
    return self.frame.size.width;
    
}


- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
    
}

- (CGFloat)x
{
    return self.frame.origin.x;
    
}
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
    
}

- (CGFloat)y
{
    return self.frame.origin.y;
   
}


@end
