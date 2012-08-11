//
//  evaUser.m
//  eVa
//
//  Created by Ashkan Nasseri on 7/31/12.
//  Copyright (c) 2012 Ashkan Nasseri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@implementation EvaUser
@synthesize userName = _userName;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize token = _token;
@synthesize psk = _psk;

- (id) initWithNSDictionary: (NSDictionary *) dictFromJSON{
    self = [super init];
    if (self){
        self.firstName = [dictFromJSON valueForKeyPath:@"firstName"];
        self.lastName = [dictFromJSON valueForKeyPath:@"lastName"];
        self.userName = [dictFromJSON valueForKeyPath:@"user"];
        self.token = [dictFromJSON valueForKeyPath:@"token"];
    }
    return self;
    
}


@end
