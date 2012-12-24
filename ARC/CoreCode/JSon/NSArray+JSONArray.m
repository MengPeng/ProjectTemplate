//
//  NSArray+JSONArray.m
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-24.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import "NSArray+JSONArray.h"

@implementation NSArray (JSONArray)

- (NSString *) jsonString
{
  NSMutableArray *stringArray = [[NSMutableArray alloc] initWithCapacity:0];
  for(RTModel *model in self)
  {
    [stringArray addObject:[model jsonString]];
  }
  
  return [NSString stringWithFormat:@"[%@]",[stringArray componentsJoinedByString:@","]];
}

@end
