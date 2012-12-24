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
//  NSString * jsonStr =[NSString stringWithFormat:@"json=%@",[http getJSONString:@"http://192.168.1.67:34062/Home/GetAllUser"]];
// 
//  [http postJSONString:@"http://192.168.1.67:34062/Home/SetUser" JSONString :jsonStr];
  
     UserModel *um = [[UserModel alloc] init];
     um.Name = @"MP";
     um.UserId = @"001";
     um.Code = @"001";
     um.Password = @"123456";
     um.Email= @"mp@gmail.com";
     um.Mobile = @"18019769552";
 
     UserModel *um2 = [[UserModel alloc] init];
     um2.Name = @"JLX";
     um2.UserId = @"002";
     um2.Code = @"002";
     um2.Password = @"123456";
     um2.Email= @"mp@gmail.com";
     um2.Mobile = @"18019769552";
    NSMutableArray *users = [[NSMutableArray alloc] initWithObjects:um,um2,nil];
  
  [http postRTModel:@"http://192.168.1.67:34062/Home/SetUser" RTModels:users];
}
- (IBAction)btnSetUser:(id)sender {
  
  HttpHelper *http = [[HttpHelper alloc] init];
  NSString * jsonDic =[http getJSONString:@"http://192.168.1.218:4444/Home/GetAllUser"];
  
  NSMutableArray * users = [jsonDic rtmodels:[UserModel class]];
  //[RTJSON deserializeJsonToObject:jsonDic ClassName:[UserModel class]];

    UserService *uService = [[UserService alloc] init];
  
  for(UserModel *u in users)
  {
    u.Name = [u.Name stringByAppendingString:@"EE"];
    [uService updateUser:u];
  }
  

  
}

@end
