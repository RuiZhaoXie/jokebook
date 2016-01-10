//
//  UITableViewController+MJRefresh.h
//  CrazyApp
//
//  Created by ruizhao xie on 16/1/5.
//  Copyright © 2016年 ruizhao xie. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UITableViewController (MJRefresh)

/**
 *开始刷新请求数据()
 */
-(void)startMJRefreshWithPage:(NSUInteger)page;

/**
 *下拉加载更多数据()
 */
-(void)loadDataWithPage:(NSUInteger)page;

/**
 *结束刷新(前面的data是你要用来保存数据的数组,后面的addData是返回的数据)
 */
-(void)endMJRefreshingWithPage:(NSUInteger)page andData:(NSMutableArray *)data andAddData:(NSArray *)addData;

@end
