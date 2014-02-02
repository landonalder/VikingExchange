//
//  DetailViewController.m
//  VikingExchange
//
//  Created by Landon Alder on 2/1/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import "DetailViewController.h"
#import "ObjectFactory.h"
#import "User.h"
#import "Post.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

Post * post;

-(id)initWithPost:(Post *)input
{
    self = [super init];
    if (self)
    {
        post = input;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
    // Do any additional setup after loading the view from its nib.
}

-(void)initView
{
    self.pOffer.text = [NSString stringWithFormat:@"%@ is offering $%.2f Viking for $%.2f USD",
                            [[post getUser] getUsername], [post getVDollars], [post getCashValue]];
    self.pOffer.font = [UIFont systemFontOfSize:22];
    
    self.pComment.text = [post getMessage];
    self.pComment.font = [UIFont systemFontOfSize:14];
    self.pLocation.text = [post getLocation];
    
    [self.pRespond addTarget:self action:@selector(respondTapped:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)respondTapped:(id)sender
{
    User * from = [ObjectFactory getUser];
    User * to = [post getUser];
    if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
        mailCont.mailComposeDelegate = self;
        
        [mailCont setSubject:[NSString stringWithFormat:@"Viking Exchange response from %@", from.getEmail]];
        [mailCont setToRecipients:[NSArray arrayWithObject:[to getEmail]]];
        [mailCont setMessageBody:[NSString stringWithFormat:@"Hi %@, \n \n I'd like to accept your offer for $%.2f Viking for $%.2f USD. \n\n -%@",
                                  [to getUsername], [post getVDollars], [post getCashValue], [from getUsername]] isHTML:NO];
        
        [self presentViewController:mailCont animated:YES completion:^(void){}];
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self dismissViewControllerAnimated:YES completion:^(void){}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
