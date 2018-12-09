//
//  TableViewCellTest.h
//  BSPreloadTableVewDemo
//
//  Created by BaiShun on 2018/12/9.
//  Copyright © 2018 BaiShun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCellTest : UITableViewCell
@property (weak, nonatomic)IBOutlet UILabel *lab;
@property (strong, nonatomic) NSDictionary *data;
@end

NS_ASSUME_NONNULL_END
