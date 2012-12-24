//
//  RTModel.m
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-24.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import "RTModel.h"

@implementation RTModel
- (NSString *) jsonString
{
  NSString *className = NSStringFromClass([self class]);
  
  const char *cClassName = [className UTF8String];
  
  id theClass = objc_getClass(cClassName);
  
  unsigned int outCount, i;
  
  objc_property_t *properties = class_copyPropertyList(theClass, &outCount);
  
  NSMutableArray *propertyNames = [[NSMutableArray alloc] initWithCapacity:1];
  
  for (i = 0; i < outCount; i++) {
    
    objc_property_t property = properties[i];
    
    NSString *propertyNameString = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
    
    [propertyNames addObject:propertyNameString];
    
  }
  
  NSMutableDictionary *finalDict = [[NSMutableDictionary alloc] initWithCapacity:1];
  
  for(NSString *key in propertyNames)
  {
    SEL selector = NSSelectorFromString(key);
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    id value = [self performSelector:selector];
#pragma clang diagnostic pop
    
    
    if (value == nil)
    {
      value = [NSNull null];
    }
    
    [finalDict setObject:value forKey:key];
  }
  
  NSError *error;
  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:finalDict options:NSJSONReadingMutableLeaves error:&error];
  
  if(error)
  {
    NSLog(@"json error:%@",error.description);
    return nil;
  }
  
  return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
@end
