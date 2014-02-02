//
//  DetailViewController.h
//  VikingExchange
//
//  Created by Landon Alder on 2/1/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "Post.h"

@interface DetailViewController : UIViewController <MFMailComposeViewControllerDelegate>

-(id)initWithPost:(Post *)input;

@property (weak, atomic) IBOutlet UILabel * pLocation;
@property (weak, atomic) IBOutlet UITextView * pOffer;
@property (weak, atomic) IBOutlet UITextView * pComment;
@property (weak, atomic) IBOutlet UIButton * pRespond;

@end
