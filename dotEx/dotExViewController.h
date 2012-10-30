//
//  dotExViewController.h
//  dotEx
//
//  Created by jhlim3 on 9/20/12.
//  Copyright (c) 2012 fuzzy-nian-ninja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dotExViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIButton *Login;
@property (strong, nonatomic) IBOutlet UIButton *Sign_Up;
@property (strong, nonatomic) IBOutlet UIButton *forgotPasswordButton;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *accountName;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *reEnteredPassword;
@property (strong, nonatomic) IBOutlet UITextField *secretAnswer;
//blah

@end
