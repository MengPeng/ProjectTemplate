#import <Foundation/Foundation.h> 
#import "DatabaseHelper.h" 
#import "UserRoleModel.h" 
#import "Settings.h" 
@interface UserRoleService : NSObject{ 
  DatabaseHelper *databaseHelper;
  NSString * dbName;
}
-(NSMutableArray *)getUserRole; 
-(UserRoleModel *)getUserRole:(NSString *)mUserId; 
-(int)updateUserRole : (UserRoleModel *)model;
-(int)deleteUserRole : (NSString *)mUserId;
-(int)insertUserRole : (UserRoleModel *)model;
@end