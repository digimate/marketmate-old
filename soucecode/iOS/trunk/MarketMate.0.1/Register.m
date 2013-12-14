//
//  Register.m
//  MarketMate.0.1
//
//  Created by KhoaVu on 11/15/13.
//  Copyright (c) 2013 KhoaVu. All rights reserved.
//

#import "Register.h"
#import "Home.h"
#import "Login.h"
#import "Contact.h"

@interface Register ()

@end

@implementation Register

- (id)initRegister
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
    
    UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_loginpage.png"]];
    
    [bg setFrame:CGRectMake(0, -self.navigationController.navigationBar.frame.size.height -568 + screenHeight, screenWidth, 568)];
    
    [self.view addSubview:bg];
    
    MenuBar *menuBar = [[MenuBar alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 45) withTag:1];
    
    menuBar.menuBarDelegate = self;
    
    [self.view addSubview:menuBar];
}

-(void)buttonBarPress:(UIButton *)button{
    
    if (button.tag == 1) {
        Home *homeView = [[Home alloc] initHome];
        
        [self.navigationController pushViewController:homeView animated:YES];
    }
    
    else if (button.tag == 2) {
        
        Login *loginView = [[Login alloc] initLogin];
        [self.navigationController pushViewController:loginView animated:YES];
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
