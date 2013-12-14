//
//  MenuBar.h
//  MarketMate.0.1
//
//  Created by KhoaVu on 11/14/13.
//  Copyright (c) 2013 KhoaVu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuBarDelegate <NSObject>

-(void)buttonBarPress:(UIButton*)button;

@end

@interface MenuBar : UIView

@property(nonatomic, retain)id<MenuBarDelegate> menuBarDelegate;

- (id)initWithFrame:(CGRect)frame withTag:(int)tag;

@end
