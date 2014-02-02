//
//  IntroViewController.m
//  VikingExchange
//
//  Created by Landon Alder on 1/31/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

#import "IntroViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface IntroViewController ()

@end

@implementation IntroViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Viking Exchange";
    [self initView];
    [self.pLogin addTarget:self action:@selector(loginTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.pRegister addTarget:self action:@selector(registerTapped:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)initView
{
    UIImageView * bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wwu.png"]];
    bg.frame = [[UIScreen mainScreen] bounds];
    bg.contentMode = UIViewContentModeScaleToFill;
    [self.view insertSubview:bg atIndex:0];
    
    CGRect buttonFrame = self.pLogin.frame;
    buttonFrame.size = CGSizeMake(self.pLogin.frame.size.width + 10, self.pLogin.frame.size.height + 4);
    self.pLogin.frame = buttonFrame;
    self.pLogin.layer.cornerRadius = 10;
    self.pLogin.backgroundColor = [UIColor colorWithRed:20.0f/255.0f green:20.0f/255.0f blue:20.0f/255.0f alpha:0.7];
    self.pLogin.clipsToBounds = YES;
    
    self.pRegister.layer.cornerRadius = 10;
    buttonFrame = self.pRegister.frame;
    buttonFrame.size = CGSizeMake(self.pRegister.frame.size.width + 10, self.pRegister.frame.size.height + 4);
    self.pRegister.frame = buttonFrame;
    self.pRegister.backgroundColor = [UIColor colorWithRed:20.0f/255.0f green:20.0f/255.0f blue:20.0f/255.0f alpha:0.7];
    self.pRegister.clipsToBounds = YES;
}

-(void)loginTapped:(id)sender
{
    UIViewController * login = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:login animated:YES];
    self.navigationController.navigationBarHidden = NO;
}

-(void)registerTapped:(id)sender
{
    UIViewController * r = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:r animated:YES];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
