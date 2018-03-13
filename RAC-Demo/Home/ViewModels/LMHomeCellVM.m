//
//  LMHomeCellVM.m
//  RAC-Demo
//
//  Created by KADFWJ on 2018/3/12.
//  Copyright © 2018年 Lemon Fan. All rights reserved.
//

#import "LMHomeCellVM.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface LMHomeCellVM()

@property (nonatomic, assign, readwrite) float cellHeight;

@property (nonatomic, strong, readwrite) NSString *name;

@property (nonatomic, strong, readwrite) NSString *tags;

@property (nonatomic, strong, readwrite) NSString *urlString;

@end

@implementation LMHomeCellVM

-(instancetype)initWithModel:(LMArticleModel *)model{
    if (self = [super init]) {
        self.cellHeight = 100;
        self.name = model.title;
        self.tags = model.tags;
        self.urlString = model.pic;
    }
    return self;
}

@end
