//
//  EvaRegisterUserViewController.h
//  eVa
//
//  Created by Ashkan Nasseri on 8/8/12.
//  Copyright (c) 2012 Ashkan Nasseri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaRegisterUserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UILabel *errorMessage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;


- (IBAction)registerUser:(id)sender;
@end
