//
//  XAttributeLibrary.m
//  XAttributeLibrary
//
//  Created by Chris Armour on 17/07/2016.
//  Copyright © 2016 McLaren Software. All rights reserved.
//

#import "CJAxAttribute.h"
#import "sys/xattr.h"

@implementation CJAxAttribute

+ (BOOL)setValue:(NSString *)value forAttribute:(NSString *)attrName forURL:(NSURL *)url {
    const char* attributeName = [attrName UTF8String];
    const char* val = [value UTF8String];
    int result = setxattr([url fileSystemRepresentation], attributeName, val, strlen(val), 0, 0);
    
    return (result == 0);
}

+ (NSString *)getAttribute: (NSString *)attrName forURL:(NSURL *)url {
    const char* attributeName = [attrName UTF8String];
    ssize_t attributeLength = getxattr([url fileSystemRepresentation], attributeName, NULL, 0, 0, 0);
    
    if (attributeLength <= 0)
    {
        return nil;
    }
    
    char *buffer = malloc(attributeLength);
    
    getxattr([url fileSystemRepresentation], attributeName, buffer, attributeLength, 0, 0);
    
    NSString *attributeValue = [[NSString alloc] initWithBytes:buffer length:attributeLength encoding:NSUTF8StringEncoding];
    
    free(buffer);
    
    return attributeValue;
}

@end
