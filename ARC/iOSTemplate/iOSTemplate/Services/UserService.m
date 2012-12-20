#import "UserService.h"
@implementation UserService
-(id) init{
  self=[super init];
  if(self){
    databaseHelper = [[DatabaseHelper alloc] init];
  }
  dbName = [NSString stringWithString:[[RTSettings alloc] init:@"Settings" WorkInDocument:YES].databaseName];
  return self;
}
-(NSMutableArray *)getUsers{
  [databaseHelper openDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"SELECT UserId,Code,Password,Name,Email,Mobile FROM User"];
  sqlite3_stmt * statement = [databaseHelper execSql:sql];
  NSMutableArray *list = [[NSMutableArray alloc]initWithObjects:nil];
  UserModel *model;
  while (sqlite3_step(statement)==SQLITE_ROW) {
    model=[[UserModel alloc]init];
     model.UserId = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 0) encoding:NSUTF8StringEncoding];
    model.Code = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 1) encoding:NSUTF8StringEncoding];
    model.Password = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 2) encoding:NSUTF8StringEncoding];
    model.Name = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 3) encoding:NSUTF8StringEncoding];
    model.Email = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 4) encoding:NSUTF8StringEncoding];
    model.Mobile = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 5) encoding:NSUTF8StringEncoding];
    [list addObject:model];
  }
  sqlite3_finalize(statement);
  [databaseHelper closeDB];
  return list;
}
 
-(UserModel *)getUser:(NSString *)mUserId{
  [databaseHelper openDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"SELECT UserId,Code,Password,Name,Email,Mobile FROM User WHERE UserId='%@'",mUserId];
  sqlite3_stmt * statement = [databaseHelper execSql:sql];
UserModel *model;
  while (sqlite3_step(statement)==SQLITE_ROW) {
    model=[[UserModel alloc]init];
    model.UserId = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 0) encoding:NSUTF8StringEncoding];
    model.Code = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 1) encoding:NSUTF8StringEncoding];
    model.Password = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 2) encoding:NSUTF8StringEncoding];
    model.Name = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 3) encoding:NSUTF8StringEncoding];
    model.Email = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 4) encoding:NSUTF8StringEncoding];
    model.Mobile = [[NSString alloc] initWithCString:(char *)sqlite3_column_text(statement, 5) encoding:NSUTF8StringEncoding];
  }
  sqlite3_finalize(statement);
  [databaseHelper closeDB];
  return model;
}

-(int)updateUser : (UserModel *)model{
  [databaseHelper openDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"UPDATE User SET Code ='%@',Password='%@',Name='%@',Email='%@',Mobile='%@' WHERE UserId='%@'",model.Code,model.Password,model.Name,model.Email,model.Mobile,model.UserId];
  int tmp;
  if([databaseHelper executeNonQuery:sql]==0){
    tmp = 0;
  }else{
    tmp = 1;
  }
  
  [databaseHelper closeDB];
  return tmp;
}

-(int)replaceUser : (UserModel *)model{
  [databaseHelper openDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"REPLACE INTO User(UserId,Code,Password,Name,Email,Mobile) VALUES('%@','%@','%@','%@','%@','%@');",model.UserId,model.Code,model.Password,model.Name,model.Email,model.Mobile];
  int tmp;
  if([databaseHelper executeNonQuery:sql]==0){
    tmp = 0;
  }else{
    tmp = 1;
  }
 
  [databaseHelper closeDB];
  return tmp;
}
-(int)deleteUser : (NSString *)mUserId{
  [databaseHelper openDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"DELETE FROM User where UserId=%@",mUserId];
  int tmp;
  if([databaseHelper executeNonQuery:sql]==0){
    tmp = 0;
  }else{
    tmp = 1;
  }
 
  [databaseHelper closeDB];
  return tmp;
}
-(int)insertUser : (UserModel *)model{
  [databaseHelper openDB:dbName];
  NSString * sql = [[NSString alloc] initWithFormat:@"insert into User (UserId,Code,Password,Name,Email,Mobile) values (%@,%@,%@,%@,%@,%@)",model.UserId,model.Code,model.Password,model.Name,model.Email,model.Mobile];
  int tmp;
  if([databaseHelper executeNonQuery:sql]==0){
    tmp = 0;
  }else{
    tmp = 1;
  }
 
  [databaseHelper closeDB];
  return tmp;
}

@end