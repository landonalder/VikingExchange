//
//  ObjectFactory.m
//  VikingExchange
//
//  Created by Landon Alder on 2/1/14.
//  Copyright (c) 2014 WWU. All rights reserved.
//

#import "ObjectFactory.h"
#import "Post.h"
#import "User.h"

@implementation ObjectFactory

NSMutableArray * posts;
User * user;

+(Post *)getPost:(NSUInteger)number
{
    return [posts objectAtIndex:number];
}

+(void)addPost:(Post *)post
{
    if (!posts)
    {
        posts = [NSMutableArray new];
    }
    [posts addObject:post];
}

+(void)setPost:(Post *)post number:(NSUInteger)number
{
    [posts setObject:post atIndexedSubscript:number];
}

+(NSMutableArray *)getPosts
{
    return posts;
}

+(UIColor *)getBlue
{
    return [UIColor colorWithRed:0 green:62.f/255.f blue:135.f/255.f alpha:1.0];
}

+(void)setUser:(User *)u
{
    user = u;
}

+(User *)getUser
{
    return user;
}

@end
