//
//  ReachabilityManager.m
//  AFNetworking
//
//  Created by yuYue on 2018/9/28.
//

#import "BSPTVReachabilityManager.h"

@implementation BSPTVReachabilityManager
+ (void)internetStatus:(void(^)(NetworkStatus internetStatus))statusBlk {
    BSPTVReachability *reachability   = [BSPTVReachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    if (statusBlk) {
        statusBlk(internetStatus);
    }
}
@end
