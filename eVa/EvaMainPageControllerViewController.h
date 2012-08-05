//
//  EvaMainPageControllerViewController.h
//  eVa
//
//  Created by Ashkan Nasseri on 8/4/12.
//  Copyright (c) 2012 Ashkan Nasseri. All rights reserved.
//

#import <UIKit/UIKit.h>

@class evaUser;

@interface EvaMainPageControllerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *welcomMessage;
@property (weak, nonatomic) IBOutlet UIButton *rentButton;
@property (weak, nonatomic) IBOutlet UIButton *sellButton;
@property (nonatomic, strong) evaUser *user;
@end
