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
#import "HttpTool.h"
#import "HGCategoryModel.h"
#import "HGCategoryList.h"
#import "HGGoodsModel.h"
#import "HGGoodsFrame.h"

@interface ChoiceViewController ()<UITableViewDelegate, UITableViewDataSource,MJRefreshBaseViewDelegate>
@property (nonatomic,weak)UITableView *tableView;
@property (nonatomic,strong)NSArray * dataArray;
@property (nonatomic,weak)HeaderScroll * headerScroll;
@property (nonatomic,weak)MJRefreshHeaderView *headerView;
@property (nonatomic,weak)MJRefreshFooterView *footerView;
@property (nonatomic,weak) HGCategoryList *cateList;
//存放frame模型的数组
@property (nonatomic,strong) NSMutableArray *arrFrames;


@end

@implementation ChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加tableview
    [self setupTableView];
    //设置headerview
    [self setHeaderView];
    
    //自动刷
    [self setupRefresh];
    
}

- (NSMutableArray *)arrFrames
{
    if (!_arrFrames) {
        _arrFrames = [[NSMutableArray alloc] init];
    }
    return _arrFrames;
    
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
    MJRefreshHeaderView * header = [MJRefreshHeaderView header];
    header.scrollView = self.tableView;
    header.delegate = self;
    [header beginRefreshing];
    self.headerView = header;
                                    
    MJRefreshFooterView *footer =  [MJRefreshFooterView footer];
    footer.delegate = self;
    footer.scrollView = self.tableView;
    
}
// 开始进入刷新状态就会调用
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if ([refreshView isKindOfClass:[MJRefreshHeaderView class]]) {
        [self sendRequest];
        
    }else{
        
        
    }
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma 加载新数据
- (void)sendRequest
{
    [HttpTool dataWithUrl:HGURL prams:nil success:^(id json) {
        
        NSMutableArray *arrarFrames = [NSMutableArray array];
        //1.获得数据的分类
        NSArray *categary = json[@"data"][@"category_list"];
        NSArray *cateModels = [HGCategoryModel objectArrayWithKeyValuesArray:categary];
        self.cateList.data = cateModels;
        //获得商品的展示的数据 good_list
        NSArray *tempGoods = json[@"data"][@"goods_list"];
        NSArray *goodsArray = [HGGoodsModel objectArrayWithKeyValuesArray:tempGoods];
        
        //遍历商品类型
        for(HGGoodsModel *goodsModel in goodsArray) {
            HGGoodsFrame *goodsFrame=[[HGGoodsFrame alloc]init];
            
            goodsFrame.goodsModel=goodsModel;  //传递模型
            
            //把frame模型添加到数组
            [arrarFrames addObject:goodsFrame];
            
        }
        
        //把新获得的数组放在前面
        NSMutableArray *tempArray=[NSMutableArray array];
        [tempArray addObjectsFromArray:arrarFrames]; //添加新的数组
        [tempArray addObjectsFromArray:self.arrFrames];
        self.arrFrames=tempArray; //在真个传递给主数组
        
        //刷新表示图
        [self.tableView reloadData];
        //停止刷新
        [self.headerView endRefreshing];
        
    } failure:^(id object) {
        
    }];
    
    
    
    
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
