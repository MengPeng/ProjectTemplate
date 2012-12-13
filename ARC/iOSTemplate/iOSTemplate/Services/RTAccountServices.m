//
//  RTAccountServices.m
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-13.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import "RTAccountServices.h"

@implementation RTAccountServices

-(int)login:(NSString *)userCode Password:(NSString *)password Encode:(enum PasswordEncode) encode
{
  NSLog(@"%d",encode);
  return TRUE;
}

@end
