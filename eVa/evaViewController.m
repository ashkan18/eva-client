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
#import "evaUser.h"

@interface evaViewController ()

@end

@implementation evaViewController
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
    
    NSDictionary *response = [webService loginForUser:userName.text withPassword:password.text];
    id success = [response valueForKey: @"success"];
    if ([success intValue] == 1){
        id userPsk = [response valueForKey: @"response"];
        evaUser *user = [[evaUser alloc] init];
        [user setPsk: [[NSNumber alloc] initWithInt:[userPsk intValue]]];
        [user setFirstName:[response valueForKey:@"firstname"]];
        [user setLastName:[response valueForKey:@"lastname"]];
        // go to main page
        EvaMainPageControllerViewController *emc = [[EvaMainPageControllerViewController alloc] init];
        
        [emc setUser:user];
        
        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:emc];
        [nvc setModalPresentationStyle:UIModalPresentationFormSheet];
        [nvc setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        
        [self presentViewController:nvc animated:YES completion:nil];
        
        
    }else{
        [errorMessage setText: [NSString stringWithFormat:@"%@", [response valueForKey: @"error"]]];
    }
    
}

@end
