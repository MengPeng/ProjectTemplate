//
//  RTLoginViewController.h
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-13.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTAccountServices.h"
#import "RTPopLoginView.h"
#import "RTGlobal.h"
#import "UserService.h"

typedef void(^Block)(void);

//@protocol RTLoginViewDelegate<NSObject>
//  -(void) successfulAuthentication;
//@end

@interface RTLoginViewController : UIViewController
{
  Block successBlock;
  Block failBlock;
}
@property (strong, nonatomic) IBOutlet UITextField *txtLoginName;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil Success:(Block) success Fail:(Block)fail;
@end
