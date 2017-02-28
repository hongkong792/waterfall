//
//  HeaderScroll.m
//  waterfall
//
//  Created by 杨香港 on 2017/2/27.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import "HeaderScroll.h"
#import "HGScrollModel.h"
#import "HeaderCollViewCell.h"
#import "UIView+MJ.h"
#define HGScrollName @"collectionViewCell"
#define  MaxCount 100

@interface HeaderScroll() <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,weak)UICollectionView *colletionView;
@property (nonatomic,strong)NSMutableArray *arr;
@property (nonatomic,weak)UIPageControl *pageControl;
@property (nonatomic,strong)NSTimer *timer;
@end


@implementation HeaderScroll

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加collectionview
        [self addCollectionView];
        
        //添加页控价
        [self setupPage];
        
        //添加定时器
        [self addTimer];
        
        
        
    }
    return self;
}


- (NSMutableArray *)arr
{
    if (!_arr) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}

#pragma 添加定时器
- (void)addTimer
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(nextPAge) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

- (void)nextPAge
{
    
    
}

#pragma 添加分页控制器
- (void)setupPage
{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = self.arr.count;
    pageControl.currentPageIndicatorTintColor = PageControlColor(255, 255, 255);
    pageControl.pageIndicatorTintColor= PageControlColor(252,73,80);
    CGFloat pageW = 100;
    CGFloat pageH = 30;
    CGFloat pageX = (self.width - pageW)*0.5;
    CGFloat pageY = self.height - pageH +5;
    pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
    [self addSubview:pageControl];
    self.pageControl = pageControl;
}


#pragma 添加collectionView
- (void)addCollectionView
{
    NSArray *plist = [HGScrollModel objectArrayWithFile:@"newses.plist"];
    [self.arr addObjectsFromArray:plist];
    
    
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.minimumLineSpacing = 0;
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flow];
    [collectionView registerClass:[HeaderCollViewCell class] forCellWithReuseIdentifier:HGScrollName];
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.pagingEnabled = YES;
    [self addSubview:collectionView];
    self.colletionView = collectionView;
    
}


#pragma UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return MaxCount;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeaderCollViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:HGScrollName forIndexPath:indexPath];
    HGScrollModel *model = self.arr[indexPath.row];
    cell.scrollModel = model;
    return cell;
}



@end
