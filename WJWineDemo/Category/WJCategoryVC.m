//
//  WJCategoryVC.m
//  WJWineDemo
//
//  Created by Adward on 2018/5/9.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import "WJCategoryVC.h"
#import "WJCategoryRightTableView.h"
#import "WJCategoryViewModel.h"
#import "WTKCategoryLeftTableViewCell.h"

@interface WJCategoryVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)WJCategoryViewModel         *viewModel;

@property(nonatomic,strong)WJCategoryRightTableView    *rightTableView;

@property(nonatomic,strong)UITableView                  *leftTableView;

@property(nonatomic,strong)NSMutableArray               *leftDataArray;

@property(nonatomic,strong)NSMutableDictionary          *dataDic;

@property(nonatomic,strong)UIButton                     *rightBtn;
@end

@implementation WJCategoryVC

@dynamic viewModel;

#pragma mark - lifeCycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.rightTableView reloadData];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:THEME_COLOR size:CGSizeMake(kWidth, 64)] forBarMetrics:UIBarMetricsDefault];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageFromColor:WJCOLOR(255, 255, 255, 0.99)] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
    [self initView];
    [self resetNavi];
    
}

- (void)bindViewModel
{
    [super bindViewModel];
    @weakify(self);
    [self.viewModel.refreshCommand execute:@[self.leftTableView,self.rightTableView]];
    //    RAC(self,dataDic)                   = RACObserve(self.viewModel, dataDic);
    //    绑定数据
    RAC(self,leftDataArray)             = RACObserve(self.viewModel, leftArray);
    RAC(_rightTableView,sectionArray)   = RACObserve(self.viewModel, leftArray);
    RAC(_rightTableView,dataDic)        = RACObserve(self.viewModel, dataDic);
//    RAC(self.siftView,dataArray)        = RACObserve(self.viewModel, selectArray);
    
    
    self.rightTableView.mj_header       = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        [self.viewModel.refreshCommand execute:@[self.leftTableView,self.rightTableView]];
    }];
    //    右侧tableView滑动
    [self.viewModel.rightCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        NSIndexPath *indexPath = x;
        [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    }];
}

- (void)initView
{
    [self.view addSubview:self.rightTableView];
    [self.view addSubview:self.leftTableView];
    self.leftTableView.dataSource       = self;
    self.leftTableView.delegate         = self;
    self.leftTableView.separatorStyle   = UITableViewCellSeparatorStyleNone;
    self.leftTableView.rowHeight        = 45;
    [self.leftTableView registerNib:[UINib nibWithNibName:@"WTKCategoryLeftTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
}

- (void)resetNavi
{
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:THEME_COLOR size:CGSizeMake(kWidth, 64)] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightBtn];
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.viewModel.leftClickCommand execute:@[self.rightTableView,indexPath]];
}

#pragma mark - tableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static BOOL isFirst = YES;
    WTKCategoryLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.w_label.text = self.leftDataArray[indexPath.row];
    if(isFirst)
    {
        [tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
    }
    isFirst = NO;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.leftDataArray.count;
}


#pragma mark - lazyLoad
- (WJCategoryRightTableView *)rightTableView
{
    if (!_rightTableView)
    {
        _rightTableView = [[WJCategoryRightTableView alloc]initWithFrame:CGRectMake(75, 0, kWidth - 75, kHeight - 49) style:UITableViewStylePlain];
        _rightTableView.viewModel = self.viewModel;
    }
    return _rightTableView;
}
- (UITableView *)leftTableView
{
    if (!_leftTableView)
    {
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 75, kHeight - 64 - 49) style:UITableViewStylePlain];
        _leftTableView.backgroundColor  = [UIColor clearColor];
    }
    return _leftTableView;
}
- (NSMutableArray *)leftDataArray
{
    if (!_leftDataArray)
    {
        _leftDataArray = [NSMutableArray array];
    }
    return _leftDataArray;
}

- (NSMutableDictionary *)dataDic
{
    if (!_dataDic)
    {
        _dataDic = [NSMutableDictionary dictionary];
    }
    return _dataDic;
}
- (UIButton *)rightBtn
{
    if (!_rightBtn)
    {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"w_shaixuan"] forState:UIControlStateNormal];
        _rightBtn.frame = CGRectMake(0, 0, 15, 15);
    }
    return _rightBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
