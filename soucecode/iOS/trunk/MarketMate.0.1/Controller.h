//
//  Controller.h
//  MarketMate.0.1
//
//  Created by KhoaVu on 11/13/13.
//  Copyright (c) 2013 KhoaVu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Controller : NSObject

@property(nonatomic, strong)User *user;

+(Controller*)shareController;

-(id)initController;
@end
