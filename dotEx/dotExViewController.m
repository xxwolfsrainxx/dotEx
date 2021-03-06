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
NSString *responseString;
@implementation dotExViewController
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize secretAnswer = _secretAnswer;
@synthesize email = _email;
@synthesize accountName = _accountName;
@synthesize password = _password;
@synthesize reEnteredPassword = _reEnteredPassword;
@synthesize forgotAccountName = _forgotAccountName;
@synthesize forgotSecretAnswer = _forgotSecretAnswer;
@synthesize forgotEmail = _forgotEmail;
@synthesize loginPassword = _loginPassword;
@synthesize loginUserName = _loginUserName;
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
    self.loginUserName.delegate = self;
    self.loginPassword.delegate = self;
    self.lastName.delegate = self;
    self.secretAnswer.delegate = self;
    self.email.delegate = self;
    self.accountName.delegate = self;
    self.password.delegate = self;
    self.forgotAccountName.delegate = self;
    self.forgotEmail.delegate = self;
    self.forgotSecretAnswer.delegate = self;
    self.loginPassword.secureTextEntry = YES;
    self.password.secureTextEntry = YES;
    self.reEnteredPassword.secureTextEntry = YES;
    
    self.scroller.contentSize = self.scrollContent.frame.size;
    //[self.scroller scrollRectToVisible:CGRectMake(0, 499, 320, 2) animated:YES];
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
    NSString *myphp = @"http://yus.dyndns-server.com/loginScript.php";
    NSURL *url = [NSURL URLWithString:myphp];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDelegate:self];
    [request setPostValue:_loginPassword.text forKey:@"userPassword"];
    [request setPostValue:_loginUserName.text forKey:@"userName"];
    [request startAsynchronous];
    if([responseString isEqualToString:@"true"])
    {
     dotExViewController *nextView = [self.storyboard instantiateViewControllerWithIdentifier:@"homeScreen"];
     [self.navigationController pushViewController:nextView animated:YES];
    }
    else if([responseString isEqualToString:@"false"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"@Alert" message:@"Invalid UserName or Password" delegate:self cancelButtonTitle:nil otherButtonTitles:@"@OK", nil];
        [alert show];
    }
}
-(IBAction)submitForgotPasswordPressed:(id)sender
{
    //validate accoutName
    if(![_forgotAccountName.text isEqualToString:@""]){
    
    }
    else if(![_forgotEmail.text isEqualToString:@""]){
        
    }
}
-(IBAction)submitSignUpPressed:(id)sender
{
    NSNumber *secretQuestion = [NSNumber numberWithInt:(1)];
    NSString *myphp = @"http://yus.dyndns-server.com/insertScript.php";
    NSURL *url = [NSURL URLWithString:myphp];
    BOOL checkEmailOne, checkEmailTwo, checkPassword = FALSE;
    for(int i = 0; i < [_email.text length]; i++)
    {
        if([_email.text characterAtIndex:i] == '@')
        {
            checkEmailOne = TRUE;
            break;
        }
        else
            checkEmailOne = FALSE;
    }
    if ([_email.text rangeOfString:@".com"].location == NSNotFound)
    {
        checkEmailTwo = FALSE;
    }
    else
    {
        checkEmailTwo = TRUE;
    }
    if([_password.text isEqualToString:_reEnteredPassword.text])
        checkPassword = TRUE;
    if([_firstName.text length] == 0 || [_lastName.text length] == 0 || [_secretAnswer.text length] == 0 || [_email.text length] == 0 || [_accountName.text length] == 0 || [_password.text length] == 0 || [_reEnteredPassword.text length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sign Up" message:@"Error: You must enter input for all fields." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    else if(checkEmailOne == FALSE || checkEmailTwo == FALSE)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sign Up" message:@"Error: A email must be of the form abc@example.com." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        _email.text = @"";
    }
    else if(checkPassword == FALSE)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sign Up" message:@"Error: Your passwords do not match." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        _password.text = @"";
        _reEnteredPassword.text = @"";
    }
    else if([_password.text length] < 6)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sign Up" message:@"Error: A valid password must be 6 characters or greater." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        _password.text = @"";
        _reEnteredPassword.text = @"";
    }
    else
    {
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        [request setDelegate:self];
        [request setPostValue:_firstName.text forKey:@"firstName"];
        [request setPostValue:secretQuestion forKey:@"secretQuestion"];
        [request setPostValue:_lastName.text forKey:@"lastName"];
        [request setPostValue:_password.text forKey:@"userPassword"];
        [request setPostValue:_accountName.text forKey:@"userName"];
        [request setPostValue:_email.text forKey:@"email"];
        [request setPostValue:_secretAnswer.text forKey:@"secretAnswer"];
        [request startAsynchronous];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"@Alert" message:responseString delegate:self cancelButtonTitle:nil otherButtonTitles:@"@OK", nil];
        [alert show];
    }
}
- (void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    NSString *theString = [request responseString];
    theString = [theString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSLog(@"%@", theString);
    responseString = theString;
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@"Request Failed");
    NSLog(@"%@", error);
}

- (IBAction)sendertextFieldShouldReturn:(id)textField
{
    [textField resignFirstResponder];
}
@end
