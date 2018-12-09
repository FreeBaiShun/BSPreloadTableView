//
//  BSRequestManager.m
//  BSPreloadTableVewDemo
//
//  Created by BaiShun on 2018/12/9.
//  Copyright © 2018 BaiShun. All rights reserved.
//

#import "BSRequestManager.h"
#import <AFHTTPSessionManager.h>

@interface BSRequestManager ()
@property (nonatomic, strong) AFHTTPSessionManager *sessionManger;
@end

@implementation BSRequestManager
+ (instancetype)sharedInstance{
    static BSRequestManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[BSRequestManager alloc] init];
        [manager initSession];
    });
    return manager;
}
- (void)initSession{
    _sessionManger = [AFHTTPSessionManager manager];
    _sessionManger.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    _sessionManger.securityPolicy.allowInvalidCertificates = YES;
    [_sessionManger.securityPolicy setValidatesDomainName:NO];
    
    _sessionManger.requestSerializer = [AFJSONRequestSerializer serializer];
    AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
    response.removesKeysWithNullValues = YES;
    _sessionManger.responseSerializer =  response;
    _sessionManger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
}

- (void)postWithUrl:(NSString *)url args:(NSDictionary *)args finishBlk:(void(^)(NSDictionary *responseObject, NSError *error))finishBlk{
    [self.sessionManger POST:url parameters:args progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (finishBlk) {
            finishBlk(responseObject,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (finishBlk) {
            finishBlk(nil,error);
        }
    }];
}
@end
