//
//  RTViewController.m
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-12.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import "RTViewController.h"

@interface RTViewController ()

@end

@implementation RTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnGetUser:(id)sender {
  HttpHelper *http = [[HttpHelper alloc] init];
  NSString * jsonStr =[NSString stringWithFormat:@"json=%@",[http getJsonString:@"http://192.168.1.67:34062/Home/GetAllUser"]];
  
  //NSData * jsonData = [NSJSONSerialization dataWithJSONObject:jsonDic options:NSJSONReadingMutableLeaves error:nil];
  NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
  
  [http postJson:@"http://192.168.1.67:34062/Home/SetUser" JsonData:jsonData];
}
- (IBAction)btnSetUser:(id)sender {
  
  HttpHelper *http = [[HttpHelper alloc] init];
  NSDictionary * jsonDic =[http getJsonData:@"http://192.168.1.67:34062/Home/GetAllUser"];
  
  NSMutableArray * users =[RTJSON deserializeJsonToObject:jsonDic ClassName:[UserModel class]];

    UserService *uService = [[UserService alloc] init];
  
  for(UserModel *u in users)
  {
    u.Name = [u.Name stringByAppendingString:@"CC"];
    [uService updateUser:u];
  }
  

  
}

@end
