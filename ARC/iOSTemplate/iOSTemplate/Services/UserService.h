#import <Foundation/Foundation.h> 
#import "DatabaseHelper.h" 
#import "UserModel.h" 
#import "RTSettings.h" 
@interface UserService : NSObject{ 
  DatabaseHelper *databaseHelper;
  NSString * dbName;
}
-(NSMutableArray *)getUsers;
-(UserModel *)getUser:(NSString *)userId;
-(int)updateUser : (UserModel *)model;
-(int)deleteUser : (NSString *)userId;
-(int)insertUser : (UserModel *)model;
-(int)replaceUser: (UserModel *)model;
@end