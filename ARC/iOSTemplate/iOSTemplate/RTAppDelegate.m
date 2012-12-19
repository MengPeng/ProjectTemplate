//
//  RTAppDelegate.m
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-12.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import "RTAppDelegate.h"

#import "RTViewController.h"

#import "RTLoginViewController.h"

@implementation RTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  // Override point for customization after application launch.
  
  RTSettings *settings = [[RTSettings alloc] init:nil WorkInDocument:YES];
  
  self.navController = [[UINavigationController alloc] init];
  self.navController.navigationBar.hidden=YES;
  //
  if(settings.isLoginFirst)
  {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      
      self.viewController = [[RTLoginViewController alloc] initWithNibName:@"RTLoginView_iPhone"
        bundle:nil
        Success:^{
                  [self afterAuthenticationSuccess];
                }
        Fail:^{
                NSLog(@"Login Fail");
              }];
      
      [self.navController pushViewController:self.viewController animated:NO];
      
    } else {
      self.viewController = [[RTLoginViewController alloc] initWithNibName:@"RTLoginView_iPad" bundle:nil];
      [self.navController pushViewController:self.viewController animated:NO];
    }
  }
  else
  {
    [self afterAuthenticationSuccess];
  }
  self.window.rootViewController = _navController;
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void) afterAuthenticationSuccess
{
  NSLog(@"Lgoin SUCCESS");
  
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //出现等待窗口
    dispatch_sync(dispatch_get_main_queue(), ^{
      RTWaitingViewController *waiting  = [RTWaitingViewController ShowWaiting];
      //[RTWaitingViewController ShowWaiting];
      [self.viewController.navigationController pushViewController:waiting animated:NO];
    });
    dispatch_sync(dispatch_get_main_queue(), ^{
      //同步数据
      RTSynchronousService *sync = [[RTSynchronousService alloc] initWithDatabaseName:@"rt.sqlite"];
      [sync synchronousDataFromWeb];
      
    });
    dispatch_sync(dispatch_get_main_queue(), ^{
      //同步结束后续工作
      [self.navController popViewControllerAnimated:NO];
      RTViewController *view = [[RTViewController alloc] initWithNibName:@"RTViewController_iPhone" bundle:nil];
      [self.navController pushViewController:view animated:NO];
      NSLog(@"进入业务第一屏%d",self.navController.childViewControllers.count);
      //进入业务第一屏
    });
  });
}
@end
