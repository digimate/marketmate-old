//
//  Login.m
//  MarketMate.0.1
//
//  Created by KhoaVu on 11/14/13.
//  Copyright (c) 2013 KhoaVu. All rights reserved.
//

#import "Login.h"
#import <QuartzCore/QuartzCore.h>
#import "SBJsonParser.h"
#import "Controller.h"
#import "Home.h"
#import "Register.h"
#import "Contact.h"


@interface Login (){
    
    UITextField *userName;
    UITextField *password;
    UIButton *bt_check_keep_login;
}

@end

@implementation Login

- (id)initLogin
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
    
    MenuBar *menuBar = [[MenuBar alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 45) withTag:2];
    
    menuBar.menuBarDelegate = self;
    
    [self.view addSubview:menuBar];
    
    [self.navigationController.navigationBar addSubview:bt_search];
    
    userName = [[UITextField alloc] initWithFrame:CGRectMake((screenWidth-255)/2, screenHeight*0.16, 255, 40)];
    
    [userName.layer setBorderWidth:1.0 ];
    
    [userName.layer setCornerRadius:17.0];
    
    [userName setTextColor:[UIColor blueColor]];
    userName.text = @"Username";
    
    userName.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    userName.leftView = paddingView1;
    userName.leftViewMode = UITextFieldViewModeAlways;
    
    [userName setReturnKeyType:UIReturnKeyDone];
    
    [userName addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [userName addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingDidBegin];
    
    [self.view addSubview:userName];
    
    password = [[UITextField alloc] initWithFrame:CGRectMake((screenWidth - 255)/2, screenHeight*0.26, 255, 40)];
    
    [password.layer setBorderWidth:1.0];
    [password.layer setCornerRadius:17.0];
    
    [password.layer setBorderWidth:1.0 ];
    
    [password.layer setCornerRadius:17.0];
    
    [password setTextColor:[UIColor blueColor]];
    password.text = @"Password";
    
    password.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    
    UIImageView *pa = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"city-ic.png"]];
    
    [pa setFrame:CGRectMake(10, 0, 20, 20)];
    
    [paddingView2 addSubview:pa];
    
    password.leftView = paddingView2;
    password.leftViewMode = UITextFieldViewModeAlways;
    
    [password setReturnKeyType:UIReturnKeyDone];
    
    [self.view addSubview:password];
    
    [password addTarget:self action:@selector(textFieldShouldReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [password addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingDidBegin];
    
    UIButton *bt_login = [[UIButton alloc] initWithFrame:CGRectMake((screenWidth-255)/2, screenHeight*0.38, 255, 40)];
    
    [bt_login setTitle:@"Login" forState:UIControlStateNormal];
    
    [bt_login.layer setCornerRadius:17.0];
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGColorSpaceRelease(colorspace);
    CGFloat components[] = {0.0, 0.0, 0.0, 1.0};
    
    CGColorRef color = CGColorCreate(colorspace, components);
    
    [bt_login.layer setBackgroundColor:color];
    
    [bt_login addTarget:self action:@selector(loginPress:) forControlEvents:UIControlEventTouchUpOutside];
    
    [self.view addSubview:bt_login];
    
    UIButton *bt_facebook = [[UIButton alloc] initWithFrame:CGRectMake((screenWidth - 204)/2, screenHeight*0.48, 204, 32)];
    [bt_facebook setBackgroundImage:[UIImage imageNamed:@"ic_facebook.png"] forState:UIControlStateNormal];
    
    [self.view addSubview:bt_facebook];
    
    UIButton *bt_twitter = [[UIButton alloc] initWithFrame:CGRectMake((screenWidth - 204)/2, screenHeight*0.56, 204, 32)];
    
    [bt_twitter setBackgroundImage:[UIImage imageNamed:@"ic_twitter.png"] forState:UIControlStateNormal];
    
    [self.view addSubview:bt_twitter];
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, screenHeight-100, screenWidth, 40)];

    [footer setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
    
    
    
    bt_check_keep_login = [[UIButton alloc] initWithFrame:CGRectMake(10, 7, 24, 21.5)];
    
    [bt_check_keep_login setBackgroundImage:[UIImage imageNamed:@"checkbox_uncheck.png"] forState:UIControlStateNormal];
    
    [bt_check_keep_login addTarget:self action:@selector(keep_login_press:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:footer];
    
    [footer addSubview:bt_check_keep_login];
    
    UIButton *bt_keep_login = [[UIButton alloc] initWithFrame:CGRectMake(40, 7, 110, 20)];
    
    [bt_keep_login setTitle:@"Keep me login" forState:UIControlStateNormal];
        
    bt_keep_login.titleLabel.font = [UIFont systemFontOfSize:16.0];
    
    [bt_keep_login addTarget:self action:@selector(keep_login_press:) forControlEvents:UIControlEventTouchUpInside];
    
    [footer addSubview:bt_keep_login];
    
    UIButton *bt_forgot_pass = [[UIButton alloc] initWithFrame:CGRectMake(184, 7, 130, 20)];
    
    NSMutableAttributedString *commentString = [[NSMutableAttributedString alloc] initWithString:@"Forgot password?"];
    
    [commentString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [commentString length])];
    
    [commentString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, 16)];
    //[button setAttributedTitle:commentString forState:UIControlStateNormal];
    
    [bt_forgot_pass setAttributedTitle:commentString forState:UIControlStateNormal];
    
    bt_forgot_pass.titleLabel.font = [UIFont systemFontOfSize:16.0];
    
    //[bt_forgot_pass setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [footer addSubview:bt_forgot_pass];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    textField.text = @"";
    [textField setTextColor:[UIColor blackColor]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


-(IBAction)keep_login_press:(id)sender{
    if ([bt_check_keep_login isSelected]) {
        [bt_check_keep_login setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
        [bt_check_keep_login setSelected:NO];
    }else {
        [bt_check_keep_login setImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateSelected];
        [bt_check_keep_login setSelected:YES];
        
    }
}

-(void)buttonBarPress:(UIButton *)button{
    
    if (button.tag == 1) {
        
        Home *homeView = [[Home alloc] initHome];
        [self.navigationController pushViewController:homeView animated:YES];
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

- (IBAction)loginPress:(id)sender {
    
    NSMutableData *data = [[NSMutableData alloc] init];
    self.receivedData = data;
    
    
    //initialize url that is going to be fetched.
    NSURL *url = [NSURL URLWithString:@"http://marketmatedemo1.freevnn.com/users/login"];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"POST"];
    //initialize a post data
    
    NSString *postData = [NSString stringWithFormat:@"user_name=%@&pass_word=%@", userName.text, password.text];
    
    //NSString *postData = @"user_name=lvlinh96&pass_word=12345678";
    //set request content type we MUST set this value.
    
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    //set post data of request
    [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    
    //initialize a connection from request
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    self.connection = connection;
    
    
    //start the connection
    [connection start];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.receivedData appendData:data];
}
/*
 if there is an error occured, this method will be called by connection
 */
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    NSLog(@"%@" , error);
}

/*
 if data is successfully received, this method will be called by connection
 */
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    //initialize convert the received data to string with UTF8 encoding
    NSString *htmlSTR = [[NSString alloc] initWithData:self.receivedData
                                              encoding:NSUTF8StringEncoding];
    //NSLog(@"%@" , htmlSTR);
    //initialize a new webviewcontroller
    
    SBJsonParser *parser=[[SBJsonParser alloc]init];
    NSDictionary *object = [parser objectWithString:htmlSTR error:nil];
    
    [[[Controller shareController] user] initDataWithDictionary:object];
    //NSLog(@"%@",object);
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
