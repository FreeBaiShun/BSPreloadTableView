//
//  BSPreloadTableView.h
//  BSPreloadTableVewDemo
//
//  Created by BaiShun on 2018/12/9.
//  Copyright © 2018 BaiShun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh/MJRefresh.h"

NS_ASSUME_NONNULL_BEGIN

@interface BSPreloadTableView : UITableView
//上拉下拉
/** 上拉加载更多 */
@property (copy, nonatomic) void(^loadMoreData)(void);
/** 下拉刷新blk  */
@property (copy, nonatomic) void(^loadNewData)(void);

/**
 下拉刷新回调

 @param loadNewData 回调block
 */
- (void)setLoadNewData:(void (^)(void))loadNewData;

//refresh
- (void)beginRefresh;
- (void)endRefresh;
- (void)endRefreshNoMoreData;

- (void)hideFooter;
- (void)showFooter;

//预加载功能
/** 是否有预加载功能 */
@property (assign, nonatomic) BOOL isHavePreLoad;
/** 加载时机 */
@property (assign, nonatomic) CGFloat threshold;
/** 每页加载尺寸 */
@property (assign, nonatomic) CGFloat pageSize;
/** 初始化页面尺寸 */
@property (assign, nonatomic) CGFloat initialPage;
/** 当前页 */
@property (assign, nonatomic) NSUInteger curPage;
/** 预加载blk */
@property (strong, nonatomic) void(^preLoadFetchBlk)(void);

/** 是最后一页 */
@property (assign, nonatomic) BOOL isPreLoadLastPage;
/** 正在请求数据 */
@property (assign, nonatomic) BOOL isPreLoadRefreshing;
/** 预加载footer */
@property (strong, nonatomic) MJRefreshAutoNormalFooter *preLoadFooter;

/**
 剩余4条数据进行加载下一页

 @param pageSize 一页尺寸
 @param initialPage 服务器接收的第一页的值
 @param curPage 当前页
 @param preLoadFetchBlk e
 @param noNetWorkBlk 没有网络回调
 */
- (void)preLoadDataThreshold4WithPageSize:(CGFloat)pageSize initialPage:(int)initialPage curPage:(NSUInteger)curPage preLoadFetchBlk:(void(^)(void))preLoadFetchBlk noNetWorkBlk:(void(^)(void))noNetWorkBlk;


/**
 剩余xxx条数据进行加载下一页

 @param threshold 剩余几条数据进行预加载（如pageSize = 10，剩余四条数据进行预加载需传入4/10）
 @param pageSize 一页尺寸
 @param initialPage 服务器接收的第一页的值
 @param curPage 当前页
 @param preLoadFetchBlk 预加载回调
 @param noNetWorkBlk 没有网络回调
 */
- (void)preLoadDataWithThreshold:(CGFloat)threshold pageSize:(CGFloat)pageSize initialPage:(int)initialPage curPage:(NSUInteger)curPage preLoadFetchBlk:(void(^)(void))preLoadFetchBlk noNetWorkBlk:(void(^)(void))noNetWorkBlk;
@end

NS_ASSUME_NONNULL_END
