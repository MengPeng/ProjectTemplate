#import <Foundation/Foundation.h> 
#import "RTModel.h"

 @interface UserModel : RTModel{

 } 
@property(nonatomic,retain) NSString * UserId;
@property(nonatomic,retain) NSString * Code;
@property(nonatomic,retain) NSString * Password;
@property(nonatomic,retain) NSString * Name;
@property(nonatomic,retain) NSString * Email;
@property(nonatomic,retain) NSString * Mobile;
@end