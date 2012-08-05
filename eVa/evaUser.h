//
//  evaUser.h
//  eVa
//
//  Created by Ashkan Nasseri on 7/31/12.
//  Copyright (c) 2012 Ashkan Nasseri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface evaUser : NSObject

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSNumber *psk;


- (id) initWithNSDictionary: (NSDictionary *) dictFromJSON;

@end
