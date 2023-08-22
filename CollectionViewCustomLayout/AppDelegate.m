//
//  AppDelegate.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/9.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "SettingViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tabViewController = [[UITabBarController alloc] init];
    
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    homeViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:[[UIImage imageNamed:@"tab_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    SettingViewController *settingViewController = [[SettingViewController alloc] init];
    settingViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Setting" image:[[UIImage imageNamed:@"tab_mine_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UITabBar.appearance.tintColor = [UIColor redColor];//将tabbar的高亮色修改为红色
    UITabBar.appearance.unselectedItemTintColor = [UIColor blackColor];
    
    UINavigationController *homeNaviVC = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    UINavigationController *settingNaviVC = [[UINavigationController alloc] initWithRootViewController:settingViewController];
    
    [tabViewController addChildViewController:homeNaviVC];
    [tabViewController addChildViewController:settingNaviVC];
    
    tabViewController.tabBar.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = tabViewController;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    
    return YES;
}

@end
