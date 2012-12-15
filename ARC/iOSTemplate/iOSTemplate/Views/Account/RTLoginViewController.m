//
//  RTLoginViewController.m
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-13.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import "RTLoginViewController.h"

@interface RTLoginViewController ()

@end

@implementation RTLoginViewController

@synthesize txtLoginName;
@synthesize txtPassword;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  
  return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
               Success:(Block) success
               Fail:(Block)fail;
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
    successBlock = success;
    failBlock = fail;
  }
  
  return self;
}


- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
- (IBAction)btnLoginClick:(id)sender {
  RTAccountServices * accountService = [[RTAccountServices alloc] init];
  if([accountService login:txtLoginName.text Password:txtPassword.text Encode:None]==TRUE)
  {
    if(successBlock!=nil)
    {
      successBlock();
    }
  }
  else
  {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名口令不匹配！请重试。" delegate:^{NSLog(@"111");} cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
    
    if(failBlock!=nil)
    {
      failBlock();
    }
  }
}


@end
