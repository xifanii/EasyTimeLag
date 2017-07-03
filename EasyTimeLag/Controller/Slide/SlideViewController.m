//
//  SlideViewController.m
//  EasyTimeLag
//
//  Created by 朱源浩 on 2017/6/19.
//  Copyright © 2017年 稀饭. All rights reserved.
//

#import "SlideViewController.h"
#import "FeedBackViewController.h"

#import "UIViewController+LGSideMenuController.h"

@interface SlideViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *menuList;

@end

@implementation SlideViewController

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
    _menuList = @[@{@"title":@"意见反馈",@"icon_name":@"icon_feedback"}];
}

#pragma mark - 视图加载

- (void)initUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //  数据列表
    _tableView =[UITableView new];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.tag = 100;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(@0);
    }];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH(self.view), 150)];
    headerView.backgroundColor = APP_COLOR_PRIMARY_DARK;
    
    UIImageView *appIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_app"]];
    [headerView addSubview:appIconView];
    [appIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.left.equalTo(@0).offset(20);
    }];
    
    UILabel *appLabel = [[UILabel alloc] init];
    appLabel.font = SYSTEMFONT(18);
    appLabel.textColor = [UIColor whiteColor];
    appLabel.text = @"极简时差";
    [headerView addSubview:appLabel];
    [appLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(appIconView.mas_right).offset(20);
        make.centerY.equalTo(@0);
    }];
    
    _tableView.tableHeaderView = headerView;
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
    return _menuList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSDictionary *cellDict = _menuList[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:cellDict[@"icon_name"]];
    cell.textLabel.text = cellDict[@"title"];
    cell.textLabel.font = SYSTEMFONT(16);
    cell.textLabel.textColor = UIColorFromRGB(0x425159);
    
    return cell;
}



#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UINavigationController *mainNavVC = (UINavigationController *)self.sideMenuController.rootViewController;
    
    if (indexPath.row == 0) {
        FeedBackViewController *feedbackVC = [[FeedBackViewController alloc] init];
        [mainNavVC pushViewController:feedbackVC animated:YES];
    }
    
    [self.sideMenuController hideLeftViewAnimated:YES completionHandler:nil];
    
}

#pragma mark - 通知回调



@end
