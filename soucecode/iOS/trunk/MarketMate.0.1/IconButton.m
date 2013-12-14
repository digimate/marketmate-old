//
//  IconButton.m
//  MarketMate.0.1
//
//  Created by KhoaVu on 11/15/13.
//  Copyright (c) 2013 KhoaVu. All rights reserved.
//

#import "IconButton.h"
#import "NearMate.h"
#import "TopView.h"
#import "AllCatelogries.h"
#import "Recents.h"

@implementation IconButton

-(id)initIconButtonWithFrame:(CGRect)frame withImage:(NSString*)image withTag:(int)tag
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        
        [self addTarget:self.iconButtonDelegate action:@selector(iconPress:) forControlEvents:UIControlEventTouchUpInside];
        
        self.tag = tag;
    }
    return self;
}


-(IBAction)iconPress:(id)sender{
    
    [self.iconButtonDelegate pressIconButton:(UIButton *)sender];
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
