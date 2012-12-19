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
  BOOL isWorkInDocument;
}

-(id) init:(NSString *)fileName WorkInDocument:(BOOL)workInDocument
{
  self = [super init];
  if(self)
  {
    if(fileName)
    {
      plistName = fileName;
    }
    else
    {
      plistName = @"Settings";
    }
    isWorkInDocument = workInDocument;
    //默认从resources目录里取
    if(!isWorkInDocument)
    {
      plistFullName= [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    }
    else
    {
      NSArray *doc = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
      
      plistFullName = [[ doc objectAtIndex:0 ]stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",plistName]]; // 字典集合。
      [self copyPlistFileToDocuments];
    }
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
  NSString *documentLibraryFolderPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",plistName]];
  
  plistFullName = documentLibraryFolderPath;
  
  if (![[NSFileManager defaultManager] fileExistsAtPath:documentLibraryFolderPath])
  {
    NSString *resourceSampleImagesFolderPath =[[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSData *mainBundleFile = [NSData dataWithContentsOfFile:resourceSampleImagesFolderPath];
    [[NSFileManager defaultManager] createFileAtPath:documentLibraryFolderPath contents:mainBundleFile attributes:nil];
  }
  
}

@end
