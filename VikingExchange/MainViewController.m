//
//  MainViewController.m
//  VikingExchange
//
//  Created by Landon Alder on 1/31/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

#import "MainViewController.h"
#import "PostViewController.h"
#import "DetailViewController.h"
#import "ObjectFactory.h"
#import "Post.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    [self initView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.pTable reloadData];
}

-(void)initView
{
    self.title = @"Viking Exchange";
    [self cannedData];
    self.pTable.rowHeight = 55;
    [self.pPost addTarget:self action:@selector(postTapped:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *postButton = [[UIBarButtonItem alloc] initWithTitle:@"Post"
                                                                   style:UIBarButtonItemStylePlain target:self action:@selector(postTapped:)];
    self.navigationItem.rightBarButtonItem = postButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)postTapped:(id)sender
{
    UIViewController * post = [[PostViewController alloc] init];
    [self.navigationController pushViewController:post animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[ObjectFactory getPosts] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [UITableViewCell new];
        
        Post * post = [ObjectFactory getPost:indexPath.row];
        
        UILabel * offer = [UILabel new];
        offer.frame = CGRectMake(15, 0, 300, 30);
        offer.text = [NSString stringWithFormat:@"$%.2f Viking for $%.2f USD", [post getVDollars], [post getCashValue]];
        offer.backgroundColor = [UIColor clearColor];
        [cell addSubview:offer];
        
        UILabel * username = [UILabel new];
        username.frame = CGRectMake(15, 30, 300, 15);
        username.text = [[post getUser] getUsername];
        username.textColor = [UIColor lightGrayColor];
        [username setFont:[UIFont systemFontOfSize:14]];
        username.backgroundColor = [UIColor clearColor];
        [cell addSubview:username];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController * detailview = [[DetailViewController alloc] initWithPost:[ObjectFactory getPost:indexPath.row]];
    [self.navigationController pushViewController:detailview  animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(void)cannedData
{
    User *user0 = [[User alloc] initWithName: @"LandonAlder" password:@"pass" email:@"alderl@students.wwu.edu"];
    User *user1 = [[User alloc] initWithName: @"AllenSuner" password:@"pass" email:@"sunera@students.wwu.edu"];
    User *user2 = [[User alloc] initWithName: @"ChrisReedy" password:@"pass" email:@"Chris.Reedy@wwu.edu"];
    User *user3 = [[User alloc] initWithName: @"DavidBover" password:@"pass" email:@"David.Bover@wwu.edu"];
    User *user4 = [[User alloc] initWithName: @"BarackObama" password:@"pass" email:@"obamab@students.wwu.edu"];
    User *user5 = [[User alloc] initWithName: @"DennisRitchie" password:@"pass" email:@"ritchied@students.wwu.edu"];
    User *user6 = [[User alloc] initWithName: @"AlecBaldwin" password:@"pass" email:@"baldwina@students.wwu.edu"];
    User *user7 = [[User alloc] initWithName: @"BruceShepard" password:@"pass" email:@"Bruce.Shepard@wwu.edu"];
    User *user8 = [[User alloc] initWithName: @"MasterChief" password:@"pass" email:@"chiefm@students.wwu.edu"];
    User *user9 = [[User alloc] initWithName: @"VladimirPutin" password:@"pass" email:@"putin@students.wwu.edu"];
    User *user10 = [[User alloc] initWithName: @"WalterWhite" password:@"pass" email:@"whitew@students.wwu.edu"];
    User *user11 = [[User alloc] initWithName: @"JessePinkman" password:@"pass" email:@"pinkmanj@students.wwu.edu"];
    User *user12 = [[User alloc] initWithName: @"GandalfTheGrey" password:@"pass" email:@"gandalf@students.wwu.edu"];
    User *user13 = [[User alloc] initWithName: @"EyeOfSauron" password:@"pass" email:@"sauron@students.wwu.edu"];
    User *user14 = [[User alloc] initWithName: @"GLaDOS" password:@"pass" email:@"glados@students.wwu.edu"];
    
    Post *post0 = [[Post alloc] initWithValues: 8.15 cashVal:5.00 user:user0]; 		//Lunch
    Post *post1 = [[Post alloc] initWithValues: 10.0 cashVal:7.00 user:user1]; 		//VikingDollar
    Post *post2 = [[Post alloc] initWithValues: 0.00 cashVal:10.00 user:user2];     //Dinner
    Post *post3 = [[Post alloc] initWithValues: 6.79 cashVal:4.00 user:user3];		//Breakfast
    Post *post4 = [[Post alloc] initWithValues: 9.51 cashVal:5.00 user:user4];		//Dinner
    Post *post5 = [[Post alloc] initWithValues: 15.0 cashVal:9.00 user:user5];		//VikingDollar
    Post *post6 = [[Post alloc] initWithValues: 6.79 cashVal:4.00 user:user6];		//Breakfast
    Post *post7 = [[Post alloc] initWithValues: 9.51 cashVal:5.00 user:user7];		//Dinner
    Post *post8 = [[Post alloc] initWithValues: 12.0 cashVal:9.00 user:user8];		//VikingDollar
    Post *post9 = [[Post alloc] initWithValues: 8.15 cashVal:6.00 user:user9];		//Lunch
    Post *post10 = [[Post alloc] initWithValues: 8.15 cashVal:5.00 user:user10];	//Lunch
    Post *post11 = [[Post alloc] initWithValues: 9.51 cashVal:7.00 user:user11];	//Dinner
    Post *post12 = [[Post alloc] initWithValues: 9.51 cashVal:6.00 user:user12];	//Dinner
    Post *post13 = [[Post alloc] initWithValues: 15.0 cashVal:10.00 user:user13];	//VikingDollar
    Post *post14 = [[Post alloc] initWithValues: 8.15 cashVal:6.00 user:user14];	//Lunch
    
    [post0 setMessage:@"BRKFST 4 DOLLA-DOLLA BILLZ YALL"];
    [post1 setMessage:@"vikingdollars for $"];
    [post2 setMessage:@"This post is for Wednesday, the 12th of Feb."];
    [post3 setMessage:@"Join CCDC and give me your money."];
    [post4 setMessage:@"This nation is brought together with the hard work of the American people, and VikingExchange."];
    [post5 setMessage:@"Guys... srsly, read K&R... it's awesome."];
    [post6 setMessage:@"If I talk raspier, maybe you'll respond to my post."];
    [post7 setMessage:@"WWU greatly benefits from services like VikingExchange."];
    [post8 setMessage:@"Only able to finish the fight with $9.00."];
    [post9 setMessage:@"In Soviet Russia, VikingDollars exchange you."];
    [post10 setMessage:@"Trading lunch for money, bitch."];
    [post11 setMessage:@"I am the one who knocks! Respond plz."];
    [post12 setMessage:@"You shall not pass! ...the Dining Hall doors w/o me."];
    [post13 setMessage:@"...Frodo..."];
    [post14 setMessage:@"Cake, and grief counseling, will be available at the conclusion of the test."];
    
    [post0 setLocation:@"Atrium"];
    [post1 setLocation:@"Red Square"];
    [post2 setLocation:@"Viking Union"];
    [post3 setLocation:@"Communication Facility"];
    [post4 setLocation:@"Viking Union"];
    [post5 setLocation:@"Comm Lawn"];
    [post6 setLocation:@"Old Main"];
    [post7 setLocation:@"Atrium"];
    [post8 setLocation:@"Red Square"];
    [post9 setLocation:@"Viking Union"];
    [post10 setLocation:@"Communication Facility"];
    [post11 setLocation:@"Viking Union"];
    [post12 setLocation:@"Comm Lawn"];
    [post13 setLocation:@"Old Main"];
    [post14 setLocation:@"Arntzen Hall"];
    
    [ObjectFactory addPost:post0];
    [ObjectFactory addPost:post1];
    [ObjectFactory addPost:post2];
    [ObjectFactory addPost:post3];
    [ObjectFactory addPost:post4];
    [ObjectFactory addPost:post5];
    [ObjectFactory addPost:post6];
    [ObjectFactory addPost:post7];
    [ObjectFactory addPost:post8];
    [ObjectFactory addPost:post9];
    [ObjectFactory addPost:post10];
    [ObjectFactory addPost:post11];
    [ObjectFactory addPost:post12];
    [ObjectFactory addPost:post13];
    [ObjectFactory addPost:post14];
}

@end
