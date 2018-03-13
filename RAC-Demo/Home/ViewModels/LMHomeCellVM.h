//
//  LMHomeCellVM.h
//  RAC-Demo
//
//  Created by KADFWJ on 2018/3/12.
//  Copyright © 2018年 Lemon Fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LMArticleModel.h"

@interface LMHomeCellVM : NSObject

@property (nonatomic, assign, readonly) float cellHeight;

@property (nonatomic, strong, readonly) NSString *name;

@property (nonatomic, strong, readonly) NSString *tags;

@property (nonatomic, strong, readonly) NSString *urlString;



-(instancetype) initWithModel:(LMArticleModel *) model;

@end
