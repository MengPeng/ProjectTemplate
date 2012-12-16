//
//  
//  CivilizedConstruction
//
//  Created by  rtsafe02 on 12-8-22.
//  Copyright (c) 2012年  rtsafe02. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Plist:NSObject
{

}

+(NSString *) getValue:(NSString *)fileName Path:(NSString *)path;
+(BOOL) getBoolValue:(NSString *)fileName Path:(NSString *)path;
+(void) setValue:(NSString *)fileName SectionPath:(NSString *)sectionPath SectionValue:(NSString *)sectionValue ;
@end
