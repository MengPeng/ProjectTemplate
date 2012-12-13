//
//  RTAccountServices.h
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-13.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import <Foundation/Foundation.h>
enum PasswordEncode
{
  None,
  MD5
};

@interface RTAccountServices : NSObject
-(int)login:(NSString *)userCode Password:(NSString *)password Encode:(enum PasswordEncode) encode;
@end
