//
//  MenuBar.m
//  MarketMate.0.1
//
//  Created by KhoaVu on 11/14/13.
//  Copyright (c) 2013 KhoaVu. All rights reserved.
//

#import "MenuBar.h"

@implementation MenuBar

- (id)initWithFrame:(CGRect)frame withTag:(int)tag
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = frame.size.width;
        //CGFloat screenHeight = screenRect.size.height;
        
        UIButton * bt_guest = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, screenWidth*0.25, 45)];
        [bt_guest setTitle:@"GUEST" forState:UIControlStateNormal];
        
        [bt_guest setBackgroundColor:[UIColor blackColor]];
        
        bt_guest.titleLabel.font = [UIFont systemFontOfSize:11.0];
        
        bt_guest.tag = 1;
        
        [bt_guest addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:bt_guest];
        
        UIButton * bt_login = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth*0.25, 0, screenWidth*0.25, 45)];
        [bt_login setTitle:@"LOG IN" forState:UIControlStateNormal];
        
        [bt_login setBackgroundColor:[UIColor blackColor]];
        
        bt_login.titleLabel.font = [UIFont systemFontOfSize:11.0];
        
        bt_login.tag = 2;
        
        [bt_login addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:bt_login];
        
        UIButton * bt_sign_up = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth*0.5, 0, screenWidth*0.25, 45)];
        [bt_sign_up setTitle:@"SIGN UP" forState:UIControlStateNormal];
        
        [bt_sign_up setBackgroundColor:[UIColor blackColor]];
        
        bt_sign_up.titleLabel.font = [UIFont systemFontOfSize:11.0];
        
        bt_sign_up.tag = 3;
        
        [bt_sign_up addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:bt_sign_up];
        
        UIButton * bt_contact_us = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth*0.75, 0, screenWidth*0.25, 45)];
        [bt_contact_us setTitle:@"CONTACT US" forState:UIControlStateNormal];
        
        [bt_contact_us setBackgroundColor:[UIColor blackColor]];
        
        bt_contact_us.titleLabel.font = [UIFont systemFontOfSize:11.0];
        
        bt_contact_us.tag = 4;
        
        [bt_contact_us addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt_contact_us];
        
        if (tag == 1) {
            [bt_guest setBackgroundColor:[self getUIColorObjectFromHexString:@"#4f4f4f" alpha:1.0]];
        }
        
        else if (tag == 2){
            [bt_login setBackgroundColor:[self getUIColorObjectFromHexString:@"#4f4f4f" alpha:1.0]];
        }
        
        else if (tag == 3){
            [bt_sign_up setBackgroundColor:[self getUIColorObjectFromHexString:@"#4f4f4f" alpha:1.0]];
        }
        
        else if (tag == 4){
            [bt_contact_us setBackgroundColor:[self getUIColorObjectFromHexString:@"#4f4f4f" alpha:1.0]];
        }
        
        
    }
    return self;
}

- (UIColor *)getUIColorObjectFromHexString:(NSString *)hexStr alpha:(CGFloat)alpha
{
    // Convert hex string to an integer
    unsigned int hexint = [self intFromHexString:hexStr];
    
    // Create color object, specifying alpha as well
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:alpha];
    
    return color;
}

- (unsigned int)intFromHexString:(NSString *)hexStr
{
    unsigned int hexInt = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    
    // Scan hex value
    [scanner scanHexInt:&hexInt];
    
    return hexInt;
}

-(IBAction)buttonPress:(id)sender{

    [self.menuBarDelegate buttonBarPress:(UIButton*)sender];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
