//
//  AppDelegate.m
//  EasyTimeLag
//
//  Created by 朱源浩 on 2017/6/17.
//  Copyright © 2017年 稀饭. All rights reserved.
//

#import "AppDelegate.h"
#import "CommonMacro.h"

#import <UMMobClick/MobClick.h>
#import "LGSideMenuController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 初始化umeng配置
    [self initUmeng];
    
    UIViewController *rootViewController = [UIViewController new];
    UITableViewController *leftViewController = [UITableViewController new];
    UITableViewController *rightViewController = [UITableViewController new];
    rootViewController.view.backgroundColor = UIColorRandom;
    leftViewController.view.backgroundColor = UIColorRandom;
    rightViewController.view.backgroundColor = UIColorRandom;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    
    LGSideMenuController *sideMenuController = [LGSideMenuController sideMenuControllerWithRootViewController:navigationController
                                                                                           leftViewController:leftViewController
                                                                                          rightViewController:nil];
    sideMenuController.leftViewWidth = 250.0;
    sideMenuController.leftViewPresentationStyle = LGSideMenuPresentationStyleSlideAbove;
    
    //    sideMenuController.rightViewWidth = 100.0;
    //    sideMenuController.leftViewPresentationStyle = LGSideMenuPresentationStyleSlideBelow;
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = sideMenuController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)initUmeng
{
    //    @"AdHoc" : 内测渠道
    NSString *channelName = DEV_MODE ? @"AdHoc" : @"";
    NSString *umengKey = DEV_MODE ? APP_KEY_UMENG_ADHOC : APP_KEY_UMENG;
    [MobClick setAppVersion:[ToolsUtil getAppFullVerion]];
    //    [MobClick setLogEnabled:YES];
    
    UMConfigInstance.appKey = umengKey;
    UMConfigInstance.channelId = channelName;
    UMConfigInstance.ePolicy = BATCH;
    [MobClick startWithConfigure:UMConfigInstance];
    
}

@end
