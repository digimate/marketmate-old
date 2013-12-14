//
//  Login.h
//  MarketMate.0.1
//
//  Created by KhoaVu on 11/14/13.
//  Copyright (c) 2013 KhoaVu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuBar.h"

@interface Login : UIViewController<UITextFieldDelegate,MenuBarDelegate>

@property(nonatomic, strong) NSMutableData *receivedData;
@property(nonatomic, strong) NSURLConnection *connection;
- (id)initLogin;

@end
