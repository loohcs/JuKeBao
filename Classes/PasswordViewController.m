//
//  PasswordViewController.m
//  JuKeBao
//
//  Created by loohcs on 14-4-24.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import "PasswordViewController.h"
#import "MarketCustomersViewController.h"
@interface PasswordViewController ()

@end

@implementation PasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.navigationItem.title = @"确定密码";
    
    _password = [[UITextField alloc] initWithFrame:CGRectMake(30, 120, 260, 30)];
    _password.placeholder = @"请您输入6-18位字母或者数字";
    _password.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:_password];
    
    _passwordAgain = [[UITextField alloc] initWithFrame:CGRectMake(30, 170, 260, 30)];
    _passwordAgain.placeholder = @"请您再次输入密码";
    _passwordAgain.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:_passwordAgain];
    
    UIButton *next = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    next.frame = CGRectMake(30, 270, 260, 30);
    [next setTitle:@"下一步" forState:UIControlStateNormal];
    [next addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
}

- (void)nextAction
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
//    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [self presentViewController:loginVC animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
