//
//  NSString+JSONString.h
//  iOSTemplate
//
//  Created by  rtsafe02 on 12-12-24.
//  Copyright (c) 2012年 TelSafe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSObjCRuntime.h>
#import <objc/runtime.h>

@interface NSString (JSONString)

- (NSData *) jsonData;
- (NSDictionary *) jsonDictionary;
- (NSMutableArray *) rtmodels:(Class) aclass;
@end
