//
//  RTSynchronousService.m
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-14.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import "RTSynchronousService.h"

@implementation RTSynchronousService

-(id)initWithDatabaseName:(NSString *) databaseName
{
  self = [super init];
  if(self)
  {
    dbName = databaseName;
    dbHelper = [[DatabaseHelper alloc] init];
  }
  return self;
}

-(void) synchronousData
{
  //自行添加需要同步的函数
  [self synchronousUserFromWeb:@"http://192.168.1.218:4444/Home/GetAllUser"];
}

-(void) synchronousUserFromWeb:(NSString *)url
{
  
  HttpHelper *http = [[HttpHelper alloc] init];
  NSDictionary *jsonResult = [http getJSon:url];
  if(jsonResult)
  {
  NSString *sqlTemp = @"REPLACE INTO User(UserId,Code,Password,Name,Email,Mobile) VALUES('%@','%@','%@','%@','%@','%@');";
  
  if([dbHelper OpenDB:dbName])
  {
    NSString *sql;
    for (NSDictionary *userdic in jsonResult) {
      sql = [NSString stringWithFormat:sqlTemp,[userdic objectForKey:@"UserId"],
             [userdic objectForKey:@"Code"],
             [userdic objectForKey:@"Password"],
             [userdic objectForKey:@"Name"],
             [userdic objectForKey:@"Email"],
             [userdic objectForKey:@"Mobile"]
             ];
      NSLog(@"%@",sql);
      
      [dbHelper ExecuteNonQuery:sql];
    }
    [dbHelper CloseDB];
  }
  //NSLog(@"%d",[jsonResult count]);
  }
}
@end
