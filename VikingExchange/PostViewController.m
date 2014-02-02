//
//  PostViewController.m
//  VikingExchange
//
//  Created by Landon Alder on 1/31/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

#import "PostViewController.h"
#import "Post.h"
#import "User.h"
#import "ObjectFactory.h"
#import <QuartzCore/QuartzCore.h>

@interface PostViewController ()

@end

@implementation PostViewController

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
    self.title = @"Post Offer";
    [self initView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)postTapped:(id)sender
{
    if ([self.pVDollars.text floatValue] > 0.0f && [self.pDollars.text floatValue] > 0.0f)
    {
        Post * newPost = [[Post alloc] initWithValues:[self.pVDollars.text floatValue]
                                              cashVal:[self.pDollars.text floatValue] user:[ObjectFactory getUser]];
        [newPost setMessage:self.pComment.text];
        [newPost setLocation:self.pLocation.text];
        [ObjectFactory addPost:newPost];
        [self.navigationController popViewControllerAnimated:YES];
    } else
    {
        [[[UIAlertView alloc] initWithTitle:Nil message:@"Both the viking and cash dollar amounts must be positive"
                                   delegate:Nil cancelButtonTitle:@"Okay" otherButtonTitles:Nil] show];
    }
}

-(void)initView
{
    UIGestureRecognizer * tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard:)];
    tapRecognizer.cancelsTouchesInView = FALSE;
    [self.view addGestureRecognizer:tapRecognizer];
    [self.pComment.layer setBorderColor:[[[UIColor lightGrayColor] colorWithAlphaComponent:0.3] CGColor]];
    [self.pComment.layer setBorderWidth:1.0];

    self.pComment.layer.cornerRadius = 5;
    self.pComment.clipsToBounds = YES;
    
    [self.pPost addTarget:self action:@selector(postTapped:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    textView.textColor = [UIColor blackColor];
    if([textView.text isEqualToString:@"Comment"])
    {
        textView.text = @"";
    }
}

-(void)hideKeyboard:(UIGestureRecognizer *)sender
{
    [self.view endEditing:YES];
}

@end
