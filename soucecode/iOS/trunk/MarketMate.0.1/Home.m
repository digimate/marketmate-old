//
//  Home.m
//  MarketMate.0.1
//
//  Created by KhoaVu on 11/14/13.
//  Copyright (c) 2013 KhoaVu. All rights reserved.
//

#import "Home.h"
#import "Register.h"
#import "Contact.h"
#import "Login.h"
#import <QuartzCore/QuartzCore.h>

@interface Home (){
    
    Slider *bot_banner;
}

@end

@implementation Home

- (id)initHome
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
        
    [self.navigationItem setHidesBackButton:YES];
    
    UIImageView *imageMaketMate = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_marketmate.png"]];
    [imageMaketMate setFrame:CGRectMake(5, 10, 155, 23)];
    
    [self.navigationController.navigationBar addSubview:imageMaketMate];
    
    UIButton *bt_search = [[UIButton alloc] initWithFrame:CGRectMake(280, 10, 25, 25)];
    [bt_search setBackgroundImage:[UIImage imageNamed:@"ic_search.png"] forState:UIControlStateNormal];
        
    MenuBar *menuBar = [[MenuBar alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 45) withTag:1];
    
    menuBar.menuBarDelegate = self;
    
    [self.view addSubview:menuBar];
    
    // init UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 45, self
                                                                              .view.frame.size.width, screenHeight - self.navigationController.navigationBar.frame.size.height - menuBar.frame.size.height)];
    
    scrollView.contentSize = CGSizeMake(screenWidth, 568 - self.navigationController.navigationBar.frame.size.height - menuBar.frame.size.height);
    
    [self.view addSubview: scrollView];
    
    UIButton *dot1 = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth/2 - 14 , 10, 7, 7)];
    
    [dot1 setBackgroundImage:[UIImage imageNamed:@"dot_active.png"] forState:UIControlStateNormal];
    
    [scrollView addSubview:dot1];
    
    UIButton *dot2 = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth/2 - 3.5 , 10, 7, 7)];
    
    [dot2 setBackgroundImage:[UIImage imageNamed:@"dot_non_active.png"] forState:UIControlStateNormal];
    
    [scrollView addSubview:dot2];
    
    UIButton *dot3 = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth/2 + 7 , 10, 7, 7)];
    
    [dot3 setBackgroundImage:[UIImage imageNamed:@"dot_non_active.png"] forState:UIControlStateNormal];
    
    [scrollView addSubview:dot3];
    
    
    UIImageView *top_banner = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ads_top_01.png"]];
    
    [top_banner setFrame:CGRectMake(0, 25, screenWidth, 145)];
    
    [scrollView addSubview:top_banner];
     
       
    // init icon button
    
    NSMutableArray *icons = [[NSMutableArray alloc] initWithCapacity:6];
    [icons addObject:@"ic_nearby.png"];
    [icons addObject:@"ic_toprate.png"];
    [icons addObject:@"ic_topfollows.png"];
    [icons addObject:@"ic_recent.png"];
    [icons addObject:@"ic_topview.png"];
    [icons addObject:@"ic_allcategory.png"];
    
    NSMutableArray *titles =[[NSMutableArray alloc] initWithCapacity:6];
    [titles addObject:@"Near by"];
    [titles addObject:@"Top Rate"];
    [titles addObject:@"Top Follow"];
    [titles addObject:@"Recents"];
    [titles addObject:@"Top View"];
    [titles addObject:@"All Category"];
    
    for (int i = 0; i<6; i++) {
        
            
        IconButton *icon = [[IconButton alloc] initIconButtonWithFrame:CGRectMake(screenWidth/2 + ((i%3)-1)*80 -24 , 200 + (i/3)*80, 48, 41.5) withImage:[icons objectAtIndex:i] withTag:i];
    
        icon.iconButtonDelegate = self;
    
        [scrollView addSubview:icon];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2 + ((i%3)-1)*80 -30 , 248 + (i/3)*80 , 60, 20)];
        
        title.font = [UIFont systemFontOfSize:11];
        
        [title setTextAlignment:NSTextAlignmentCenter];
        
        [title.layer setBorderWidth:0.0];
        
        [title setText:[titles objectAtIndex:i]];
        
        [scrollView addSubview:title];
        
        
    }
    
//    UIImageView *bot_banner = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ad_bot_01.png"]];
//    
//    [bot_banner setFrame:CGRectMake(0, scrollView.contentSize.height - 115, screenWidth, 95.5)];
//    
//    [scrollView addSubview:bot_banner];
    
    bot_banner = [[Slider alloc] initWithFrame:CGRectMake(0, scrollView.contentSize.height - 115, screenWidth, 95.5)];
    
    bot_banner.delegate = self;
    [bot_banner setDelay:3]; // Delay between transitions
    [bot_banner setTransitionDuration:1]; // Transition duration
    [bot_banner setTransitionType:KASlideShowTransitionFade]; // Choose a transition type (fade or slide)
    [bot_banner setImagesContentMode:UIViewContentModeScaleAspectFill]; // Choose a content mode for images to display
    [bot_banner addImagesFromResources:@[@"ad_bot_01.png",@"ad_bot_02.png",@"ad_bot_03.png"]]; // Add images from resources
    [scrollView addSubview:bot_banner];
    [bot_banner start];
    
}

-(void)pressIconButton:(UIButton *)icon{
    
}

-(void)buttonBarPress:(UIButton *)button{
    
    if (button.tag == 2) {
        
        Login *loginView = [[Login alloc] initLogin];
        [self.navigationController pushViewController:loginView animated:YES];
    }
    
    else if (button.tag == 3) {
        Register *registerView = [[Register alloc] initRegister];
        
        [self.navigationController pushViewController:registerView animated:YES];
    }
    
    else if (button.tag == 4){
        
        Contact *contactView = [[Contact alloc] initContact];
        
        [self.navigationController pushViewController:contactView animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
