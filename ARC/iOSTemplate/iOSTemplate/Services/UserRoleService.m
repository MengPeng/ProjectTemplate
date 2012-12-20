#import "UserRoleService.h"
@implementation UserRoleService
-(id) init{
  self=[super init];
  if(self){
    databaseHelper = [[DatabaseHelper alloc] init];
  }
  dbName = [NSString stringWithString:[Settings Instance].DatabaseName];
  return self;
}
-(NSMutableArray *)getUserRole{
  [databaseHelper OpenDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"SELECT mUserId,RoleId FROM UserRole"];
  sqlite3_stmt * statement = [databaseHelper ExecSql:sql];
  NSMutableArray *list = [[NSMutableArray alloc]initWithObjects:nil];
  UserRoleModel *model;
  while (sqlite3_step(statement)==SQLITE_ROW) {
    model=[[UserRoleModel alloc]init];
     model.UserId = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 0) encoding:NSUTF8StringEncoding];
    model.RoleId = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 1) encoding:NSUTF8StringEncoding];
    [list addObject:model];
  }
  sqlite3_finalize(statement);
  [databaseHelper CloseDB];
  return list;
}
 
-(UserRoleModel *)getUserRole:(NSString *)mUserId{
  [databaseHelper OpenDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"SELECT UserId,RoleId FROM UserRole WHERE UserId='%@'",mUserId];
  sqlite3_stmt * statement = [databaseHelper ExecSql:sql];
UserRoleModel *model;
  while (sqlite3_step(statement)==SQLITE_ROW) {
    model=[[UserRoleModel alloc]init];
    model.UserId = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 0) encoding:NSUTF8StringEncoding];
    model.RoleId = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 1) encoding:NSUTF8StringEncoding];
  }
  sqlite3_finalize(statement);
  [databaseHelper CloseDB];
  return model;
}
-(int)updateUserRole : (UserRoleModel *)model{
  [databaseHelper OpenDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"UPDATE UserRole set RoleId = %@ WHERE UserId = %@",model.RoleId,model.UserId];
  int tmp;
  if([databaseHelper ExecuteNonQuery:sql]==0){
    tmp = 0;
  }else{
    tmp = 1;
  }
 
  [databaseHelper CloseDB];
  return tmp;
}
-(int)deleteUserRole : (NSString *)mUserId{
  [databaseHelper OpenDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"DELETE FROM UserRole where UserId=%@",mUserId];
  int tmp;
  if([databaseHelper ExecuteNonQuery:sql]==0){
    tmp = 0;
  }else{
    tmp = 1;
  }
 
  [databaseHelper CloseDB];
  return tmp;
}
-(int)insertUserRole : (UserRoleModel *)model{
  [databaseHelper OpenDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"insert into UserRole (UserId,RoleId) values (%@,%@)",model.UserId,model.RoleId];
  int tmp;
  if([databaseHelper ExecuteNonQuery:sql]==0){
    tmp = 0;
  }else{
    tmp = 1;
  }
 
  [databaseHelper CloseDB];
  return tmp;
}

@end