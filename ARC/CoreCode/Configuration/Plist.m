//
//  
//  CivilizedConstruction
//
//  Created by  rtsafe02 on 12-8-22.
//  Copyright (c) 2012年  rtsafe02. All rights reserved.
//

#import "Plist.h"

@implementation Plist

+(NSString *) getValue:(NSString *)fileName Path:(NSString *)path
{
    NSMutableDictionary *dictionary = [ NSMutableDictionary dictionaryWithContentsOfFile:fileName]; 
    return [dictionary valueForKeyPath:path];
}

+(BOOL) getBoolValue:(NSString *)fileName Path:(NSString *)path
{
  NSMutableDictionary *dictionary = [ NSMutableDictionary dictionaryWithContentsOfFile:fileName];
  return  [[dictionary valueForKeyPath:path] boolValue];
}

+(void) setValue:(NSString *)fileName SectionPath:(NSString *)sectionPath SectionValue:(NSString *)sectionValue
{

    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:fileName];

    [dictionary setValue:sectionValue forKeyPath:sectionPath];
    
    if (![dictionary writeToFile:fileName atomically:YES]) {
        
        NSLog(@"Write %@ File Error!",fileName);
        
    }
}
@end
