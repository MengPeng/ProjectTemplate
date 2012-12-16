//
//  RTGlobal.h
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-16.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface RTGlobal : NSObject

@property (retain,nonatomic) UserModel *currentUser;

+ (RTGlobal *)getInstance;
@end
