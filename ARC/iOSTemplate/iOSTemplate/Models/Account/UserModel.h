#import <Foundation/Foundation.h>
@interface UserModel : NSObject{
  NSString * userid;
  NSString * code;
  NSString * password;
  NSString * name;
  NSString * email;
  NSString * mobile;
}
@property(nonatomic,retain) NSString * userid;
@property(nonatomic,retain) NSString * code;
@property(nonatomic,retain) NSString * password;
@property(nonatomic,retain) NSString * name;
@property(nonatomic,retain) NSString * email;
@property(nonatomic,retain) NSString * mobile;
@end