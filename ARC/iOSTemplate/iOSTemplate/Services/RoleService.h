#import <Foundation/Foundation.h> 
#import "DatabaseHelper.h" 
#import "RoleModel.h" 
#import "Settings.h" 
@interface RoleService : NSObject{ 
  DatabaseHelper *databaseHelper;
  NSString * dbName;
}
-(NSMutableArray *)getRole; 
-(RoleModel *)getRole:(NSString *)mRoleId; 
-(int)updateRole : (RoleModel *)model;
-(int)deleteRole : (NSString *)mRoleId;
-(int)insertRole : (RoleModel *)model;
@end