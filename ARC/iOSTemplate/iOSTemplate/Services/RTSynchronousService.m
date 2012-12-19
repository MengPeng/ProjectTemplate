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

-(void) synchronousDataFromWeb
{
  //自行添加需要同步的函数
  [self synchronousUserFromWeb:@"http://192.168.1.218:4445/Home/GetAllUser"];
  
}

-(void) synchronousDataToWeb
{
  //NSString * mp = [[JSONAutoSerializer sharedSerializer] serializeObject:[RTGlobal getInstance].currentUser];
  //NSLog(@"%@",mp);
}

-(void) synchronousUserFromWeb:(NSString *)url
{
  
  HttpHelper *http = [[HttpHelper alloc] init];
  NSDictionary *jsonResult = [http getJsonData:url];
  if(jsonResult)
  {
    NSMutableArray *users = [RTJSON deserializeJsonToObject:jsonResult ClassName:[UserModel class]];
    for (UserModel *user in users)
    {
      NSLog(@"%@",user .Name);
    }
//    NSString *sqlTemp = @"REPLACE INTO User(UserId,Code,Password,Name,Email,Mobile) VALUES('%@','%@','%@','%@','%@','%@');";
//    
//    if([dbHelper OpenDB:dbName])
//    {
//      NSString *sql;
//      for (NSDictionary *userdic in jsonResult) {
//        sql = [NSString stringWithFormat:sqlTemp,[userdic objectForKey:@"UserId"],
//               [userdic objectForKey:@"Code"],
//               [userdic objectForKey:@"Password"],
//               [userdic objectForKey:@"Name"],
//               [userdic objectForKey:@"Email"],
//               [userdic objectForKey:@"Mobile"]
//               ];
//        NSLog(@"%@",sql);
//        
//        [dbHelper ExecuteNonQuery:sql];
//      }
//      [dbHelper CloseDB];
//    }
  }
}
@end
