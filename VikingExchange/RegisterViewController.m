//
//  RegisterViewController.m
//  VikingExchange
//
//  Created by Landon Alder on 1/31/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

#import "RegisterViewController.h"
#import "MainViewController.h"
#import "ObjectFactory.h"
#import "User.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Register";
    [self.pRegister addTarget:self action:@selector(registerTapped:) forControlEvents:UIControlEventTouchUpInside];
    UIGestureRecognizer * tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    tapRecognizer.cancelsTouchesInView = FALSE;
    [self.view addGestureRecognizer:tapRecognizer];
    // Do any additional setup after loading the view from its nib.
}

-(void)registerTapped:(id)sender
{
    [self checkEmail];
}

-(void)hideKeyboard:(UIGestureRecognizer *)sender
{
    [self.view endEditing:YES];
}

-(void)checkEmail
{
    if ([self.pEmail.text hasSuffix:@"wwu.edu"])
    {
        [ObjectFactory setUser:[[User alloc] initWithName:self.pUsername.text password:self.pPassword.text email:self.pEmail.text]];
        UIViewController * vc = [[MainViewController alloc] init];
        [self.navigationController setViewControllers:[NSArray arrayWithObject:vc] animated:YES];
    } else
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:Nil message:@"The email must be a valid WWU email address."
                                                        delegate:Nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
