//
//  RTGlobal.m
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-16.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import "RTGlobal.h"

@implementation RTGlobal
@synthesize currentUser;

+ (RTGlobal *)getInstance
{
  static RTGlobal *instance = nil;
  
  @synchronized(self)
  {
    if (!instance)
      instance = [[RTGlobal alloc] init];
    return instance;
  }
}

@end
