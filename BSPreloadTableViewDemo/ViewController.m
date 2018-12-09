//
//  ViewController.m
//  BSPreloadTableVewDemo
//
//  Created by BaiShun on 2018/12/9.
//  Copyright © 2018 BaiShun. All rights reserved.
//

#import "ViewController.h"
#import "BSPreloadTableViewDemo.h"
#import "BSRequestManager.h"
#import "TableViewCellTest.h"
#import <MBProgressHUD.h>
#import <Toast.h>

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic)IBOutlet BSPreloadTableViewDemo *tableView;
@property (assign, nonatomic) NSUInteger pageNum;
@property (assign, nonatomic) NSUInteger pageSize;
@property (strong, nonatomic) NSMutableArray *arrMList;
@end

@implementation ViewController
- (NSMutableArray *)arrMList{
    if (!_arrMList) {
        _arrMList = [NSMutableArray array];
    }
    
    return _arrMList;
}

- (void)setUpUI{
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCellTest" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TableViewCellTest"];
    self.tableView.dataSource = self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.pageSize = 20;
    self.pageNum = 1;
    
    [self setUpUI];
    
    __weak typeof(self) weakeSelf = self;
    [self.tableView setLoadNewData:^{
        __strong typeof(weakeSelf) stongSelf = weakeSelf;
        stongSelf.pageNum = 1;
        [stongSelf fetchData];
    }];
//    [self.tableView setLoadMoreData:^{
//        __strong typeof(weakeSelf) stongSelf = weakeSelf;
//        [stongSelf fetchData];
//    }];
    
    [self.tableView preLoadDataThreshold4WithPageSize:self.pageSize initialPage:self.pageNum curPage:self.pageNum preLoadFetchBlk:^{
        __strong typeof(weakeSelf) stongSelf = weakeSelf;
        [stongSelf fetchData];
    }];
    
    [self showLoading];
    [self fetchData];
}
- (void)fetchData{
    NSDictionary *dict = @{
                           @"page":@(self.pageNum),
                           @"count":@(self.pageSize)
                           };
    __weak typeof(self) weakeSelf = self;
    [[BSRequestManager sharedInstance] postWithUrl:@"https://api.apiopen.top/getTangPoetry" args:dict finishBlk:^(NSDictionary * _Nonnull responseObject, NSError * _Nonnull error) {
        __strong typeof(weakeSelf) stongSelf = weakeSelf;
        [stongSelf.tableView endRefresh];
        [stongSelf hideLoading];
        
        if (error) {
            [stongSelf.view makeToast:error.localizedDescription];
            stongSelf.tableView.isPreLoadRefreshing = NO;
            return ;
        }
        
        //请求成功
        if (stongSelf.pageNum == 1){
            NSArray *arrTemp = responseObject[@"result"];
            stongSelf.arrMList = [NSMutableArray arrayWithArray:arrTemp];
            
            if (stongSelf.arrMList.count == 0) {
                //无数据缺省页
                
                return ;
            } else if (stongSelf.arrMList.count < stongSelf.pageSize) {
                [stongSelf.tableView hideFooter];
                stongSelf.tableView.isPreLoadLastPage = YES;
            } else {
                [stongSelf.tableView showFooter];
            }
            [stongSelf.tableView reloadData];
        } else {
            NSArray *arrTemp = responseObject[@"result"];
            [stongSelf.arrMList addObjectsFromArray:arrTemp];
            
            [stongSelf.tableView reloadData];
            
            if (arrTemp.count < stongSelf.pageSize) {
                stongSelf.tableView.isPreLoadLastPage = YES;
                [stongSelf.tableView hideFooter];
            } else {
                [stongSelf.tableView showFooter];
            }
        }
        stongSelf.pageNum ++;
        stongSelf.tableView.isPreLoadRefreshing = NO;
    }];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrMList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    
    TableViewCellTest *cellTest = [self.tableView dequeueReusableCellWithIdentifier:@"TableViewCellTest"];
    cellTest.data = self.arrMList[indexPath.row];
    
    cell = cellTest;
    return cell;
}

- (void)showLoading{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)hideLoading{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
@end
