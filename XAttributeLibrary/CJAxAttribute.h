//
//  XAttributeLibrary.h
//  XAttributeLibrary
//
//  Created by Chris Armour on 17/07/2016.
//  Copyright © 2016 McLaren Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJAxAttribute : NSObject

+ (BOOL)setValue:(NSString *)value forAttribute:(NSString *)attrName forURL:(NSURL *)url;

+ (NSString *)getAttribute: (NSString *)attrName forURL:(NSURL *)url;

@end
