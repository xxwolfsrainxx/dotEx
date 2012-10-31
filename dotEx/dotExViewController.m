//
//  dotExViewController.m
//  dotEx
//
//  Created by jhlim3 on 9/20/12.
//  Copyright (c) 2012 fuzzy-nian-ninja. All rights reserved.
//

#import "dotExViewController.h"
#import "ASIFormDataRequest.h"

@interface dotExViewController ()
@end

@implementation dotExViewController
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize secretAnswer = _secretAnswer;
@synthesize email = _email;
@synthesize accountName = _accountName;
@synthesize password = _password;
@synthesize reEnteredPassword = _reEnteredPassword;
- (void)viewDidLoad
{
    [super viewDidLoad];
    //....
    //....
    //Setting the textField's properties
    //....
    //The next line is important!!
    self.firstName.delegate = self; //self references the viewcontroller or view your textField is on
    self.reEnteredPassword.delegate = self;
    self.lastName.delegate = self;
    self.secretAnswer.delegate = self;
    self.email.delegate = self;
    self.accountName.delegate = self;
    self.password.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
-(IBAction)signUpPressed:(id)sender
{
    dotExViewController *nextView = [self.storyboard instantiateViewControllerWithIdentifier:@"signUp"];
    [self.navigationController pushViewController:nextView animated:YES];
}
-(IBAction)forgotButtonPressed:(id)sender
{
    dotExViewController *nextView = [self.storyboard instantiateViewControllerWithIdentifier:@"forgotPassword"];
    [self.navigationController pushViewController:nextView animated:YES];
}
-(IBAction)loginPressed:(id)sender
{
     dotExViewController *nextView = [self.storyboard instantiateViewControllerWithIdentifier:@"homeScreen"];
     [self.navigationController pushViewController:nextView animated:YES];
}
-(IBAction)submitSignUpPressed:(id)sender
{
    NSNumber *secretQuestion = [NSNumber numberWithInt:(1)];
    NSString *myphp = @"http://yus.dyndns-server.com/insertScript.php";
    NSURL *url = [NSURL URLWithString:myphp];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setPostValue:_firstName.text forKey:@"firstName"];
    [request setPostValue:secretQuestion forKey:@"secretQuestion"];
    [request setPostValue:_lastName.text forKey:@"lastName"];
    [request setPostValue:_password.text forKey:@"userPassword"];
    [request setPostValue:_accountName.text forKey:@"userName"];
    [request setPostValue:_email.text forKey:@"email"];
    [request setPostValue:_secretAnswer.text forKey:@"secretAnswer"];
    [request startAsynchronous];
    NSString *response = [request responseString];
    if([response isEqualToString:@"User Created"])
    {
        NSLog(@"User Created");
    }
    
}
- (IBAction)sendertextFieldShouldReturn:(id)textField
{
    [textField resignFirstResponder];
}
@end
