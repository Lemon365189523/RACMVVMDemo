//
//  RACNetworking.m
//  RAC-Demo
//
//  Created by KADFWJ on 2018/3/9.
//  Copyright © 2018年 Lemon Fan. All rights reserved.
//

#import "RACNetworking.h"
#import <AFNetworking/AFNetworking.h>

@implementation RACNetworking


+(RACSignal *)RAC_GET:(NSString *)url params:(NSDictionary *)params{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
       

        [[self sessionMananger] GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            //可做些统一处理逻辑 例如判断code
            [subscriber sendNext:[self p_jsonData:responseObject]];
            [subscriber sendCompleted];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendError:error];
        
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

+(RACSignal *)RAC_POST:(NSString *)url params:(NSDictionary *)params{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        

        [[self sessionMananger] POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [subscriber sendNext:[self p_jsonData:responseObject]];
            [subscriber sendCompleted];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendError:error];
            
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

+(AFHTTPSessionManager *) sessionMananger{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    manager.requestSerializer.timeoutInterval=20;
    
    return manager;
}

//转json
+(id ) p_jsonData:(id)data{
    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    NSData *resData = [[NSData alloc] initWithData:[responseString dataUsingEncoding:NSUTF8StringEncoding]];
    id resultData =[NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
    return resultData;
}


@end
