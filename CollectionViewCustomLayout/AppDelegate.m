//
//  AppDelegate.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/9.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SecondViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UITabBarController *tabViewController = [[UITabBarController alloc] init];
    ViewController *homeViewController = [[ViewController alloc] init];
    homeViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:[[UIImage imageNamed:@"tab_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    secondViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Setting" image:[[UIImage imageNamed:@"tab_mine_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UITabBar.appearance.tintColor = [UIColor redColor];//将tabbar的高亮色修改为红色
    
    [tabViewController addChildViewController:homeViewController];
    [tabViewController addChildViewController:secondViewController];
    
    tabViewController.tabBar.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = tabViewController;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

@end
