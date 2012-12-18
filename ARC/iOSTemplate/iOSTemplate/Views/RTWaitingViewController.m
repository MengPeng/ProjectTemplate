//
//  RTWaitingViewController.m
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-18.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import "RTWaitingViewController.h"

@interface RTWaitingViewController ()

@end

@implementation RTWaitingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(id) ShowWaiting
{
      if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
       return [[RTWaitingViewController alloc] initWithNibName:@"RTWaitingView_iPhone" bundle:nil];
      }
      else{
        return [[RTWaitingViewController alloc] initWithNibName:@"RTWaitingView_iPad" bundle:nil];
      }
}

@end
