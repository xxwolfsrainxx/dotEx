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
     dotExViewController *nextView = [self.storyboard instantiateViewControllerWithIdentifier:@"homeScreen"];
     [self.navigationController pushViewController:nextView animated:YES];
}
-(IBAction)submitSignUpPressed:(id)sender
{
    NSNumber *secretQuestion = [NSNumber numberWithInt:(1)];
    NSString *myphp = @"http://yus.dyndns-server.com/insertScript.php";
    NSURL *url = [NSURL URLWithString:myphp];
    if(_email.text = nil)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"@Sign Up" message:@"@Error a email must be present and of the form abc@example.com." delegate:self cancelButtonTitle:nil otherButtonTitles:@"@OK", nil];
        [alert show];
        _email.text = @"";
    }
    BOOL check = FALSE;
    for(int i = 0; i < [_email.text length]; i++)
    {
        if([_email.text characterAtIndex:i] == '@')
        {
            check = TRUE;
        }
    }
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
}
- (void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    NSString *responseString = [request responseString];
    NSLog(@"%@", responseString);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"@Sign Up" message:responseString delegate:self cancelButtonTitle:nil otherButtonTitles:@"@OK", nil];
    [alert show];
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
