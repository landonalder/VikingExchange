//
//  LoginViewController.m
//  VikingExchange
//
//  Created by Landon Alder on 1/31/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "User.h"
#import "ObjectFactory.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    self.title = @"Login";
    UIGestureRecognizer * tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    tapRecognizer.cancelsTouchesInView = FALSE;
    [self.view addGestureRecognizer:tapRecognizer];
    [self.pLogin addTarget:self action:@selector(loginTapped:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)loginTapped:(id)sender
{
    [ObjectFactory setUser:[[User alloc] initWithName:self.pUsername.text password:self.pPassword.text email:Nil]];
    UIViewController * main = [[MainViewController alloc] init];
    [self.navigationController setViewControllers:[NSArray arrayWithObject:main] animated:YES];
}

-(void)hideKeyboard:(UIGestureRecognizer *)sender
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
