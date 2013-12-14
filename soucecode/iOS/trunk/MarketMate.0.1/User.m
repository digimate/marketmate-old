//
//  User.m
//  MarketMate.0.1
//
//  Created by KhoaVu on 11/13/13.
//  Copyright (c) 2013 KhoaVu. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize user_name, password,number_phone, last_name,first_name, email_address, token,social_type_id,social_id,address,avatar,date_of_birth;

-(void)initDataWithDictionary:(NSDictionary *)dictionary{
    
    self.social_type_id = [[dictionary objectForKey:@"social+id"] intValue];
    self.token  = [dictionary objectForKey:@"token"];
    self.user_name = [[dictionary objectForKey:@"user"] objectForKey:@"user_name"];
    self.password = [[dictionary objectForKey:@"user"] objectForKey:@"password"];
    self.email_address = [[dictionary objectForKey:@"user"] objectForKey:@"email_address"];
    self.first_name = [[dictionary objectForKey:@"user"] objectForKey:@"first_name"];
    self.last_name = [[dictionary objectForKey:@"user"] objectForKey:@"last_name"];
    self.number_phone = [[dictionary objectForKey:@"user"] objectForKey:@"number_phone"];
}


@end
