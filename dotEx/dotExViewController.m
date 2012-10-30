//
//  dotExViewController.m
//  dotEx
//
//  Created by jhlim3 on 9/20/12.
//  Copyright (c) 2012 fuzzy-nian-ninja. All rights reserved.
//

#import "dotExViewController.h"

@interface dotExViewController ()
@end

@implementation dotExViewController
@synthesize Login = _Login;
@synthesize Sign_Up = _Sign_Up;
@synthesize firstName = _firstName;
- (void)viewDidLoad
{
    [super viewDidLoad];
    //....
    //....
    //Setting the textField's properties
    //....
    //The next line is important!!
    self.firstName.delegate = self; //self references the viewcontroller or view your textField is on
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
    NSLog(@"%@", self.firstName.text);
    
}
- (IBAction)sendertextFieldShouldReturn:(id)textField
{
    [textField resignFirstResponder];
}
@end
