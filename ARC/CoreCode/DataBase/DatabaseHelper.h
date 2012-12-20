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

-(int)openDB:(NSString*)dbName;
-(sqlite3_stmt *)execSql:(NSString *)sql;
-(int) executeNonQuery:(NSString *)sql;
-(void)step;
-(void) beginTransaction;
-(int) commit;
-(void) final;
-(void) closeDB;

@end
