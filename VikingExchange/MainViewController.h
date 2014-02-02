//
//  MainViewController.h
//  VikingExchange
//
//  Created by Landon Alder on 1/31/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDelegate>

@property (weak, atomic) IBOutlet UITableView * pTable;
@property (weak, atomic) IBOutlet UIButton * pPost;

@end
