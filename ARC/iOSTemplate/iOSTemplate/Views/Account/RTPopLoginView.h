//
//  RTPopLoginView.h
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-13.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTPopLoginView : UIAlertView
@property(nonatomic, retain) UITextField* oldPwd;    // 旧密码输入框
@property(nonatomic, retain) UITextField* NewPwd;    // 新密码输入框
@property(nonatomic, retain) UITextField* cfmPwd;    // 新密码确认框
@end
