//
//  ReachabilityManager.m
//  AFNetworking
//
//  Created by yuYue on 2018/9/28.
//

#import "ReachabilityManager.h"

@implementation ReachabilityManager
+ (void)internetStatus:(void(^)(NetworkStatus internetStatus))statusBlk {
    Reachability *reachability   = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    if (statusBlk) {
        statusBlk(internetStatus);
    }
}
@end
