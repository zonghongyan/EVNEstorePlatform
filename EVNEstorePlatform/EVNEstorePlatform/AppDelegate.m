//
//  AppDelegate.m
//  EVNEstorePlatform
//
//  Created by developer on 2016/12/30.
//  Copyright © 2016年 仁伯安. All rights reserved.
//

#import "AppDelegate.h"
#import "UIWindow+StartLaunch.h"
#import "WelComeViewController.h"
#import "EVNTabBarController.h"
#import "GetTokenFailViewController.h"
#import "AdvertiseLaunchViewController.h"

@interface AppDelegate ()
{
    EVNTabBarController *tabbar;
    UIStoryboard *mainSB;
}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    [NSThread sleepForTimeInterval:3.0];//设置启动页面时间
    mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    tabbar = [mainSB instantiateViewControllerWithIdentifier:@"tabBarController"]; // 初始化TabBar
    [self dealEnterToDCFTabbar:@"启动页"];

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

#pragma mark - 页面跳转及入口跳转方法
- (void)dealEnterToDCFTabbar:(NSString *)toWhere
{
    if ([toWhere isEqualToString:@"启动页"])
    {
        UIViewController *rootViewController = nil;                             // 判断是否是第一次登陆
        if(![[NSUserDefaults standardUserDefaults] objectForKey:@"FirstLanch"]) // 欢迎页
        {
            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"FirstLanch"];
            WelComeViewController *welcomeVC = [[WelComeViewController alloc] initWithNibName:@"WelComeViewController" bundle:nil];
            rootViewController = welcomeVC;
        }
        else
        {
             GetTokenFailViewController *getTokenFailViewController = [[GetTokenFailViewController alloc] init];
             rootViewController = getTokenFailViewController;
        }
        [self.window startLaunchForRootController:rootViewController];           // 一般启动方式
    }
    else if([toWhere isEqualToString:@"欢迎页"])
    {
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"FirstLanch"];

        WelComeViewController *welcomeVC = [[WelComeViewController alloc] initWithNibName:@"WelComeViewController" bundle:nil];
        [self.window startLaunchForRootController:welcomeVC];
    }
    else if ([toWhere isEqualToString:@"tokenView"])
    {
        GetTokenFailViewController *getTokenFailViewController = [[GetTokenFailViewController alloc] init];
        [self.window startLaunchForRootController:getTokenFailViewController];
    }
    else if ([toWhere isEqualToString:@"广告页"])
    {
         AdvertiseLaunchViewController *advertiseLaunchViewController = [[AdvertiseLaunchViewController alloc] init];
         [self.window startLaunchForRootController:advertiseLaunchViewController];
    }
    else if ([toWhere isEqualToString:@"首页"])
    {
        if(tabbar == nil)
        {
            tabbar = [mainSB instantiateViewControllerWithIdentifier:@"tabBarController"];
        }
        [self.window startLaunchForRootController:tabbar];
        [tabbar setSelectedIndex:0];
    }
}


@end
