//
//  evaViewController.m
//  eVa
//
//  Created by Ashkan Nasseri on 7/31/12.
//  Copyright (c) 2012 Ashkan Nasseri. All rights reserved.
//

#import "evaViewController.h"
#import "evaWebService.h"
#import "EvaMainPageControllerViewController.h"
#import "EvaRegisterUserViewController.h"
#import "EvaUser.h"

@interface evaViewController ()

@end

@implementation evaViewController
@synthesize loading;
@synthesize userName;
@synthesize password;
@synthesize errorMessage;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setUserName:nil];
    [self setPassword:nil];
    [self setErrorMessage:nil];
    [self setLoading:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(IBAction)login:(id)sender{
    evaWebService* webService = [[evaWebService alloc] init];
    
    [webService setDelegate:self];
    [self.password resignFirstResponder];
    [self.loading setHidden: FALSE];
    
    
    
    void (^handler) (NSURLResponse *urlResponse, NSData *responseDate, NSError *error) =
    ^(NSURLResponse *urlResponse, NSData *responseData, NSError *error)
    {
        
        NSLog(@"respone = %@", responseData);
        
        NSError *parseError;
        id parsedObj = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&parseError];
        
        NSDictionary *json_dict = (NSDictionary *)parsedObj;
        NSLog(@"dict here %@" , json_dict);
        id success = [json_dict valueForKey: @"success"];
        if ([success intValue] == 1){
            id userPsk = [json_dict valueForKey: @"response"];
            EvaUser *user = [[EvaUser alloc] init];
            [user setPsk: [[NSNumber alloc] initWithInt:[userPsk intValue]]];
            [user setFirstName:[json_dict valueForKey:@"firstname"]];
            [user setLastName:[json_dict valueForKey:@"lastname"]];
            // go to main page
            EvaMainPageControllerViewController *emc = [[EvaMainPageControllerViewController alloc] init];
            
            [emc setUser:user];
            
            UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:emc];
            [nvc setModalPresentationStyle:UIModalPresentationFormSheet];
            [nvc setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
            
            [self presentViewController:nvc animated:YES completion:nil];
            
            
        }else{
            [self.loading setHidden: TRUE];
            [errorMessage setText: [NSString stringWithFormat:@"%@", [json_dict valueForKey: @"error"]]];
        }
        
    };
    
    [webService setHandler:handler];
    
    [webService loginForUser:userName.text withPassword:password.text];

    
    
}


- (IBAction)registerUser:(id)sender{
    EvaRegisterUserViewController* rvc = [[EvaRegisterUserViewController alloc]init];
    
    [self presentViewController:rvc animated:YES completion:nil];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.userName resignFirstResponder];
    [self.password resignFirstResponder];
}


@end
