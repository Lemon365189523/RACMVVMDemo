//
//  LMHomeCell.m
//  RAC-Demo
//
//  Created by KADFWJ on 2018/3/12.
//  Copyright © 2018年 Lemon Fan. All rights reserved.
//

#import "LMHomeCell.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface LMHomeCell()

@property (nonatomic, strong) UILabel *titleLB;

@property (nonatomic, strong) UIImageView *picImageView;

@property (nonatomic, strong) UILabel *tagsLB;

@end

@implementation LMHomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)bindViewModel:(LMHomeCellVM *)viewModel{
    
    self.titleLB.text = viewModel.name;
    
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:viewModel.urlString]];
    
    self.tagsLB.text = viewModel.tags;
}


-(UILabel *)titleLB{
    if (!_titleLB) {
        _titleLB = [[UILabel alloc] init];
        
        [self addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(20);
            make.right.mas_equalTo(self.picImageView.mas_left).mas_offset(-10);
        }];
    }
    return _titleLB;
}

-(UIImageView *)picImageView{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        
        [self addSubview:_picImageView];
        [_picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.height.width.mas_equalTo(60);
            make.right.mas_equalTo(-20);
        }];
    }
    return _picImageView;
}

-(UILabel *)tagsLB{
    if (!_tagsLB) {
        _tagsLB = [[UILabel alloc] init];
        [self addSubview:_tagsLB];
        _tagsLB.font = [UIFont systemFontOfSize:12];
        [_tagsLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLB.mas_bottom).mas_offset(10);
            make.left.mas_equalTo(self.titleLB.mas_left);
            make.right.mas_equalTo(self.picImageView.mas_left).mas_offset(-10);
        }];
    }
    return _tagsLB;
}

@end
