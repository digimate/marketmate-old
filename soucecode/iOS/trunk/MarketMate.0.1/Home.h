//
//  Home.h
//  MarketMate.0.1
//
//  Created by KhoaVu on 11/14/13.
//  Copyright (c) 2013 KhoaVu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuBar.h"
#import "IconButton.h"
#import "Slider.h"

@interface Home : UIViewController<MenuBarDelegate,IconButtonDelegate,UIScrollViewDelegate,SlideDelegate>

- (id)initHome
;
@end
