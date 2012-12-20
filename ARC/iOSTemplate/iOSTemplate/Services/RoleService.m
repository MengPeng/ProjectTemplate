#import "RoleService.h"
@implementation RoleService
-(id) init{
  self=[super init];
  if(self){
    databaseHelper = [[DatabaseHelper alloc] init];
  }
  dbName = [NSString stringWithString:[Settings Instance].DatabaseName];
  return self;
}
-(NSMutableArray *)getRole{
  [databaseHelper OpenDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"SELECT mRoleId,Name FROM Role"];
  sqlite3_stmt * statement = [databaseHelper ExecSql:sql];
  NSMutableArray *list = [[NSMutableArray alloc]initWithObjects:nil];
  RoleModel *model;
  while (sqlite3_step(statement)==SQLITE_ROW) {
    model=[[RoleModel alloc]init];
     model.RoleId = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 0) encoding:NSUTF8StringEncoding];
    model.Name = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 1) encoding:NSUTF8StringEncoding];
    [list addObject:model];
  }
  sqlite3_finalize(statement);
  [databaseHelper CloseDB];
  return list;
}
 
-(RoleModel *)getRole:(NSString *)mRoleId{
  [databaseHelper OpenDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"SELECT RoleId,Name FROM Role WHERE RoleId='%@'",mRoleId];
  sqlite3_stmt * statement = [databaseHelper ExecSql:sql];
RoleModel *model;
  while (sqlite3_step(statement)==SQLITE_ROW) {
    model=[[RoleModel alloc]init];
    model.RoleId = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 0) encoding:NSUTF8StringEncoding];
    model.Name = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 1) encoding:NSUTF8StringEncoding];
  }
  sqlite3_finalize(statement);
  [databaseHelper CloseDB];
  return model;
}
-(int)updateRole : (RoleModel *)model{
  [databaseHelper OpenDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"UPDATE Role set Name = %@ WHERE RoleId = %@",model.Name,model.RoleId];
  int tmp;
  if([databaseHelper ExecuteNonQuery:sql]==0){
    tmp = 0;
  }else{
    tmp = 1;
  }
 
  [databaseHelper CloseDB];
  return tmp;
}
-(int)deleteRole : (NSString *)mRoleId{
  [databaseHelper OpenDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"DELETE FROM Role where RoleId=%@",mRoleId];
  int tmp;
  if([databaseHelper ExecuteNonQuery:sql]==0){
    tmp = 0;
  }else{
    tmp = 1;
  }
 
  [databaseHelper CloseDB];
  return tmp;
}
-(int)insertRole : (RoleModel *)model{
  [databaseHelper OpenDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"insert into Role (RoleId,Name) values (%@,%@)",model.RoleId,model.Name];
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