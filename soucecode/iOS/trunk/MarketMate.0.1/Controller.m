//
//  Controller.m
//  MarketMate.0.1
//
//  Created by KhoaVu on 11/13/13.
//  Copyright (c) 2013 KhoaVu. All rights reserved.
//

#import "Controller.h"

@implementation Controller

@synthesize user;

static Controller *controller = nil;

+(Controller*)shareController{
    if (controller==nil) {
        controller = [[Controller alloc] initController];
    }
    
    return controller;
}

-(id)initController{
    self = [super init];
    user = [[User alloc] init];
    return self;
}

@end
