//
//  LMHomeVM.h
//  RAC-Demo
//
//  Created by KADFWJ on 2018/3/9.
//  Copyright © 2018年 Lemon Fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "LMHomeCellVM.h"

@interface LMHomeVM : NSObject

@property (nonatomic, strong, readonly) NSArray <LMHomeCellVM *>*dataSource;

@property (nonatomic, strong) RACCommand *segmentCommand;

@property (nonatomic, assign, readonly, getter=isLoading) BOOL loading;

-(RACSignal *) loadData;


@end
