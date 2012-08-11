//
//  EvaSubmitParkingRentalViewController.h
//  eVa
//
//  Created by Ashkan Nasseri on 8/11/12.
//  Copyright (c) 2012 Ashkan Nasseri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaSubmitParkingRentalViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *address1;
@property (weak, nonatomic) IBOutlet UITextField *address2;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *state;
@property (weak, nonatomic) IBOutlet UITextField *country;
@property (weak, nonatomic) IBOutlet UITextField *numberOfSpots;

-(IBAction)submit:(id)sender;
@end
