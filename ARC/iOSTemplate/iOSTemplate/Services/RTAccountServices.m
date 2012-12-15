//
//  RTAccountServices.m
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-13.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import "RTAccountServices.h"
#import "UserModel.h"

@implementation RTAccountServices

-(int)login:(NSString *)userCode Password:(NSString *)password Encode:(enum PasswordEncode) encode
{
  UserModel *um = [[UserModel alloc] init];
  um.code = @"mp";
  um.password = @"123";
  
  //这里加入访问USER表的代码，用来验证用户名口令
  return [um.code isEqualToString:userCode] && [um.password isEqualToString:password];
}

@end
