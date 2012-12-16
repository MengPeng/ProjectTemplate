//
//  RTAppDelegate.h
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-12.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTLoginViewController.h"
#import "RTSynchronousService.h"
#import "RTSettingsService.h"

@class RTViewController;

@interface RTAppDelegate : UIResponder <UIApplicationDelegate>
{
  NSString * UserCode;
  NSString * UserName;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RTLoginViewController *viewController;

@property (strong, nonatomic) UINavigationController *navController;

@end
