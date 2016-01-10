//
//  UITableViewController+MJRefresh.m
//  CrazyApp
//
//  Created by ruizhao xie on 16/1/5.
//  Copyright © 2016年 ruizhao xie. All rights reserved.
//

#import "UITableViewController+MJRefresh.h"
#import <MJRefresh.h>

#define MIN_NUM 1

@implementation UITableViewController (MJRefresh)

-(void)startMJRefreshWithPage:(NSUInteger)page
{
    
    __weak UITableViewController * weakSelf = self;
    __block NSUInteger _page = page;
    //上拉刷新删除其他数据
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadDataWithPage:MIN_NUM];
    }];
    dispatch_async(dispatch_get_main_queue(), ^{
        //回到主线程执行
        [weakSelf.tableView.mj_header beginRefreshing];
    });
    //下拉刷新数据要叠加
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        _page++;
        
        [weakSelf loadDataWithPage:_page];
    }];
}

-(void)endMJRefreshingWithPage:(NSUInteger)page andData:(NSMutableArray *)data andAddData:(NSArray *)addData
{
    __weak UITableViewController * weakSelf = self;
    __block NSUInteger _page = page;
    __block NSMutableArray *_data = data;
    //上拉删除所有数据,再添加
    if (_page == MIN_NUM && _data.count > 0) {
        [_data removeAllObjects];
    }
    [_data addObjectsFromArray:addData];
    dispatch_async(dispatch_get_main_queue(), ^{
        //回到主线程执行
        [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf.tableView.mj_footer endRefreshing];
        [weakSelf.tableView reloadData];
    });
}

-(void)loadDataWithPage:(NSUInteger)page
{
    
}


@end
