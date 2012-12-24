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
  [self synchronousUserFromWeb:@"http://192.168.1.218:4444/Home/GetAllUser"];
  //[NSThread sleepForTimeInterval:5];
}

-(void) synchronousDataToWeb
{
  //NSString * mp = [[JSONAutoSerializer sharedSerializer] serializeObject:[RTGlobal getInstance].currentUser];
  //NSLog(@"%@",mp);
}

-(void) synchronousUserFromWeb:(NSString *)url
{

//  //将一个对象序列化成JSON
//  UserModel *um = [[UserModel alloc] init];
//  um.Name = @"MP";
//  um.UserId = @"001";
//  um.Code = @"001";
//  um.Password = @"123456";
//  um.Email= @"mp@gmail.com";
//  um.Mobile = @"18019769552";
//  
//  NSLog(@"%@", [um jsonString]);


//    //将一组对象序列化成JSON
//    UserModel *um = [[UserModel alloc] init];
//    um.Name = @"MP";
//    um.UserId = @"001";
//    um.Code = @"001";
//    um.Password = @"123456";
//    um.Email= @"mp@gmail.com";
//    um.Mobile = @"18019769552";
//  
//    UserModel *um2 = [[UserModel alloc] init];
//    um2.Name = @"JLX";
//    um2.UserId = @"002";
//    um2.Code = @"002";
//    um2.Password = @"123456";
//    um2.Email= @"mp@gmail.com";
//    um2.Mobile = @"18019769552";
//   NSMutableArray *users = [[NSMutableArray alloc] initWithObjects:um,um2,nil];
//   NSLog(@"%@",[users jsonString]);
  
  
  
//  NSError *error;
//  NSString *jsonString = [NSString stringWithContentsOfURL:[NSURL URLWithString:url] encoding:NSUTF8StringEncoding error:&error];
//  NSLog(@"%@",jsonString);
  
  //NSDictionary *dict = [NSDictionary  dictionaryWithObjectsAndKeys:
                        
  //                      @"value1", @"key1", @"value2", @"key2", nil];
  //NSLog(@"%@",[dict jsonString]);
  //HttpHelper *http = [[HttpHelper alloc] init];
  //NSDictionary * jsonResult = [http getJSONData:url];
 
  //NSLog(@"%@",[jsonResult jsonString]);
//  if(jsonResult)
//  {
//    NSMutableArray *users = [jsonResult jsonString];
//    //[RTJSON deserializeJsonToObject:jsonResult ClassName:[UserModel class]];
//    for (UserModel *user in users)
//    {
//      NSLog(@"%@",user .Name);
//    }
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
//  }
}
@end
