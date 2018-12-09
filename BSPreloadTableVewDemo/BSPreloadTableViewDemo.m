//
//  BSPreloadTableViewDemo.m
//  BSPreloadTableVewDemo
//
//  Created by BaiShun on 2018/12/9.
//  Copyright © 2018 BaiShun. All rights reserved.
//

#import "BSPreloadTableViewDemo.h"
#import "Toast.h"

@implementation BSPreloadTableViewDemo
- (void)awakeFromNib{
    [super awakeFromNib];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (instancetype)initWithFrame:(CGRect)frame{
   self = [super initWithFrame:frame];
   if (self) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}
#pragma mark - 重写父类实现自定义
//预加载功能样式
- (void)preLoadDataWithThreshold:(CGFloat)threshold pageSize:(CGFloat)pageSize initialPage:(int)initialPage curPage:(NSUInteger)curPage preLoadFetchBlk:(void(^)(void))preLoadFetchBlk noNetWorkBlk:(void(^)(void))noNetWorkBlk{
    
    [super preLoadDataWithThreshold:threshold pageSize:pageSize initialPage:initialPage curPage:curPage preLoadFetchBlk:preLoadFetchBlk noNetWorkBlk:noNetWorkBlk];
    [self.preLoadFooter setTitle:@"" forState:MJRefreshStateIdle];
    [self.preLoadFooter setTitle:@"松开马上加载更多数据了" forState:MJRefreshStatePulling];
    [self.preLoadFooter setTitle:@"正在帮你加载中,不客气" forState:MJRefreshStateRefreshing];
}

- (void)preLoadDataThreshold4WithPageSize:(CGFloat)pageSize initialPage:(NSUInteger)initialPage curPage:(NSUInteger)curPage preLoadFetchBlk:(void (^)(void))preLoadFetchBlk{
    [super preLoadDataThreshold4WithPageSize:pageSize initialPage:initialPage curPage:curPage preLoadFetchBlk:preLoadFetchBlk noNetWorkBlk:^{
        [self makeToast:@"似乎已断开与互联网的连接!"];
    }];
}

@end
