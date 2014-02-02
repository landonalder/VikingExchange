//
//  PostViewController.h
//  VikingExchange
//
//  Created by Landon Alder on 1/31/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostViewController : UIViewController <UITextViewDelegate>

@property (weak, atomic) IBOutlet UITextField * pVDollars;
@property (weak, atomic) IBOutlet UITextField * pDollars;
@property (weak, atomic) IBOutlet UITextField * pLocation;
@property (weak, atomic) IBOutlet UITextView * pComment;
@property (weak, atomic) IBOutlet UIButton * pPost;

@end
