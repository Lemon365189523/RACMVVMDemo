//
//  LMArticleModel.h
//  RAC-Demo
//
//  Created by KADFWJ on 2018/3/9.
//  Copyright © 2018年 Lemon Fan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LMArticleModel : NSObject

@property (nonatomic, strong) NSString *articleId;

@property (nonatomic, strong) NSString *link;

@property (nonatomic, strong) NSString *tags;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) NSString *pic;

@end
