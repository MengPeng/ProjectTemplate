//
//  RTSettingsService.m
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-16.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import "RTSettings.h"

@implementation RTSettings
{
  NSString * plistName;
  NSString * plistFullName;
}

-(id) init:(NSString *)fileName;
{
  self = [super init];
  if(self)
  {
    plistName = fileName;
    
    //默认从resources目录里取
    plistFullName= [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
  }
  return self;
}

-(BOOL) isLoginFirst
{
  return [Plist getBoolValue:plistFullName Path:@"isLoginFirst"];
}

-(NSString *) databaseName
{
  return [Plist getValue:plistFullName Path:@"DatabaseName"];
}

//将Plist文件复制到Documents目录下，以便进行读写
-(void)copyPlistFileToDocuments
{
  NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory,NSUserDomainMask, YES);
  NSString *documentsDirectory = [paths objectAtIndex:0];
  NSString *documentLibraryFolderPath = [documentsDirectory stringByAppendingPathComponent:plistName];
  
  plistFullName = documentLibraryFolderPath;
  
  if ([[NSFileManager defaultManager] fileExistsAtPath:documentLibraryFolderPath]) {
    
    //NSLog(@"文件已经存在了");
  }else {
    //    NSString *plistPath = [[NSBundle mainBundle] pathForResource:fullPathToFile ofType:@"plist"];
    
    NSString *resourceSampleImagesFolderPath =[[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSData *mainBundleFile = [NSData dataWithContentsOfFile:resourceSampleImagesFolderPath];
    [[NSFileManager defaultManager] createFileAtPath:documentLibraryFolderPath contents:mainBundleFile attributes:nil];
  }
  
}

@end
