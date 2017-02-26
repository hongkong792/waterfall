
//
//  UITabBarView.m
//  waterfall
//
//  Created by yangxianggang on 17/2/23.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import "UITabBarView.h"
#import "TabBarButtton.h"
#import "UIView+MJ.h"


@interface UITabBarView()
{
    UIButton *nowButton;
    
}
@end

@implementation UITabBarView

- (void)addTabBarItem:(UITabBarItem *)item
{
    TabBarButtton *button = [[TabBarButtton alloc] init];
    button.item = item;
    [button addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    if (self.subviews.count == 1) {
        [self tabBarButtonClick:button];
    }
    
}
- (void)tabBarButtonClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if ([self.delegate respondsToSelector:@selector(tabView:didSelectedFrom:toSelecte:)]) {
            [self.delegate tabView:self didSelectedFrom:nowButton.tag toSelecte:btn.tag];
    }
    nowButton.selected = NO;
    btn.selected = YES;
    nowButton = btn;
}


-(void)layoutSubviews
{
    //子控件重新布局
    [super layoutSubviews];
    NSInteger count = self.subviews.count;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnH = self.height;
    CGFloat btnW = TabBarWidth/count;
    
    for (int i = 0;i < count;i++) {
        UIButton *button = self.subviews[i];
            btnX= btnW * i;
            button.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
    }

}

@end
