//
//  SignUpViewController.m
//  JuKeBao
//
//  Created by loohcs on 14-4-24.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import "SignUpViewController.h"
#import "PasswordViewController.h"
#import "ServiceWebViewController.h"
#import "GetCodeViewController.h"
@interface SignUpViewController ()

@end

@implementation SignUpViewController

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
    
//    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title = @"注册";
    
    _phoneNumText = [[UITextField alloc] initWithFrame:CGRectMake(30, 120, 260, 30)];
    _phoneNumText.placeholder = @"请输入您的手机号";
    _phoneNumText.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:_phoneNumText];
    
    
    UIButton *service = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    service.frame = CGRectMake(30, 220, 260, 30);
    [service setTitle:@"服务协议" forState:UIControlStateNormal];
    [service addTarget:self action:@selector(showServiceProtocol) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:service];
    
    UIButton *next = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    next.frame = CGRectMake(30, 270, 260, 30);
    [next setTitle:@"下一步" forState:UIControlStateNormal];
    [next addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
    
    
}

- (void)showServiceProtocol
{
    ServiceWebViewController *serviceWebVC = [[ServiceWebViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:serviceWebVC];
    [self.navigationController pushViewController:navi animated:YES];
}

- (void)nextAction
{
    GetCodeViewController *codeVC = [[GetCodeViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:codeVC];
    [self presentViewController:navi animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
