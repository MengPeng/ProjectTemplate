//
//  JSONAutoSerializer.m
//  TestOCRuntimeProgramming
//
//  Created by freeZn on 11-12-13.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "RTJSON.h"
#import <Foundation/NSObjCRuntime.h>
#import <objc/runtime.h>

@implementation RTJSON
//static RTJSON *_sharedSerializer = nil;

+ (NSData *)serializeObjectToData:(id)theObject
{
  NSString *className = NSStringFromClass([theObject class]);
  
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
    id value = [theObject performSelector:selector];
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
  
  return jsonData;
}

+ (NSString *)serializeObjectToString:(id)theObject
{
  
  NSData *jsonData = [self serializeObjectToData:theObject];
  NSString *retString= [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
  
  return retString;
  
}

+ (NSMutableArray *)deserializeJsonToObject:(NSDictionary *)json ClassName:(Class) aclass;
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
  
  for (NSDictionary *userdic in json) {
    id obj= [[aclass  alloc]  init];
    for(NSString *key in propertyNames)
    {
      [obj setValue:[userdic objectForKey:key] forKey:key];
    }
    [ret addObject:obj];
  }
  return ret;
}

//+ (RTJSON *)sharedSerializer
//{
//  if (_sharedSerializer == nil)
//  {
//    
//    _sharedSerializer = [[RTJSON alloc] init];
//    
//  }
//  
//  
//  return _sharedSerializer;
//}

//- (id)init
//{
//  self = [super init];
//  
//  if (self)
//  {
//    
//    
//    
//  }
//  
//  return self;
//}

//- (void)dealloc
//{
//[super dealloc];

//}

@end
