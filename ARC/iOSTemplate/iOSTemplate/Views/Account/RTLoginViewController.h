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
#import "RTJSON.h"

typedef void(^Block)(void);

//@protocol RTLoginViewDelegate<NSObject>
//  -(void) successfulAuthentication;
//@end

/**一个根据编译目标不同可以自动切换iPad\iPhone界面的登录窗口*/
@interface RTLoginViewController : UIViewController
{
  Block successBlock;
  Block failBlock;
}

/**登录名*/
@property (strong, nonatomic) IBOutlet UITextField *txtLoginName;

/**口令*/
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

/**
 iPad iPhone通用的登录窗口，
 @param[in] Success 登录成功后执行的Block
 @param[in] Fail 登录失败后执行的Block
 @par 示例
 @code
 self.viewController = [[RTLoginViewController alloc] initWithNibName:@"RTLoginView_iPhone"
 bundle:nil
 Success:^{
    //这里写登录成功后的代码
    [self afterAuthenticationSuccess];
 }
 Fail:^{
    //这里写登录失败后的代码
    NSLog(@"Login Fail");
 }];
 @endcode
*/
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil Success:(Block) success Fail:(Block)fail;
@end
