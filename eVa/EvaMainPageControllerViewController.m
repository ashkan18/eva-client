//
//  EvaMainPageControllerViewController.m
//  eVa
//
//  Created by Ashkan Nasseri on 8/4/12.
//  Copyright (c) 2012 Ashkan Nasseri. All rights reserved.
//

#import "EvaMainPageControllerViewController.h"
#import "evaUser.h"

@interface EvaMainPageControllerViewController ()

@end

@implementation EvaMainPageControllerViewController
@synthesize welcomMessage;
@synthesize rentButton;
@synthesize sellButton;
@synthesize user;

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
    NSString *welcomText = [NSString stringWithFormat:@"Welcome %@ %@", user.firstName, user.lastName];
    
    [welcomMessage setText: welcomText];
}

- (void)viewDidUnload
{
    [self setRentButton:nil];
    [self setSellButton:nil];
    [self setWelcomMessage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
