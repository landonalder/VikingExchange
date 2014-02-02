//
//  User.h
//  VikingExchange
//
//  Created by Landon Alder on 1/31/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

@interface User : NSObject

-(id)initWithName:(NSString*)username password:(NSString *)password email:(NSString *)email;

-(NSString*)getUsername;

-(void)setName:(NSString*)username;

-(void)setPassword:(NSString *)password;

-(void)setEmail:(NSString *)email;

-(NSString *)getEmail;
@end