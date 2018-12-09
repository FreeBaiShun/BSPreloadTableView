//
//  ReachabilityManager.h
//  AFNetworking
//
//  Created by yuYue on 2018/9/28.
//

#import <Foundation/Foundation.h>
#import "BSPTVReachability.h"

@interface BSPTVReachabilityManager : NSObject

/**
 获取当前手机网络状态

 @param statusBlk 网络状态blk
 */
+ (void)internetStatus:(void(^)(NetworkStatus internetStatus))statusBlk;
@end
