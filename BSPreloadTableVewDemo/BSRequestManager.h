//
//  BSRequestManager.h
//  BSPreloadTableVewDemo
//
//  Created by BaiShun on 2018/12/9.
//  Copyright © 2018 BaiShun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BSRequestManager : NSObject
+ (instancetype)sharedInstance;
- (void)postWithUrl:(NSString *)url args:(NSDictionary *)args finishBlk:(void(^)(NSDictionary *responseObject, NSError *error))finishBlk;
@end

NS_ASSUME_NONNULL_END
