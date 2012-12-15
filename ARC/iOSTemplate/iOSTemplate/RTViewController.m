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
  //这里跳转到第一个页面，例如登录页面
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClick:(id)sender {
  //RTAccountServices *rs = [[RTAccountServices alloc] init];
  //[rs login:@"" Password:@"" Encode:None];
  
  
  RTLoginViewController *loginview = [[RTLoginViewController alloc] init];
  [self presentViewController:loginview animated:TRUE completion:^{}];
  [loginview loadView];
  NSLog(@"dddd");
}

@end
