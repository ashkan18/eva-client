//
//  EvaRegisterUserViewController.m
//  eVa
//
//  Created by Ashkan Nasseri on 8/8/12.
//  Copyright (c) 2012 Ashkan Nasseri. All rights reserved.
//

#import "EvaRegisterUserViewController.h"
#import "EvaMainPageControllerViewController.h"
#import "evaWebService.h"
#import "evaUser.h"

@interface EvaRegisterUserViewController ()

@end

@implementation EvaRegisterUserViewController
@synthesize errorMessage;
@synthesize loading;
@synthesize email;
@synthesize password;
@synthesize confirmPassword;
@synthesize firstName;
@synthesize lastName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setEmail:nil];
    [self setPassword:nil];
    [self setConfirmPassword:nil];
    [self setFirstName:nil];
    [self setLastName:nil];
    [self setLoading:nil];
    [self setErrorMessage:nil];
    [self setLoading:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)registerUser:(id)sender{
    evaWebService* webService = [[evaWebService alloc] init];
    
    [webService setDelegate:self];
    [self.lastName resignFirstResponder];
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
            evaUser *user = [[evaUser alloc] init];
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
    
    [webService registerUser:email.text withPassword:password.text andFirstName:firstName.text andLastName:lastName.text];
}

@end
