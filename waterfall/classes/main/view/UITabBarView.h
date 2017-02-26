//
//  UITabBarView.h
//  waterfall
//
//  Created by yangxianggang on 17/2/23.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UITabBarView;

@protocol HGTabViewDelegate <NSObject>

- (void)tabView:(UITabBarView *)tabBarView didSelectedFrom:(NSInteger)from toSelecte:(NSInteger)to;

@end


@interface UITabBarView : UIView
@property (nonatomic,weak)id<HGTabViewDelegate>delegate;
- (void)addTabBarItem:(UITabBarItem *)item;
@end
