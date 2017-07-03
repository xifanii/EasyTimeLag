//
//  MainViewController.m
//  EasyTimeLag
//
//  Created by 朱源浩 on 2017/6/19.
//  Copyright © 2017年 稀饭. All rights reserved.
//

#import "MainViewController.h"

#import "SelectContinentViewController.h"
#import "UIViewController+LGSideMenuController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    
}

#pragma mark - 视图加载

- (void)initUI {
    
    self.title = NSLocalizedString(@"极简时差", nil);
    self.view.backgroundColor = APP_COLOR_PRIMARY_DARK;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"bar_item_menu"] style:UIBarButtonItemStylePlain target:self action:@selector(showSlideMenu)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"bar_item_add"]  style:UIBarButtonItemStylePlain target:self action:@selector(addTimerCity)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark - 数据处理



#pragma mark - 网络请求



#pragma mark - 用户动作

- (void)showSlideMenu
{
    [self.sideMenuController showLeftViewAnimated:YES completionHandler:nil];
}

- (void)addTimerCity
{
    SelectContinentViewController *selectContinentVC = [[SelectContinentViewController alloc] init];
    [self.navigationController pushViewController:selectContinentVC animated:YES];
}

#pragma mark - 视图操作/动画



#pragma mark - 代理方法

#pragma mark - UITableView Datasource

#pragma mark - UITableView Delegate methods



#pragma mark - 通知回调


@end
