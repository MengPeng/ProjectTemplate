//
//  RTSynchronousService.h
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-14.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpHelper.h"
#import "DatabaseHelper.h"

@interface RTSynchronousService : NSObject
{
  NSString *dbName;
  DatabaseHelper *dbHelper;
}
-(id)initWithDatabaseName:(NSString *) databaseName;
-(void) synchronousData;
//-(void) synchronousUserFromWeb:(NSString *)url;

@end
