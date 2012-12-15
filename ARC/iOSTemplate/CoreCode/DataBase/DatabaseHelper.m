//
//  DBOP.m
//  文明施工
//
//  Created by fy ren on 12-8-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DatabaseHelper.h"

@implementation DatabaseHelper

-(int)OpenDB:(NSString*)dbName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *_path = [documentsDirectory stringByAppendingPathComponent:dbName];
  int status =sqlite3_open([_path UTF8String], &database);
    if ( status != SQLITE_OK) {
        sqlite3_close(database);
        NSLog(@"数据库打开失败,错误代码:%d",status);
      return  FALSE;
    }
    //sqlite3_open([_path UTF8String], &database);
    sqlite3_exec(database, "PRAGMA synchronous = OFF;", 0,0,0);
  return TRUE;
}

-(sqlite3_stmt *)ExecSql:(NSString *)sql
{
    char * csql = (char*)[sql UTF8String];
    int ret = sqlite3_prepare_v2(database, csql, -1, &statement,nil);
    if( ret != SQLITE_OK)
    {
        NSLog(@"SQL错误：%@,错误代码：%d",[[NSString alloc] initWithCString:csql encoding:NSUTF8StringEncoding],ret);
    }
    return statement;
}

-(void) ExecuteNonQuery:(NSString *)sql
{
    char *errorMsg;
    char *cssql = (char *)[sql UTF8String];
    if (sqlite3_exec(database, cssql, NULL, NULL, &errorMsg)==SQLITE_OK) {
        ;
    }else {
        NSLog(@"error: %s",errorMsg);
        sqlite3_free(errorMsg);
    }
}

-(void)Setp
{
    sqlite3_step(statement);
    
}

-(void) BeginTransaction
{
    sqlite3_exec(database,"BEGIN TRANSACTION",nil,nil,nil);
}
-(int) Commit
{
    char *error;
    int i= sqlite3_exec(database,"COMMIT",nil,nil,&error); //COMMIT
    if(error)
    {
        NSString *err = [[NSString alloc] initWithCString:error encoding:NSUTF8StringEncoding];
        NSLog(@"Commit 异常：%@",err);
    }
    return  i;
}

-(void)Final
{
    sqlite3_finalize(statement);
}

-(void)CloseDB
{
    sqlite3_close(database);
    //取得数据库文件cc.sqlite在模拟器/真机上的真实路径
    //NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //NSString *realPath = documentPath;
    //NSLog(@"数据库所在路径：%@", realPath);
}

@end

