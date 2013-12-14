//
//  User.h
//  MarketMate.0.1
//
//  Created by KhoaVu on 11/13/13.
//  Copyright (c) 2013 KhoaVu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic, strong)NSString *social_id;
@property(nonatomic, readwrite)int social_type_id;
@property(nonatomic, strong)NSString *user_name;
@property(nonatomic, strong)NSString *password;
@property(nonatomic, strong)NSString *email_address;
@property(nonatomic, strong)NSString *first_name;
@property(nonatomic, strong)NSString *last_name;
@property(nonatomic, strong)NSString *date_of_birth;
@property(nonatomic, strong)NSString *number_phone;
@property(nonatomic, strong)NSString *avatar;
@property(nonatomic, strong)NSString *address;
@property(nonatomic, strong)NSString *token;

-(void)initDataWithDictionary:(NSDictionary*)dictionary;

@end
