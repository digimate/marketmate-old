//
//  IconButton.h
//  MarketMate.0.1
//
//  Created by KhoaVu on 11/15/13.
//  Copyright (c) 2013 KhoaVu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IconButtonDelegate <NSObject>

-(void)pressIconButton:(UIButton*)icon;

@end

@interface IconButton : UIButton

@property(nonatomic, retain)id<IconButtonDelegate> iconButtonDelegate;

-(id)initIconButtonWithFrame:(CGRect)frame withImage:(NSString*)image withTag:(int)tag;

@end
