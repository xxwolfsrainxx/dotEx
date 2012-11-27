//
//  dotExViewController.h
//  dotEx
//
//  Created by jhlim3 on 9/20/12.
//  Copyright (c) 2012 fuzzy-nian-ninja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
@interface dotExViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *accountName;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *reEnteredPassword;
@property (strong, nonatomic) IBOutlet UITextField *secretAnswer;
@property (strong, nonatomic) IBOutlet UITextField *forgotSecretAnswer;
@property (strong, nonatomic) IBOutlet UITextField *forgotEmail;
@property (strong, nonatomic) IBOutlet UITextField *forgotAccountName;
@property (strong, nonatomic) IBOutlet UITextField *loginUserName;
@property (strong, nonatomic) IBOutlet UITextField *loginPassword;
//blah
@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property (strong, nonatomic) IBOutlet UIView *scrollContent;

@end
