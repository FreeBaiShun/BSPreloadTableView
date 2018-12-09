//
//  BSPreloadTableViewDemo.h
//  BSPreloadTableVewDemo
//
//  Created by BaiShun on 2018/12/9.
//  Copyright © 2018 BaiShun. All rights reserved.
//

#import "BSPreloadTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BSPreloadTableViewDemo : BSPreloadTableView
- (void)preLoadDataThreshold4WithPageSize:(CGFloat)pageSize initialPage:(NSUInteger)initialPage curPage:(NSUInteger)curPage preLoadFetchBlk:(void (^)(void))preLoadFetchBlk;
@end

NS_ASSUME_NONNULL_END
