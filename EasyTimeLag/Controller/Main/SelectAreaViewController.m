//
//  SelectAreaViewController.m
//  EasyTimeLag
//
//  Created by 朱源浩 on 2017/6/19.
//  Copyright © 2017年 稀饭. All rights reserved.
//

#import "SelectAreaViewController.h"

#import "CityModel.h"

@interface SelectAreaViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UILocalizedIndexedCollation *collation;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *cityList;

@property (nonatomic, strong) NSMutableArray *cityResultList;

@end

@implementation SelectAreaViewController

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
    
    NSString *cityFilePath = [[NSBundle mainBundle] pathForResource:@"asia" ofType:@"txt"];
    NSArray *cityDataList = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:cityFilePath] options:NSJSONReadingAllowFragments error:nil];
    
    NSMutableArray *mutableCityList = [[NSMutableArray alloc] init];
    for (NSMutableDictionary *tempDict in cityDataList) {
        
        CityModel *city = [MTLJSONAdapter modelOfClass:[CityModel class] fromJSONDictionary:tempDict error:nil];
        [mutableCityList addObject:city];
    }
    
    _collation = [UILocalizedIndexedCollation currentCollation];
    NSInteger sectionTitlesCount = [[_collation sectionTitles] count];
    
    NSMutableArray *newSectionsArray = [[NSMutableArray alloc] initWithCapacity:sectionTitlesCount];
    
    //初始化27个空数组加入newSectionsArray
    for (NSInteger index = 0; index < sectionTitlesCount; index++) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [newSectionsArray addObject:array];
    }
    
    for (CityModel *city in mutableCityList){
        NSInteger sectionNumber = [_collation sectionForObject:city collationStringSelector:@selector(cityName)];
        NSMutableArray *sectionNames = newSectionsArray[sectionNumber];
        [sectionNames addObject:city];
    }
    for (NSInteger index = 0; index < sectionTitlesCount; index++) {
        NSMutableArray *personArrayForSection = newSectionsArray[index];
        NSArray *sortedPersonArrayForSection = [_collation sortedArrayFromArray:personArrayForSection collationStringSelector:@selector(cityName)];
        newSectionsArray[index] = sortedPersonArrayForSection;
    }
    
    _cityResultList = newSectionsArray;
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
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(@0);
    }];

}

#pragma mark - 数据处理



#pragma mark - 网络请求



#pragma mark - 用户动作



#pragma mark - 视图操作/动画



#pragma mark - 代理方法

#pragma mark UITableView Delegate

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [_collation sectionIndexTitles];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [_collation sectionForSectionIndexTitleAtIndex:index];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[_collation sectionTitles] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0) {
        return 1;
    }
    return [[_cityResultList objectAtIndex:sectionIndex] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 15.;
//}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH(self.view), 15)];
//    view.backgroundColor = APP_COLOR_PRIMARY_DARK;
//    
//    return view;
//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    NSArray *UserObjsInSection = [_cityResultList objectAtIndex:section];
    if(UserObjsInSection == nil || [UserObjsInSection count] <= 0) {
        return nil;
    }
    return [[_collation sectionTitles] objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell =nil;
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
    CityModel *city = (CityModel *)_cityResultList[indexPath.section][indexPath.row];
    cell.textLabel.text = city.cityName;
    cell.textLabel.font = SYSTEMFONT(15);

    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - 通知回调



@end
