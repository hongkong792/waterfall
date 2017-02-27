//
//  ChoiceViewController.m
//  waterfall
//
//  Created by yangxianggang on 17/2/25.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import "ChoiceViewController.h"
#import "MainTableViewCell.h"
#import "HeaderScroll.h"
#import "UIView+MJ.h"

@interface ChoiceViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,weak)UITableView *tableView;
@property (nonatomic,strong)NSArray * dataArray;
@property (nonatomic,weak)HeaderScroll * headerScroll;

@end

@implementation ChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加tableview
    [self setupTableView];
    //设置headerview
    [self setHeaderView];
    
    //自动刷新
    
    
}


#pragma mark 添加tableview
- (void)setupTableView
{
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableview.dataSource = self;
    tableview.delegate = self;
    [self.view addSubview:tableview];
    self.tableView = tableview;
    
}
#pragma mark 设置headerView
- (void)setHeaderView
{
    
    CGFloat scrollH = 250;
    HeaderScroll * headerScroll = [[HeaderScroll alloc] initWithFrame:CGRectMake(0, 0, self.view.width, scrollH)];
    UIView *view =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, scrollH)];
    [view addSubview:headerScroll];
    self.tableView.tableHeaderView = view;
    self.headerScroll = headerScroll;
    
    
}


#pragma 自动刷新
- (void)setupRefresh
{
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma UITableViewDelegate UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
    
}


@end
