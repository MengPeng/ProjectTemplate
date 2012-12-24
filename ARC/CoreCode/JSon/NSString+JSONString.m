//
//  NSString+JSONString.m
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-24.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import "NSString+JSONString.h"

@implementation NSString (JSONString)

- (NSData *) jsonData;
{
  return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSDictionary *) jsonDictionary;
{
  
  NSData *json = [self dataUsingEncoding:NSUTF8StringEncoding];
  
  NSError *error;
  
  NSDictionary *result = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableLeaves error:&error];
  
  if(error)
  {
    NSLog(@"%@",error.description);
  }
  
  return result;
}

- (NSMutableArray *) rtmodels:(Class) aclass
{
  NSMutableArray *ret = [[NSMutableArray alloc] init];
  NSString *className = NSStringFromClass(aclass); //NSStringFromClass([theObject class]);
  
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
  
  NSError *error;
  
  NSDictionary * jsonDic = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
  
  if(!error)
  {
    
    for (NSDictionary *userdic in jsonDic) {
      id obj= [[aclass  alloc]  init];
      for(NSString *key in propertyNames)
      {
        [obj setValue:[userdic objectForKey:key] forKey:key];
      }
      [ret addObject:obj];
    }
    return ret;
  }
  
  return nil;
}
@end
