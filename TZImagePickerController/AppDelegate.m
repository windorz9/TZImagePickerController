//
//  AppDelegate.m
//  TZImagePickerController
//
//  Created by 谭真 on 15/12/24.
//  Copyright © 2015年 谭真. All rights reserved.
//

#import "AppDelegate.h"
#import "MediaLibraryViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 创建一个单独的测试模块来进行测试 ->
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    MediaLibraryViewController *mediaLibraryVC = [[MediaLibraryViewController alloc] init];
    self.window.rootViewController = mediaLibraryVC;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
   
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
