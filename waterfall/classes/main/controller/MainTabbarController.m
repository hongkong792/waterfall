
//
//  MainTabbarController.m
//  waterfall
//
//  Created by yangxianggang on 17/2/22.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import "MainTabbarController.h"
#import "UITabBarView.h"
#import "ChoiceViewController.h"
#import "NavViewController.h"


@interface MainTabbarController ()<HGTabViewDelegate>

@property (nonatomic,weak) UITabBarView *tabBarView;
@end

@implementation MainTabbarController



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //去掉自带的
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:[UIControl class]]) {
            [view removeFromSuperview];
        }
    }
    
    
}


- (void)viewDidLoad {
  //设置tabbar
    [self setTabBar];
    //添加子view
    [self addChildviewControllers];
    
    
}
- (void)setTabBar
{
    UITabBarView * tabBarView = [[UITabBarView alloc] initWithFrame:self.tabBar.bounds];
    tabBarView.delegate = self;
    [self.tabBar addSubview:tabBarView];
    self.tabBarView = tabBarView;
}

- (void)addChildviewControllers
{
    ChoiceViewController *vc = [[ChoiceViewController alloc] init];
    [self addChildCon:vc title:@"首页" image:@"home" selectedImage:@"homeH"];
}

- (void)addChildCon:(UIViewController *)vc title:(NSString *)title image:(NSString *)iamge selectedImage:(NSString *)selectedImage
{
    vc.navigationItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:iamge];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    NavViewController * nav = [[NavViewController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    [self.tabBarView addTabBarItem:vc.tabBarItem];
}

#pragma HGTabViewDelegate
- (void)tabView:(UITabBarView *)tabBarView didSelectedFrom:(NSInteger)from toSelecte:(NSInteger)to
{
    self.selectedIndex = to;
}

@end
