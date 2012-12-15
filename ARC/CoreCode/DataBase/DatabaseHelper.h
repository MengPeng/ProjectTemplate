//
//  DBOP.h
//  文明施工
//
//  Created by fy ren on 12-8-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

//DatabaseOperation
@interface DatabaseHelper : NSObject
{
    sqlite3_stmt *statement;
    sqlite3 *database;
}

-(int)OpenDB:(NSString*)dbName;
-(sqlite3_stmt *)ExecSql:(NSString *)sql;
-(void) ExecuteNonQuery:(NSString *)sql;
-(void)Setp;
-(void) BeginTransaction;
-(int) Commit;
-(void)Final;
-(void)CloseDB;

@end
