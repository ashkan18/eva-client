//
//  Parking.h
//  eVa
//
//  Created by Ashkan Nasseri on 8/11/12.
//  Copyright (c) 2012 Ashkan Nasseri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parking : NSObject

@property (nonatomic, copy) NSNumber* user;
@property (nonatomic, copy) NSString* address1;
@property (nonatomic, copy) NSString* address2;
@property (nonatomic, copy) NSString* city;
@property (nonatomic, copy) NSString* state;
@property (nonatomic, copy) NSString* country;
@property (nonatomic, copy) NSString* latitude;
@property (nonatomic, copy) NSString* longtitude;
@end
