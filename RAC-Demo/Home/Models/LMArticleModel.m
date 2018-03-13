//
//  LMArticleModel.m
//  RAC-Demo
//
//  Created by KADFWJ on 2018/3/9.
//  Copyright © 2018年 Lemon Fan. All rights reserved.
//

#import "LMArticleModel.h"
#import <YYModel/YYModel.h>

@interface LMArticleModel ()<YYModel>

@end

@implementation LMArticleModel


+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{
             @"articleId":@"ArticleId",
             @"link":@"Link",
             @"tags":@"Tags",
             @"title":@"Title",
             @"type":@"Type",
             @"pic": @"Pic"
             };
}

@end
