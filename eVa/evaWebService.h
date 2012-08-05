//
//  evaWebService.h
//  eVa
//
//  Created by Ashkan Nasseri on 8/1/12.
//  Copyright (c) 2012 Ashkan Nasseri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface evaWebService : NSObject

-(NSDictionary*) loginForUser:(NSString*) userName withPassword: (NSString*) password;
- (NSString *)urlEncodeValue:(NSString *)str;
@end