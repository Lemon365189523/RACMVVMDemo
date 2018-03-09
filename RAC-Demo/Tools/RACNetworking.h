//
//  RACNetworking.h
//  RAC-Demo
//
//  Created by KADFWJ on 2018/3/9.
//  Copyright © 2018年 Lemon Fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>



@interface RACNetworking : NSObject

/**
 GET请求

 @param url 请求地址
 @param params 参数
 @return 请求成功或失败的信号
 */
+(RACSignal *) RAC_GET:(NSString *)url params:(NSDictionary *)params;


/**
 POST请求

 @param url 请求地址
 @param params 参数
 @return 请求成功或失败的信号
 */
+(RACSignal *) RAC_POST:(NSString *)url params:(NSDictionary *)params;
@end
