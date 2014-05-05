//
//  GetCodeViewController.m
//  JuKeBao
//
//  Created by loohcs on 14-4-28.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import "GetCodeViewController.h"
#import "PasswordViewController.h"
@interface GetCodeViewController ()

@end

@implementation GetCodeViewController

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
    
    self.navigationItem.title = @"获取验证码";
    
    _securityCodeText = [[UITextField alloc] initWithFrame:CGRectMake(30, 170, 80, 30)];
    _securityCodeText.placeholder = @"验证码";
    _securityCodeText.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:_securityCodeText];
    
    _sendCode = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _sendCode.frame = CGRectMake(120, 170, 80, 30);
    [_sendCode setTitle:@"发送验证码" forState:UIControlStateNormal];
    [_sendCode addTarget:self action:Nil forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sendCode];
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 170, 70, 30)];
    _timeLabel.font = [UIFont systemFontOfSize:14.0];
    _timeLabel.tintColor = [UIColor grayColor];
    _timeLabel.text = @"60秒";
    [self.view addSubview:_timeLabel];
    
    UIButton *next = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    next.frame = CGRectMake(30, 270, 260, 30);
    [next setTitle:@"下一步" forState:UIControlStateNormal];
    [next addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
}

- (void)nextAction
{
    PasswordViewController *passwordVC = [[PasswordViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:passwordVC];
    [self presentViewController:navi animated:YES completion:^{
        
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
