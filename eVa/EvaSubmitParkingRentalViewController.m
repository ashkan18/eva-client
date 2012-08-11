//
//  EvaSubmitParkingRentalViewController.m
//  eVa
//
//  Created by Ashkan Nasseri on 8/11/12.
//  Copyright (c) 2012 Ashkan Nasseri. All rights reserved.
//

#import "EvaSubmitParkingRentalViewController.h"

@interface EvaSubmitParkingRentalViewController ()

@end

@implementation EvaSubmitParkingRentalViewController
@synthesize address1;
@synthesize address2;
@synthesize city;
@synthesize state;
@synthesize country;
@synthesize numberOfSpots;

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
    [self setAddress1:nil];
    [self setAddress2:nil];
    [self setCity:nil];
    [self setState:nil];
    [self setCountry:nil];
    [self setNumberOfSpots:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.address1 resignFirstResponder];
    [self.address2 resignFirstResponder];
    [self.city resignFirstResponder];
    [self.state resignFirstResponder];
    [self.country resignFirstResponder];
    [self.numberOfSpots resignFirstResponder];
}


@end
