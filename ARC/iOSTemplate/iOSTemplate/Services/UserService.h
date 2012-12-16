#import <Foundation/Foundation.h> 
#import "DatabaseHelper.h" 
#import "UserModel.h" 
#import "RTSettings.h" 
@interface UserService : NSObject{ 
  DatabaseHelper *databaseHelper;
  NSString * dbName;
}
-(NSMutableArray *)getUser; 
-(UserModel *)getUser:(NSString *)userId;
-(int)updateUser : (UserModel *)model;
-(int)deleteUser : (NSString *)muserid;
-(int)insertUser : (UserModel *)model;
@end