//
//  evaViewController.h
//  eVa
//
//  Created by Ashkan Nasseri on 7/31/12.
//  Copyright (c) 2012 Ashkan Nasseri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface evaViewController : UIViewController<NSURLConnectionDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UILabel *errorMessage;
@property (nonatomic, retain) NSURLResponse* response;
@property (nonatomic, retain) NSMutableData* responseData;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;

- (IBAction)login:(id)sender;

@end
