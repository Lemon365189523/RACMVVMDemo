//
//  LMHomeVC.m
//  RAC-Demo
//
//  Created by KADFWJ on 2018/3/9.
//  Copyright © 2018年 Lemon Fan. All rights reserved.
//

#import "LMHomeVC.h"
#import "LMHomeVM.h"
#import "LMHomeCell.h"

@interface LMHomeVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) LMHomeVM *viewModel;

@property (nonatomic, strong) UISegmentedControl *segmentView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIActivityIndicatorView *loadingView;

@end

@implementation LMHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.segmentView.hidden = NO;
    [self bindViewModel];
}

-(void) bindViewModel{
    @weakify(self)
//    RAC(self.viewModel, dataSource) = [self.tableView rac_signalForSelector:@selector(reloadData)];
    [RACObserve(self.viewModel, dataSource) subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        [self.tableView reloadData];
    }];
    
    RAC(self.loadingView, hidden) = [[RACObserve(self.viewModel, loading) map:^id _Nullable(id  _Nullable value) {
        return @(![value boolValue]);
    }] doNext:^(id  _Nullable isHidden) {
        @strongify(self)
        
        [isHidden boolValue]? [self.loadingView stopAnimating]:[self.loadingView startAnimating];
    }];
    
    
    [[self.segmentView rac_signalForControlEvents:UIControlEventValueChanged] subscribeNext:^(__kindof UISegmentedControl * _Nullable x) {
        @strongify(self)
        [self.viewModel.segmentCommand execute:@(x.selectedSegmentIndex)];
    }];
    
    
    [[self.viewModel loadData] subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        self.segmentView.selectedSegmentIndex = 0;
        [self.viewModel.segmentCommand execute:@(0)];
    } error:^(NSError * _Nullable error) {

    }];

}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.viewModel.dataSource) {
        return self.viewModel.dataSource.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LMHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LMHomeCell"];
    if (!cell) {
        cell = [[LMHomeCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"LMHomeCell"];
    }
    [cell bindViewModel:self.viewModel.dataSource[indexPath.row]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LMHomeCellVM *viewModel = self.viewModel.dataSource[indexPath.row];
    return viewModel.cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


-(LMHomeVM *)viewModel{
    if (!_viewModel) {
        _viewModel = [[LMHomeVM alloc] init];
    }
    return _viewModel;
}

-(UISegmentedControl *)segmentView{
    if (!_segmentView) {
        _segmentView = [[UISegmentedControl alloc] initWithItems:@[@"视频", @"文章"]];
        _segmentView.frame = CGRectMake(0, 20, self.view.frame.size.width, 44);
        
        [self.view addSubview:_segmentView];
    }
    return _segmentView;
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 64);
        [self.view addSubview:_tableView];
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(UIActivityIndicatorView *)loadingView{
    if (!_loadingView) {
        _loadingView = [[UIActivityIndicatorView alloc] init];
        _loadingView.frame = CGRectMake(CGRectGetMaxX(self.view.frame)/2 -20, CGRectGetMaxY(self.view.frame)/2-20, 40, 40);
        _loadingView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_loadingView startAnimating];
        [self.view insertSubview:_loadingView atIndex:99];
    }
    return _loadingView;
}

@end
