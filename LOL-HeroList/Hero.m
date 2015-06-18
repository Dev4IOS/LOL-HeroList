//
//  Hero.m
//  LOL-HeroList
//
//  Created by zhengna on 15/6/17.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "Hero.h"

@implementation Hero

-(instancetype)initWithDict:(NSDictionary *)dict{
    
    if(self = [super init]){
        //way1:
//        self.icon = [dict[@"icon"] copy];
//        self.name = [dict[@"name"] copy];
//        self.intro = [dict[@"intro"] copy];
        //way2:
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+ (instancetype)heroWithDict:(NSDictionary *)dict{

    return [[self alloc] initWithDict:dict];
}

@end
