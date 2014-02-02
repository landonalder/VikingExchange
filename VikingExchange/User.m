//
//  User.m
//  VikingExchange
//
//  Created by Landon Alder on 1/31/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

#import "User.h"

@interface User ()

@property (strong, atomic) NSString * pUsername;
@property (strong, atomic) NSString * pEmail;
@property (strong, atomic) NSString * pPassword;

@end

@implementation User

-(id)initWithName:(NSString*)username password:(NSString *)password email:(NSString *)email
{
	self = [super init];
    if (self)
    {
        self.pUsername = username;
        self.pPassword = password;
        self.pEmail = email;
    }
	return self;
}

-(NSString*)getUsername
{
	return self.pUsername;
}

-(void) setName:(NSString*)username
{
	self.pUsername = username;
}

-(void)setPassword:(NSString *)password
{
    self.pPassword = password;
}

-(void)setEmail:(NSString *)email
{
    self.pEmail = email;
}

-(NSString *)getEmail
{
    return self.pEmail;
}

@end