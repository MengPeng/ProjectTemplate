//
//  RTSettingsService.h
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-16.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Plist.h"

@interface RTSettings : NSObject
{
  
}

@property (nonatomic) BOOL isLoginFirst;
@property (retain, nonatomic) NSString * databaseName;

-(id) init:(NSString *)fileName WorkInDocument:(BOOL)workInDocument;


@end
