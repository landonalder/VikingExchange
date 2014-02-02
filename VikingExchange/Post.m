//
//  Post.m
//  VikingExchange
//
//  Created by Landon Alder on 1/31/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

#import "Post.h"
#import "User.h"

@interface Post ()

@property (atomic) float pVDollars;
@property (atomic) float pCashValue;
@property (strong, atomic) NSString * pMessage;
@property (strong, atomic) NSString * pLocation;
@property (strong, atomic) User * pUser;

@end

@implementation Post

-(id)initWithValues:(float)vDollars cashVal:(float)cashValue user:(User *)u
{
	self = [super init];
	if (self) {
		[self setVDollars:vDollars];
		[self setCashValue:cashValue];
        [self setUser:u];
	}
	return self;
}

-(float)getVDollars
{
	return self.pVDollars;
}

-(void)setVDollars:(float)vDollars
{
	self.pVDollars = vDollars;
}

-(float)getCashValue
{
	return self.pCashValue;
}

-(void)setCashValue:(float)cashValue
{
	self.pCashValue = cashValue;
}

-(NSString *)getMessage
{
	return self.pMessage;
}

-(void)setMessage:(NSString *)message
{
	self.pMessage = message;
}

-(NSString *)getLocation
{
	return self.pLocation;
}

-(void)setLocation:(NSString *)location
{
	self.pLocation = location;
}

-(User *)getUser
{
    return self.pUser;
}

-(void)setUser:(User *)u
{
    self.pUser = u;
}

@end