//
//  RootViewController.m
//  EasyTimeLag
//
//  Created by 朱源浩 on 2017/6/19.
//  Copyright © 2017年 稀饭. All rights reserved.
//

#import "RootViewController.h"

#import "MainViewController.h"
#import "SlideViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

#pragma mark - Override System Method

- (instancetype)init
{
    self = [super init];
    if (self) {
        MainViewController *mainViewController = [[MainViewController alloc] init];
        SlideViewController *sildeViewController = [[SlideViewController alloc] init];
        UINavigationController *navMainViewController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
        
        self.rootViewController = navMainViewController;
        self.leftViewController = sildeViewController;
        self.leftViewWidth = 250.0;
        self.leftViewPresentationStyle = LGSideMenuPresentationStyleSlideAbove;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
