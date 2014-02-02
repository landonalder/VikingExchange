//
//  LoginViewController.h
//  VikingExchange
//
//  Created by Landon Alder on 1/31/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, atomic) IBOutlet UITextField * pUsername;
@property (weak, atomic) IBOutlet UITextField * pPassword;

@property (weak, atomic) IBOutlet UIButton * pLogin;

@end
