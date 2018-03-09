//
//  LMHomeVC.m
//  RAC-Demo
//
//  Created by KADFWJ on 2018/3/9.
//  Copyright © 2018年 Lemon Fan. All rights reserved.
//

#import "LMHomeVC.h"
#import "RACNetworking.h"
#import "LMArticleModel.h"

@interface LMHomeVC ()

@end

@implementation LMHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *url = @"http://wapask.360kad.com/RecommendArticle/getdata?pageindex=1&pagesize=8&vpageIndex=1&vpageSize=8";
    [[RACNetworking RAC_POST:url params:nil] subscribeNext:^(id  _Nullable x) {
        
        NSLog(@"%@",x);
    } error:^(NSError * _Nullable error) {
        NSLog(@"error:%@",error);
    }];
}




@end
