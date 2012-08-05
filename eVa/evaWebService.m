//
//  evaWebService.m
//  eVa
//
//  Created by Ashkan Nasseri on 8/1/12.
//  Copyright (c) 2012 Ashkan Nasseri. All rights reserved.
//

#import "evaWebService.h"

@implementation evaWebService

-(NSDictionary*) loginForUser:(NSString *)userName withPassword:(NSString *)password{
    NSString *ghEventsAPIRUL = @"http://192.168.0.106:5000/user/login";
    NSURL *url = [[NSURL alloc]initWithString:ghEventsAPIRUL];
    
    
    NSString *myRequestString =  [NSString stringWithFormat:@"un=%@&pw=%@", userName, password];
    NSData *myRequestData = [ NSData dataWithBytes: [ myRequestString UTF8String ] length: [ myRequestString length ] ];
    NSMutableURLRequest *request = [ [ NSMutableURLRequest alloc ] initWithURL: url];
    
    
    [ request setHTTPMethod: @"POST" ];
    [ request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    [ request setHTTPBody: myRequestData ];
    NSURLResponse *response;
    NSError *err;
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse:&response error:&err];
    NSString *content = [NSString stringWithUTF8String:[returnData bytes]];
    NSLog(@"responseData: %@", content);

    NSError *parseError;
    id parsedObj = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:&parseError];
    
    NSDictionary *json_dict = (NSDictionary *)parsedObj;
    NSLog(@"dict here %@" , json_dict);
    
    return json_dict;
}
                      
                      
- (NSString *)urlEncodeValue:(NSString *)str
{
    return str;
}
@end
