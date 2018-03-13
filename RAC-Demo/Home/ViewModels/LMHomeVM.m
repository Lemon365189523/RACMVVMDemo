//
//  LMHomeVM.m
//  RAC-Demo
//
//  Created by KADFWJ on 2018/3/9.
//  Copyright © 2018年 Lemon Fan. All rights reserved.
//

#import "LMHomeVM.h"
#import "LMArticleModel.h"
#import <YYModel/YYModel.h>
#import "RACNetworking.h"

@interface LMHomeVM()

@property (nonatomic, strong, readwrite)  NSArray <LMHomeCellVM *>*dataSource;

@property (nonatomic, assign, readwrite, getter=isLoading) BOOL loading;

@property (nonatomic, strong) NSArray *cellVMArr;

@end


@implementation LMHomeVM

-(instancetype)init{
    if (self = [super init]) {
        [self initialize];
        
    }
    return self;
}

- (void)initialize {
    @weakify(self)
    self.segmentCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSNumber *index) {
        @strongify(self)
        @weakify(self)
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            @strongify(self)
            self.dataSource = self.cellVMArr[[index integerValue]];
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{}];
        }];
    }];
    
}

-(RACSignal *)loadData{
    NSString *url = @"http://wapask.360kad.com/RecommendArticle/getdata?pageindex=1&pagesize=8&vpageIndex=1&vpageSize=8";
    self.loading = YES;
    @weakify(self)
    return [[RACNetworking RAC_POST:url params:nil] map:^id _Nullable(id  _Nullable value) {
         sleep(2);
         @strongify(self)
        NSArray *wzModelList = [NSArray yy_modelArrayWithClass:[LMArticleModel class] json:[value objectForKey:@"wzList"]];
        NSArray *spModelList = [NSArray yy_modelArrayWithClass:[LMArticleModel class] json:[value objectForKey:@"spList"]];
       
        NSMutableArray *wz = [NSMutableArray arrayWithCapacity:wzModelList.count];
        for (LMArticleModel *model in wzModelList) {
            LMHomeCellVM *cellVM = [[LMHomeCellVM alloc] initWithModel:model];
            [wz addObject:cellVM];
        }
        
        NSMutableArray *sp = [NSMutableArray arrayWithCapacity:spModelList.count];
        for (LMArticleModel *model in spModelList) {
            LMHomeCellVM *cellVM = [[LMHomeCellVM alloc] initWithModel:model];
            [sp addObject:cellVM];
        }
        self.cellVMArr = @[[sp copy],[wz copy]];
        self.loading = NO;
        
        return @(YES);
    }];
    
}



@end
