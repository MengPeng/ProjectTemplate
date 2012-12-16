#import "UserService.h"
@implementation UserService
-(id) init{
  self=[super init];
  if(self){
    databaseHelper = [[DatabaseHelper alloc] init];
  }
  RTSettings *settings = [[RTSettings alloc] init:@"Settings"];
  dbName = settings.databaseName;
  return self;
}
-(NSMutableArray *)getUser{
  [databaseHelper OpenDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"SELECT muserid,code,password,name,email,mobile FROM User"];
  sqlite3_stmt * statement = [databaseHelper ExecSql:sql];
  NSMutableArray *list = [[NSMutableArray alloc]initWithObjects:nil];
  UserModel *model;
  while (sqlite3_step(statement)==SQLITE_ROW) {
    model=[[UserModel alloc]init];
     model.userid = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 0) encoding:NSUTF8StringEncoding];
    model.code = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 1) encoding:NSUTF8StringEncoding];
    model.password = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 2) encoding:NSUTF8StringEncoding];
    model.name = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 3) encoding:NSUTF8StringEncoding];
    model.email = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 4) encoding:NSUTF8StringEncoding];
    model.mobile = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 5) encoding:NSUTF8StringEncoding];
    [list addObject:model];
  }
  sqlite3_finalize(statement);
  [databaseHelper CloseDB];
  return list;
}
 
-(UserModel *)getUser:(NSString *)userId{
  [databaseHelper OpenDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"SELECT userid,code,password,name,email,mobile FROM User WHERE code='%@'",userId];
  sqlite3_stmt * statement = [databaseHelper ExecSql:sql];
UserModel *model;
  while (sqlite3_step(statement)==SQLITE_ROW) {
    model=[[UserModel alloc]init];
    model.userid = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 0) encoding:NSUTF8StringEncoding];
    model.code = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 1) encoding:NSUTF8StringEncoding];
    model.password = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 2) encoding:NSUTF8StringEncoding];
    model.name = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 3) encoding:NSUTF8StringEncoding];
    model.email = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 4) encoding:NSUTF8StringEncoding];
    model.mobile = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 5) encoding:NSUTF8StringEncoding];
  }
  sqlite3_finalize(statement);
  [databaseHelper CloseDB];
  return model;
}
-(int)updateUser : (UserModel *)model{
  [databaseHelper OpenDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"UPDATE User set code = %@,password = %@,name = %@,email = %@,mobile = %@ WHERE userid = %@",model.code,model.password,model.name,model.email,model.mobile,model.userid];
  [databaseHelper ExecuteNonQuery:sql];
  [databaseHelper CloseDB];
}
-(int)deleteUser : (NSString *)muserid{
  [databaseHelper OpenDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"DELETE FROM User where userid=%@",muserid];
  [databaseHelper ExecuteNonQuery:sql];
  [databaseHelper CloseDB];
}
-(int)insertUser : (UserModel *)model{
  [databaseHelper OpenDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"insert into User (userid,code,password,name,email,mobile) values (UserModel.userid,UserModel.code,UserModel.password,UserModel.name,UserModel.email,UserModel.mobile)"];
  [databaseHelper ExecuteNonQuery:sql];
  [databaseHelper CloseDB];
}

@end