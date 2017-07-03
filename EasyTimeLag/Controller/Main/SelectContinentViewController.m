//
//  SelectContinentViewController.m
//  EasyTimeLag
//
//  Created by 朱源浩 on 2017/6/19.
//  Copyright © 2017年 稀饭. All rights reserved.
//

#import "SelectContinentViewController.h"
#import "SelectAreaViewController.h"

@interface SelectContinentViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *continentList;

@end

@implementation SelectContinentViewController

#pragma mark - Override System Method

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据初始化

- (void)configureData {
    _continentList = @[@{@"title":@"欧洲",@"icon_name":@"icon_europe",@"value":@"europe"},
                       @{@"title":@"亚洲",@"icon_name":@"icon_asia",@"value":@"asia"},
                       @{@"title":@"非洲",@"icon_name":@"icon_africa",@"value":@"africa"},
                       @{@"title":@"美洲",@"icon_name":@"icon_america",@"value":@"america"},
                       @{@"title":@"大洋洲",@"icon_name":@"icon_oceania",@"value":@"oceania"}];
}

#pragma mark - 视图加载

- (void)initUI {
    
    self.title = @"选择城市";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //  数据列表
    _tableView =[UITableView new];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    
    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH(self.view), 10)];
    blackView.backgroundColor = [UIColor whiteColor];
    _tableView.tableHeaderView = blackView;
    _tableView.tableFooterView = blackView;
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(@0);
    }];

    
}

#pragma mark - 数据处理



#pragma mark - 网络请求



#pragma mark - 用户动作



#pragma mark - 视图操作/动画



#pragma mark - 代理方法

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return _continentList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120*SCALE_OF_IPHONE6_SCREEN;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
    NSDictionary *cellDict = _continentList[indexPath.row];
    
    UIImageView *bgImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:cellDict[@"icon_name"]]];
    ViewRadius(bgImgView, 5);
    [cell.contentView addSubview:bgImgView];
    [bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0).offset(10);
        make.bottom.equalTo(@0).offset(-10);
        make.left.equalTo(@0).offset(20);
        make.right.equalTo(@0).offset(-20);
    }];
    
    UIView *titleView = [UIView new];
    titleView.backgroundColor = APP_COLOR_PRIMARY_DARK;
    [bgImgView addSubview:titleView];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(@0);
        make.width.mas_offset(40);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = SYSTEMFONT(16);
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = cellDict[@"title"];
    [titleView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(@0);
    }];
    
    return cell;
}



#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SelectAreaViewController *selectAreaVC = [[SelectAreaViewController alloc] init];
    [self.navigationController pushViewController:selectAreaVC animated:YES];
    
}




#pragma mark - 通知回调



@end
