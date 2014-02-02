//
//  Post.h
//  VikingExchange
//
//  Created by Landon Alder on 1/31/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

#import "User.h"

@interface Post : NSObject

-(id)initWithValues:(float)vDollars cashVal:(float)cashValue user:(User *)u;

-(float)getVDollars;

-(void)setVDollars:(float)vDollars;

-(float)getCashValue;

-(void)setCashValue:(float)cashValue;

-(NSString*)getMessage;

-(void)setMessage:(NSString*)message;

-(User *)getUser;

-(void)setUser:(User *)u;

-(NSString *)getLocation;

-(void)setLocation:(NSString *)location;

@end