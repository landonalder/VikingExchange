//
//  ObjectFactory.h
//  VikingExchange
//
//  Created by Landon Alder on 2/1/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"
#import "User.h"

@interface ObjectFactory : NSObject

+(Post *)getPost:(NSUInteger)number;
+(void)addPost:(Post *)post;
+(void)setPost:(Post *)post number:(NSUInteger)number;
+(NSMutableArray *)getPosts;
+(void)setUser:(User *)u;
+(User *)getUser;

+(UIColor *)getBlue;

@end
