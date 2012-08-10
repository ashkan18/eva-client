//
//  evaWebService.m
//  eVa
//
//  Created by Ashkan Nasseri on 8/1/12.
//  Copyright (c) 2012 Ashkan Nasseri. All rights reserved.
//

#import "evaWebService.h"

@implementation evaWebService

@synthesize delegate;
@synthesize handler;

-(void) loginForUser:(NSString *)userName withPassword:(NSString *)password{
    NSString *ghEventsAPIRUL = @"http://192.168.0.106:5000/user/login";
    NSURL *url = [[NSURL alloc]initWithString:ghEventsAPIRUL];
    
    
    NSString *myRequestString =  [NSString stringWithFormat:@"un=%@&pw=%@", userName, password];
    NSData *myRequestData = [ NSData dataWithBytes: [ myRequestString UTF8String ] length: [ myRequestString length ] ];
    NSMutableURLRequest *request = [ [ NSMutableURLRequest alloc ] initWithURL: url];
    
    
    
    
    [ request setHTTPMethod: @"POST" ];
    [ request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [ request setHTTPBody: myRequestData ];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:self.handler];
    
}

- (void) registerUser:(NSString *)email withPassword:(NSString *)password andFirstName:(NSString *)firstName andLastName:(NSString *)lastName{
    NSString *ghEventsAPIRUL = @"http://192.168.0.106:5000/user/reg";
    NSURL *url = [[NSURL alloc]initWithString:ghEventsAPIRUL];
    
    
    NSString *myRequestString =  [NSString stringWithFormat:@"email=%@&pw=%@&firstname=%@&lastname=%@", email, password, firstName, lastName];
    
    NSData *myRequestData = [ NSData dataWithBytes: [ myRequestString UTF8String ] length: [ myRequestString length ] ];
    NSMutableURLRequest *request = [ [ NSMutableURLRequest alloc ] initWithURL: url];
    
    
    [ request setHTTPMethod: @"POST" ];
    [ request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [ request setHTTPBody: myRequestData ];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:self.handler];
}
                      
- (NSString *)urlEncodeValue:(NSString *)str
{
    return str;
}
@end
